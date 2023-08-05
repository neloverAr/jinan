import 'package:get/get.dart';
import 'package:school/app/data/providers/readNotification.dart';
import 'package:school/app/data/providers/showNotification.dart';
import '../../core/class/crud.dart';
import '../../core/class/status_request.dart';
import '../../data/models/notification.dart';
import '../../data/services/storage/services.dart';
import '../../functions/calculateUnRead.dart';
import '../../functions/handling_data.dart';

class NotificationController extends GetxController {
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  Rx<StatusRequest> statusRequest2 = StatusRequest.success.obs;
  ShowNotificationData notificationData = ShowNotificationData(Crud());
  List<NotificationModel> notificationList = [];
  StorageService storageService = Get.find();
  ReadNotificationData readNotificationData = ReadNotificationData(Crud());
  RxInt numberOfUnread = 0.obs;

  Future getData() async{
    statusRequest.value = StatusRequest.loading;
    var response = await notificationData.getData(storageService.read("token"));
    statusRequest.value = handlingData(response);

    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        try{
          var notificationLists = response['data']['notifications'] as List;
          notificationList = notificationLists.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
          numberOfUnread.value = calculateUnRead(notificationList);
        }catch(_){
          //No notification
        }

      }else{
        //Get.defaultDialog(title: "⚠",middleText:response['message']);
        statusRequest.value = StatusRequest.failure;
      }
    }
  }

  refreshData(){
    getData();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  readNotification() async{
    statusRequest2.value = StatusRequest.loading;
    var response = await readNotificationData.getData(storageService.read("token"));
    statusRequest2.value = handlingData(response);

    if(StatusRequest.success == statusRequest2.value){
      if(response['status']==true){
        try{
          calculateUnReadController();
          //var notificationLists = response['data']['notifications'] as List;
          //notificationList = notificationLists.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
        }catch(_){
          //No notification
        }
      }else{
        //Get.defaultDialog(title: "⚠",middleText:response['message']);
        statusRequest2.value = StatusRequest.failure;
      }
    }
  }

   calculateUnReadController(){
    getData();
    if(statusRequest.value==StatusRequest.success) {
      numberOfUnread.value = calculateUnRead(notificationList);
      print("un read is: ${numberOfUnread.value}");
    }
    //return calculateUnRead(notificationList);
  }

}

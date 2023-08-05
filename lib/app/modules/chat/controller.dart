import 'package:get/get.dart';
import 'package:school/app/data/models/Chat.dart';
import 'package:school/app/data/providers/chatData.dart';
import '../../core/class/crud.dart';
import '../../core/class/status_request.dart';
import '../../data/services/storage/services.dart';
import '../../functions/handling_data.dart';

class ChatController extends GetxController {

  ChatData chatData = ChatData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  List<Chat> data= [];
  StorageService storageService = Get.find();

  getData() async{
    statusRequest.value = StatusRequest.loading;
    var response = await chatData.getData(storageService.read("token"));
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        var chatList = response['data']['chats'] as List;
        data = chatList.map<Chat>((json) => Chat.fromJson(json)).toList();
      }else{
        //Get.defaultDialog(title: "⚠",middleText:"Not Parent User");
        statusRequest.value = StatusRequest.failure;
      }
    }
  }

  refreshData() {
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
}

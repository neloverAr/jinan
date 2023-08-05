import 'package:get/get.dart';
import 'package:school/app/data/providers/adsDetails.dart';
import 'package:school/app/data/providers/dailyCoverageDetails.dart';
import 'package:school/app/data/providers/studentSubjects.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/class/status_request.dart';
import '../../../../data/models/EventSummery.dart';
import '../../../../data/providers/activitiesDetails.dart';
import '../../../../data/services/storage/services.dart';
import '../../../../functions/handling_data.dart';

class EventDescController extends GetxController {

  StudentSubjectsData subjectsData = StudentSubjectsData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  EventSummery eventData = EventSummery(id: 0,name: "",subDescription: "",description: "",
      type: "",file: "",video: "",image: "",images: [],status: "",day: "",createdAt: ""
  );
  StorageService storageService = Get.find();

  getData(int id,String type) async{
    dynamic data;
    if(type=="activities"){
      data = ActivitiesDetailsData(Crud());

    }else if(type=="ads"){
      data = AdsDetailsData(Crud());
    }else{
      data = DailyCoverageDetailsData(Crud());
    }
    statusRequest.value = StatusRequest.loading;
    var response = await data.getData(storageService.read("token"),storageService.read("sonID"),id);
    statusRequest.value = handlingData(response);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        eventData = EventSummery.fromJson(response['data']['App information']);
        //eventData.images = [];
        //eventData.images!.add(eventData.image!);
      }else{
        //Get.defaultDialog(title: "⚠",middleText:"Not Parent User");
        statusRequest.value = StatusRequest.failure;
      }
    }
  }

  @override
  void onInit() {
    int id = Get.arguments["id"];
    String type = Get.arguments["type"];
    getData(id, type);
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
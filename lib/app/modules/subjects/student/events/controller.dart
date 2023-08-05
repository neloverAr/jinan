
import 'package:get/get.dart';
import 'package:school/app/data/models/subjectEvent.dart';
import 'package:school/app/data/providers/subjectEventData.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/class/status_request.dart';
import '../../../../data/services/storage/services.dart';
import '../../../../functions/handling_data.dart';

class SubjectEventsController extends GetxController {

  SubjectEventData subjectEventData = SubjectEventData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  List<SubjectEvent> events= [];
  StorageService storageService = Get.find();

  getData(int subjectID) async{
    statusRequest.value = StatusRequest.loading;
    var response = await subjectEventData.getData(storageService.read("token"),storageService.read("sonID"),subjectID);
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        var adsList = response['data']['Subjects'] as List;
        events = adsList.map<SubjectEvent>((json) => SubjectEvent.fromJson(json)).toList();
      }else{
        //Get.defaultDialog(title: "⚠",middleText:"Not Parent User");
        statusRequest.value = StatusRequest.failure;
      }
    }
  }


  @override
  void onInit() {
    int id = Get.arguments["subjectID2"];
    getData(id);
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


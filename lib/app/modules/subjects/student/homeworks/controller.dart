import 'package:get/get.dart';
import 'package:school/app/data/models/subjectHomework.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/class/status_request.dart';
import '../../../../data/providers/SubjectAdditionalDetailHomework.dart';
import '../../../../data/services/storage/services.dart';
import '../../../../functions/handling_data.dart';

class SubjectHomeworksController extends GetxController {

  SubjectAdditionalDetailHomeworkData subjectsData = SubjectAdditionalDetailHomeworkData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  List<SubjectHomework> homeworks= [];
  StorageService storageService = Get.find();

  getData(int subjectID) async{
    statusRequest.value = StatusRequest.loading;
    var response = await subjectsData.getData(storageService.read("token"),storageService.read("sonID"),subjectID);
    statusRequest.value = handlingData(response);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        var homeworksList = response['data']['Subjects'] as List;
        homeworks = homeworksList.map<SubjectHomework>((json) => SubjectHomework.fromJson(json)).toList();
      }else{
        statusRequest.value = StatusRequest.failure;
      }
    }
  }

  @override
  void onInit() {
    getData(Get.arguments['subjectID2']);
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
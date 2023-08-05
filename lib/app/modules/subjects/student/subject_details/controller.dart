import 'package:get/get.dart';

import '../../../../core/class/crud.dart';
import '../../../../core/class/status_request.dart';
import '../../../../data/models/student_subjects_details.dart';
import '../../../../data/providers/studentSubjectsDetails.dart';
import '../../../../data/services/storage/services.dart';
import '../../../../functions/handling_data.dart';

class SubjectDetailsController extends GetxController {

  StudentSubjectsDetailsData subjectsData = StudentSubjectsDetailsData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  StudentSubjectDetails data= StudentSubjectDetails(arName: "",id: 1);
  StorageService storageService = Get.find();

  getData(int subjectID) async {
    statusRequest.value = StatusRequest.loading;
    var response = await subjectsData.getData(storageService.read("token"),storageService.read("sonID"),subjectID);
    statusRequest.value = handlingData(response);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        var sub = response['data']['Student subjects'] ;
       // chapters = chaptersList.map<StudentSubjectDetails>((json) => StudentSubjectDetails.fromJson(json)).toList();
        data = StudentSubjectDetails.fromJson(sub);
      }else{
        statusRequest.value = StatusRequest.failure;
      }
    }
  }

  @override
  void onInit() {
    int subjectID = Get.arguments["subjectID"];
    getData(subjectID);
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

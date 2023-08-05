import 'package:get/get.dart';
import 'package:school/app/data/models/teacher_semester.dart';
import 'package:school/app/data/providers/teacherSemestersData.dart';

import '../../core/class/crud.dart';
import '../../core/class/status_request.dart';
import '../../data/services/storage/services.dart';
import '../../functions/handling_data.dart';

class TeacherSemestersController extends GetxController {
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  TeacherSemestersData semestersData = TeacherSemestersData(Crud());
  List<TeacherSemester> semesters = [];
  StorageService storageService = Get.find();

  Future getData() async{
    statusRequest.value = StatusRequest.loading;
    var response = await semestersData.getData(storageService.read("token"));
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){

        var semestersList = response['data']['Teacher semesters'] as List;

        semesters = semestersList.map<TeacherSemester>((json) => TeacherSemester.fromJson(json)).toList();

      }else{
        //Get.defaultDialog(title: "⚠",middleText:response['message']);
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

import 'package:get/get.dart';
import 'package:school/app/data/models/teacherSubjects.dart';
import '../../../core/class/crud.dart';
import '../../../core/class/status_request.dart';
import '../../../data/providers/teacherSubjectsData.dart';
import '../../../data/services/storage/services.dart';
import '../../../functions/handling_data.dart';

class TeacherSubjectsController extends GetxController {
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  TeacherSubjectsData subjectsData = TeacherSubjectsData(Crud());
  List<TeacherSubjects> subjects = [];
  StorageService storageService = Get.find();

  Future getData() async{
    statusRequest.value = StatusRequest.loading;
    var response = await subjectsData.getData(storageService.read("token"));
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){

        var subjectsList = response['data']['Teacher subjects'] as List;
        subjects = subjectsList.map<TeacherSubjects>((json) => TeacherSubjects.fromJson(json)).toList();

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

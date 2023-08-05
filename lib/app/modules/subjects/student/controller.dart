
import 'package:get/get.dart';
import 'package:school/app/data/models/Student_subject.dart';
import 'package:school/app/data/providers/studentSubjects.dart';
import '../../../core/class/crud.dart';
import '../../../core/class/status_request.dart';
import '../../../data/services/storage/services.dart';
import '../../../functions/handling_data.dart';

class StudentSubjectController extends GetxController {
  StudentSubjectsData subjectsData = StudentSubjectsData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  List<StudentSubjects> data= [];
  StorageService storageService = Get.find();

  getData() async{
    statusRequest.value = StatusRequest.loading;
    var response = await subjectsData.getData(storageService.read("token"),storageService.read("sonID"));
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        var subjectsList = response['data']['Student subjects'] as List;
        data = subjectsList.map<StudentSubjects>((json) => StudentSubjects.fromJson(json)).toList();
      }else{
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


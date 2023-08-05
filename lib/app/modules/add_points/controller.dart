
import 'package:get/get.dart';
import 'package:school/app/data/models/reasonForEvaluation.dart';
import 'package:school/app/data/providers/add_point.dart';
import 'package:school/app/data/providers/reasonsForEvaluationData.dart';
import '../../core/class/crud.dart';
import '../../core/class/status_request.dart';
import '../../data/models/student.dart';
import '../../data/providers/teacherSemesterStudents.dart';
import '../../data/services/storage/services.dart';
import '../../functions/handling_data.dart';
import '../home/teacher/controller.dart';

class AddPointsController extends GetxController {
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  TeacherSemesterStudentsData semestersData = TeacherSemesterStudentsData(Crud());
  List<Student> semesterStudents = [];
  StorageService storageService = Get.find();
  ////////////////
  Rx<StatusRequest> statusRequest2 = StatusRequest.success.obs;
  ReasonsForEvaluationData reasonsForEvaluationData = ReasonsForEvaluationData(Crud());
  List<ReasonsForEvaluation> reasonsForEvaluation = [];
  ///////////////
  Rx<StatusRequest> statusRequest3 = StatusRequest.success.obs;
  AddPointsData addPointsData = AddPointsData(Crud());
  ///////////////
  RxInt reasonID = 11.obs;


  Future getData(String semesterID) async{
    statusRequest.value = StatusRequest.loading;
    var response = await semestersData.getData(storageService.read("token"),semesterID);
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        var semestersList = response['data']['Teacher students'] as List;
        semesterStudents = semestersList.map<Student>((json) => Student.fromJson(json)).toList();

      }else{
        //Get.defaultDialog(title: "⚠",middleText:response['message']);
        statusRequest.value = StatusRequest.failure;
      }
    }
  }
 /////////////////
  Future getReasonsForEvaluation() async{
    statusRequest2.value = StatusRequest.loading;
    var response = await reasonsForEvaluationData.getData(storageService.read("token"));
    statusRequest2.value = handlingData(response);
    print(statusRequest2.value);
    if(StatusRequest.success == statusRequest2.value){
      if(response['status']==true){
        var reasonsForEvaluationList = response['data']['Reasons for evaluation'] as List;
        reasonsForEvaluation = reasonsForEvaluationList.map<ReasonsForEvaluation>((json) => ReasonsForEvaluation.fromJson(json)).toList();

      }else{
        //Get.defaultDialog(title: "⚠",middleText:response['message']);
        statusRequest2.value = StatusRequest.failure;
      }
    }
  }
 ////////////////

  @override
  void onInit() {
    String id = "${Get.arguments["semesterID"]}";
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

  changeNo(int id){
    reasonID.value = id;
  }

 updatePoints(int points,Student std){
    std.totalPoint = std.totalPoint!  + points;
 }

  Future addPoints(String reasonsForEvaluationID,String studentID) async{
    statusRequest3.value = StatusRequest.loading;
    var response = await addPointsData.postData(storageService.read("token"),studentID,
    {
      "reasons_for_evaluation_id":reasonsForEvaluationID,
      "point":"1"
    }
    );
    statusRequest3.value = handlingData(response);

    if(StatusRequest.success == statusRequest3.value){
      if(response['status']==true){
        Get.defaultDialog(title: "",middleText:"Points Added Successfully");
        HomeTeacherController teacherController = Get.find();
        teacherController.refreshData();
      }else{
        //Get.defaultDialog(title: "⚠",middleText:response['message']);
        statusRequest3.value = StatusRequest.failure;
      }
    }
  }

}


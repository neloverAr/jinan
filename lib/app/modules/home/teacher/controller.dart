import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/data/models/classModel.dart';
import 'package:school/app/data/models/student.dart';
import 'package:school/app/data/models/teacherSubjects.dart';
import 'package:school/app/data/providers/teacherHomeData.dart';
import 'package:school/app/data/providers/teacherParentsData.dart';
import '../../../core/class/crud.dart';
import '../../../core/class/status_request.dart';
import '../../../data/models/honory_board.dart';
import '../../../data/models/teacherParents.dart';
import '../../../data/services/storage/services.dart';
import '../../../functions/handling_data.dart';
import '../../search/view.dart';

class HomeTeacherController extends GetxController with  GetSingleTickerProviderStateMixin{
  final tabIndex = 0.obs;
  late List<Student> students;
  late TextEditingController searchText;
  ///////////
  final studentsList = <Student>[];
  final classList = <ClassModel>[];
  ///////////
  Rx<StatusRequest> statusRequest2 = StatusRequest.success.obs;
  TeacherParentsData teacherParentsData = TeacherParentsData(Crud());
  List<TeacherParents> teacherParents = [];
  ///////
  late AnimationController animationController;
  var isActivated = false.obs;
  Rx<bool> expanded = false.obs;
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  TeacherHomeData homeData = TeacherHomeData(Crud());
  List<HonoraryBoard> honorBoard = [];
  List<TeacherSubjects> subjects = [];
  StorageService storageService = Get.find();
  late String token;
  late String fName;
  //NotificationServices notificationServices = NotificationServices ();

  initialData(){
    //initialMessage();
    fName = storageService.read("firstName");
    token = storageService.read("token");

  }

  getData() async{
    statusRequest.value = StatusRequest.loading;
    var response = await homeData.getData(storageService.read("token"),);
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){

        var honorList = response['data']['Honorary board'] as List;
        var subjectsList = response['data']['Teacher subjects'] as List;

        honorBoard = honorList.map<HonoraryBoard>((json) => HonoraryBoard.fromJson(json)).toList();
        subjects = subjectsList.map<TeacherSubjects>((json) => TeacherSubjects.fromJson(json)).toList();

      }else{
        //Get.defaultDialog(title: "⚠",middleText:response['message']);
        statusRequest.value = StatusRequest.failure;
      }
    }
  }

  refreshData() {
    fName = storageService.read("firstName");
    getData();
  }

  @override
  void onInit() {
   initialData();
   getData();
    animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 250));
   getTeacherParents();
   searchText = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    animationController.dispose();
    searchText.dispose();
    super.onClose();
  }

  void changeTabIndex(int index){
    tabIndex.value = index;
  }

  startAnimation(){
    expanded.value = (!expanded.value);
    if(animationController.status==AnimationStatus.completed){
      animationController.reverse();
    }else{
      animationController.forward();
    }
  }

  void searchSubjects(String text){
    final suggestions = subjects.where((element){
      final subjectNameAr = element.arName!.toLowerCase();
      final subjectNameEn = element.enName!.toLowerCase();
      final query = text.toLowerCase();
      return subjectNameEn.contains(query)||subjectNameAr.contains(query);
    }).toList();
    Get.to(()=>SearchingList(items:suggestions,query:text));
  }

  getTeacherParents() async{
    statusRequest2.value = StatusRequest.loading;
    var response = await teacherParentsData.getData(storageService.read("token"),);
    statusRequest2.value = handlingData(response);
    print(statusRequest2.value);
    if(StatusRequest.success == statusRequest2.value){
      if(response['status']==true){

        var teacherParentsList = response['data']['Teacher parents'] as List;
        teacherParents = teacherParentsList.map<TeacherParents>((json) => TeacherParents.fromJson(json)).toList();
      }else{
        //Get.defaultDialog(title: "⚠",middleText:response['message']);
        statusRequest2.value = StatusRequest.failure;
      }
    }
  }


}

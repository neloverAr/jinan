import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/keys.dart';
import 'package:school/app/data/models/EventSummery.dart';
import 'package:school/app/data/models/Student_subject.dart';
import 'package:school/app/data/models/homework.dart';
import 'package:school/app/data/models/student_subjects_details.dart';
import 'package:school/app/data/providers/homeData.dart';
import 'package:school/app/data/providers/studentTeachers.dart';
import 'package:school/app/data/services/storage/services.dart';
import 'package:school/app/modules/notifications/view.dart';
import 'package:school/app/modules/search/view.dart';
import '../../../core/class/crud.dart';
import '../../../core/class/status_request.dart';
import '../../../data/models/user.dart';
import '../../../data/providers/adsDetails.dart';
import '../../../data/providers/studentSubjectsDetails.dart';
import '../../../functions/handling_data.dart';

class HomeController extends GetxController {
  final tabIndex = 0.obs;
  final chipIndex = 0.obs;

  ////////////
  final isLoading = true.obs;
  late TextEditingController searchText;
  HomeData homeData = HomeData(Crud());
  AdsDetailsData adsDetailsData = AdsDetailsData(Crud());
  StudentSubjectsDetailsData studentSubjectDetailsData = StudentSubjectsDetailsData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  StorageService storageService = Get.find();
  //////////
  Rx<StatusRequest> statusRequest2 = StatusRequest.success.obs;
  StudentTeachersData studentTeachersData = StudentTeachersData(Crud());
  List<User> studentTeachers = [];

  late String token;
  late int id;
  late StudentSubjectDetails studentSubjectDetails ;

  late String fName;
  final count = 0.obs;
  List<StudentSubjects> subjects = [];
  List<Homework> homeworks = [];
  List<EventSummery> ads = [];

  initialMessage() async{
    var message = FirebaseMessaging.instance.getInitialMessage();
    if(message!=null){
      Get.to(()=>NotificationScreen());
    }

  }

  initialData(){
    //initialMessage();
      fName = storageService.read("sonName");
      token = storageService.read("token");
      id = storageService.read("sonID");

  }

  Future getData() async{
    // NotificationController notificationController = Get.find();
    // notificationController.calculateUnReadController();

    statusRequest.value = StatusRequest.loading;
    var response = await homeData.getData(storageService.read("token"),id);
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){

        var subjectsList = response['data']['Student subjects'] as List;
        var homeworksList = response['data']['Homeworks'] as List;
        var adsList = response['data']['Ads'] as List;

        subjects = subjectsList.map<StudentSubjects>((json) => StudentSubjects.fromJson(json)).toList();
        homeworks = homeworksList.map<Homework>((json) => Homework.fromJson(json)).toList();
        ads = adsList.map<EventSummery>((json) => EventSummery.fromJson(json)).toList();
      }else{
        //Get.defaultDialog(title: "⚠",middleText:response['message']);
        statusRequest.value = StatusRequest.failure;
      }
    }
  }
  ///////////
  Future getStudentTeachers() async{
    statusRequest2.value = StatusRequest.loading;
    var response = await studentTeachersData.getData(storageService.read("token"),
        storageService.read("sonID")
    );
    statusRequest2.value = handlingData(response);
    print(statusRequest2.value);
    if(StatusRequest.success == statusRequest2.value){
      if(response['status']==true){
        var studentTeachersList = response['data']['Student teachers'] as List;
        studentTeachers = studentTeachersList.map<User>((json) => User.fromJson(json)).toList();
      }else{
        //Get.defaultDialog(title: "⚠",middleText:response['message']);
        statusRequest2.value = StatusRequest.failure;
      }
    }
  }

  refreshData() {
    getData();
  }

  @override
  void onInit() {
    initialData();
    getData();
    searchText = TextEditingController();

    FirebaseMessaging.onMessageOpenedApp.listen((event){
      Get.to(()=>NotificationScreen());
      //print("object");
    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //searchText.dispose();
    super.onClose();
  }

  void changeTabIndex(int index){
    tabIndex.value = index;
  }

  void changeChipIndex(int value){
    chipIndex.value=value;
  }


  getSubjectName(int subjectID){
    for(int i=0;i<subjects.length;++i){
      if(subjects[i].id==subjectID){
        return subjects[i].name;
      }
    }
  }

  String getLang(){
   if(storageService.read(langKey)=="ar") {
     return "ar";
   }
   return "en";

  }

  void searchSubjects(String text){
    final suggestions = subjects.where((element){
      final subjectName = element.name!.toLowerCase();
      final query = text.toLowerCase();
      return subjectName.contains(query);
    }).toList();
    Get.to(()=>SearchingList(items:suggestions,query:text));
  }

  goToDescData(int id) async {
    Get.toNamed("/event-desc-screen",arguments:{
      "id":id,
      "type":"ads"
    });
  }

  goToDescDataSubject(int id) async {
    Get.toNamed("/subject-details",arguments:{
      "subjectID":id,
    });
  }

   Future<bool> sendFcmMessage() async {
    getStudentTeachers();
    String name = "${storageService.read("sonName")} ${storageService.read("fullName")}";
    bool status = true;
    studentTeachers.forEach((element) async {
      try {
        var url = 'https://fcm.googleapis.com/fcm/send';
        var header = {
          "Content-Type": "application/json",
          "Authorization":
          "key=AAAA3s5-hr4:APA91bENeQdrcB5at6SoO9qkYETDu6-LV2tr18y14jGr-1OIJs2zU3yVYm8P3sgAmSShq9YKcThkMJPfR2rLE-9wm2yFjL_A-V8W0F2L1044NiwMs3Kst7VB7YK6p5IS7vaw5KB_YmRZ",
        };
        var request = {
          'notification': {
            'title': "نداء الخروج",
            'body': "طلب خروج ${name} من الروضة "},
          'data': {
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'type': 'COMMENT'
          },
          'to': element.fcmToken
        };

        var response = await http.post(Uri.parse(url), headers: header, body: json.encode(request));
      } catch (e, s) {
        print(e);
        status = false;
      }
    });
    return status;
  }
}
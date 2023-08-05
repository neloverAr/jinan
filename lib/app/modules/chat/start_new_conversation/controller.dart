import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:school/app/data/models/teacherParents.dart';
import 'package:school/app/data/models/user.dart';
import 'package:school/app/data/services/storage/services.dart';
import 'package:school/app/modules/home/student/home_controller.dart';
import '../../../core/class/crud.dart';
import '../../../core/class/status_request.dart';
import '../../../data/providers/sendMessage.dart';
import '../../../functions/handling_data.dart';
import '../../home/teacher/controller.dart';
import '../controller.dart';

class SendNewMessageController extends GetxController {
  late TextEditingController message;
  late Rx<PlatformFile?> pickedFile = PlatformFile(name: '', size: 2).obs;
  StorageService storageService = Get.find();
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  late String receiverName ;
  late List<String> items;
  SendMessageData sendMessageData = SendMessageData(Crud());
  ChatController chatController = Get.find();
  late Map<String,int> receiversID;

  @override
  void onInit() {
    message = TextEditingController();

    if(storageService.read("type")=="parents"){
      receiversID = getParentReceivers();
      //print(receiversID);
    }else{
     receiversID = getTeacherReceivers();
    }
    items = receiversID.keys.toList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    message.dispose();
    super.onClose();
  }

  Future selectFile() async{
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if(result==null) return;
    pickedFile.value = result.files.first;
  }

  void changeReceiverName(String? newReceiver) {
    receiverName= newReceiver!;
  }

  void submit(String messageText,int receiverID,[File? file]) async{
    statusRequest.value = StatusRequest.loading;
    var response = await sendMessageData.postData(storageService.read("token"),receiverID,
        {
          "message":messageText,
        },file
    );
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        //Get.defaultDialog(title: "",middleText:"Sent Successfully");
        pickedFile= PlatformFile(name: '', size: 2).obs;
        message.text="";
        chatController.getData();
        Get.back();
      }else{
        //Get.defaultDialog(title: "⚠",middleText:"Not Parent User");
        statusRequest.value = StatusRequest.failure;
      }
    }
  }

  getTeacherReceivers(){
    HomeTeacherController homeTeacherController = Get.find();
    List<TeacherParents> data = homeTeacherController.teacherParents;
    Map<String,int> temp={};

    data.forEach((element) {
      temp["${element.firstName}"] = element.id!;
    });

    return temp;
  }

  Map<String,int> getParentReceivers(){
    HomeController homeController = Get.find();
    List<User> data = homeController.studentTeachers;
    //print(data);
    Map<String,int> temp={};

    data.forEach((element) {
      temp[element.fullName!] = element.id!;
    });

    return temp;
  }
}


import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/modules/chat/controller.dart';
import 'package:school/app/modules/home/teacher/controller.dart';
import '../../../core/class/crud.dart';
import '../../../core/class/status_request.dart';
import '../../../core/constants/routes.dart';
import '../../../data/services/storage/services.dart';
import '../../../functions/handling_data.dart';
import '../profile_view/controller.dart';
import '../student/controller.dart';

class ProfileEditController extends GetxController {
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  Crud crud = Crud();
  StorageService storageService = Get.find();
  late Rx<PlatformFile?> pickedImage = PlatformFile(name: '', size: 2).obs;

  late TextEditingController fNameController;
  late TextEditingController lNameController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late String imageUrl;
 // File? image;

  postData() async{
    String lName = lNameController.text.isNotEmpty?lNameController.text:" ";
    print(lName);
    var response;
    statusRequest.value = StatusRequest.loading;
    if(pickedImage.value!.name==""){
      await crud.postDataWithHeaders(AppRoute.updateProfile, {
        "first_name":fNameController.text,
        "last_name":lName,
        "email":emailController.text,
        "mobile":"${storageService.read("mobile")}",
      }, {
        "Authorization":"Bearer ${storageService.read("token")}",
        "Accept-Language":"ar",
      });
    }else{
      response = await crud.postDataWithProfileImage(AppRoute.updateProfile, {
        "first_name":fNameController.text,
        "last_name":lName,
        "email":emailController.text,
        "mobile":"${storageService.read("mobile")}",
      },File(pickedImage.value!.path!)
        // File(image!.path)
      );
    }
    statusRequest.value = handlingData(response);
    if(StatusRequest.success == statusRequest.value){
      Get.defaultDialog(title:"",middleText:"Profile Edited Successfully");

      SettingsController settingsController = Get.find();
      ProfileController profileController = Get.find();
      ChatController chatController = Get.find();

      settingsController.refreshData();
      profileController.getData();
      chatController.getData();

      storageService.write("firstName",fNameController.text);
      storageService.write("lastName",lNameController.text);
      storageService.write("fullName","${fNameController.text} ${lNameController.text}");
      storageService.write("email",emailController.text);
      storageService.write("profileImage",pickedImage.value!.path!);

      if(storageService.read("type")!="parents"){
        storageService.write("firstName", fNameController.text);
        HomeTeacherController teacherController = Get.find();
        teacherController.refreshData();
      }
      // if(response['status']==true){
      //
      // }else{
      //   statusRequest.value = StatusRequest.failure;
      // }
    }
  }

  @override
  void onInit() {
    fNameController = TextEditingController();
    lNameController = TextEditingController();
    lNameController.text = "";
    emailController = TextEditingController();
    addressController = TextEditingController();
    //image = File(Get.arguments["profileImage"]);

    String fName = Get.arguments["fName"];
    String lName = Get.arguments["lName"];
    String email = Get.arguments["email"];
    String profileImage = Get.arguments["profileImage"];
    //pickedImage.value = PlatformFile();
        //File(Get.arguments["profileImage"]);
    fNameController.text = fName;
    lNameController.text = lName;
    emailController.text = email;
    imageUrl = profileImage;

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
      fNameController.dispose();
      lNameController.dispose();
      emailController.dispose();
      addressController.dispose();
    super.onClose();
  }

  Future pickImage() async{
   var picked = await FilePicker.platform.pickFiles(type:FileType.image);
   if(picked==null) return;
   pickedImage.value = picked.files.first;
  }

}


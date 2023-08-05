
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:school/app/core/class/crud.dart';
import 'package:school/app/data/providers/login.dart';
import 'package:school/app/modules/home/teacher/view.dart';
import '../../../core/class/status_request.dart';
import '../../../data/services/storage/services.dart';
import '../../../functions/handling_data.dart';
import '../../parent_child_selection/view.dart';

class LoginController extends GetxController{
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  Rx<bool> obscure = true.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginData loginData = LoginData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
   List<Map<String,dynamic>> data= [];
  StorageService storageService = Get.find();
  late String fcmToken;
  var response;
  login() async{
    if (formKey.currentState!.validate()){
      statusRequest.value = StatusRequest.loading;
      response = await loginData.postData(phoneController.text,
          passwordController.text,fcmToken);
      statusRequest.value = handlingData(response);
      //print(statusRequest.value);
      if(StatusRequest.success == statusRequest.value){
        if(response['status']==true){
          //print(response['data']);
          storageService.write("token",response['data']['token']);
          storageService.write("id",response['data']["user"]['id']);
          storageService.write("firstName",response['data']["user"]['first_name']);
          storageService.write("lastName",response['data']["user"]['first_last']);
          storageService.write("fullName",response['data']["user"]['full_name']);
          storageService.write("email",response['data']["user"]['email']);
          storageService.write("profileImage",response['data']["user"]['profile_image']);
          storageService.write("type",response['data']["user"]['type']);
          storageService.write("mobile",response['data']["user"]['mobile']);
          storageService.write("step","2");
          int userID = storageService.read("id");
          FirebaseMessaging. instance.subscribeToTopic("users$userID");

          if(response['data']["user"]['type']=="parents"){
            Get.offAll(()=>ChildSelectionScreen());
          }else{
            Get.offAll(()=>TeacherHomeScreen());
          }

        }else{
          Get.defaultDialog(title: "⚠",middleText:response['message']);
          statusRequest.value = StatusRequest.failure;
        }
      }
      //update();
    }
  }

  @override
  void onInit() async{
   phoneController = TextEditingController();
   passwordController = TextEditingController();
   FirebaseMessaging.instance.getToken().then((value) {
     fcmToken = value!;
     print("$value");
     //String? token = value;
     });
  super.onInit();
  }

  @override
  void onReady() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onInit();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void changeObscure(){
    obscure.value = !(obscure.value);
  }
}
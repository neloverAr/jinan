import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:school/app/data/providers/resetPasswordData.dart';
import '../../../core/class/crud.dart';
import '../../../core/class/status_request.dart';
import '../../../data/services/storage/services.dart';
import '../../../functions/handling_data.dart';

class EditPasswordController extends GetxController{
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController newPasswordConfirmationController;
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  EditPasswordData resetPasswordData = EditPasswordData(Crud());
  StorageService storageService = Get.find();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
void onInit() {
  oldPasswordController = TextEditingController();
  newPasswordController = TextEditingController();
  newPasswordConfirmationController = TextEditingController();
  super.onInit();
}

@override
void onReady() {
  super.onReady();
}

@override
void onClose() {
  oldPasswordController.clear();
  newPasswordController.clear();
  newPasswordConfirmationController.clear();
  super.onClose();
}

 resetPassword() async{
   if (formKey.currentState!.validate()){
     statusRequest.value = StatusRequest.loading;
     var response = await resetPasswordData.postData(storageService.read("token"), {
       "current_password":oldPasswordController.text,
       "new_password":newPasswordController.text,
       "new_password_confirmation":newPasswordConfirmationController.text,
     },
       // File(image!.path)
     );
     statusRequest.value = handlingData(response);

     if(StatusRequest.success == statusRequest.value){
       Get.defaultDialog(title:"",middleText:"Profile Edited Successfully");
       if(response['status']==true){

       }else{
         //Get.defaultDialog(title: "⚠",middleText:response['message']);
         statusRequest.value = StatusRequest.failure;
       }
     }
   }

}

}
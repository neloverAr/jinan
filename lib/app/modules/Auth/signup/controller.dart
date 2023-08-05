
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  final policyAgreement=false.obs;
  final ageDropDawnValue = "٩ سنوات".obs;
  final sexDropDawnValue = "ذكر".obs;

  @override
  void onInit() async{
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void changeAgeValue(String newValue){
    ageDropDawnValue.value=newValue;
  }

  void changeSexValue(String newValue){
    sexDropDawnValue.value=newValue;
  }

  void changePolicyAgreement(){
    policyAgreement.value=!(policyAgreement.value);
  }

  @override
  void onReady() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onInit();
  }

}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:school/app/data/providers/forgetPassword.dart';
import '../../../core/class/crud.dart';
import '../../../core/class/status_request.dart';
import '../../../functions/handling_data.dart';
import '../verification_code/view.dart';

class ForgetPasswordController extends GetxController{

  late TextEditingController phoneController;
  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  List data = [];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  sendCode() async{
    if (formKey.currentState!.validate()){
      statusRequest.value = StatusRequest.loading;
      var response = await forgetPasswordData.postData(phoneController.text,);
      statusRequest.value = handlingData(response);
      if(StatusRequest.serverFailure == statusRequest.value){
        Get.defaultDialog(title: "⚠",middleText:"يجب أن يكون email عنوان بريد إلكتروني صحيح البُنية",
        radius: 5
        );
      }
      else if (StatusRequest.success == statusRequest.value){
        if(response['success']==null){
          print(response['msg']);
          //TODO store details of user
          //data.addAll(response['data']);
          //data response['msg']
          Get.to(()=>VerificationCodeScreen());
        }else {
          print("response['msg']");
          Get.defaultDialog(title: "⚠",
              middleText:response['message'],
          );
          statusRequest.value = StatusRequest.failure;
        }
      }

    }
 }

  @override
  void onInit() async{
    phoneController = TextEditingController();
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
    super.dispose();
  }


}
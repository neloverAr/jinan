import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school/app/data/providers/addFormData.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/class/status_request.dart';
import '../../../../data/services/storage/services.dart';
import '../../../../functions/handling_data.dart';

class AddMealModelController extends GetxController {
  AddFormData addFormData = AddFormData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;

  String eat="";
  String mealAmount="";
  //String data= "";
  StorageService storageService = Get.find();
  late TextEditingController note;

  Rx<bool> everyone = false.obs;
  Rx<bool> most = false.obs;
  Rx<bool> some = false.obs;
  Rx<bool> more = false.obs;

  Rx<bool> suitable = false.obs;
  Rx<bool> notAppropriate = false.obs;

  postData() async{
    statusRequest.value = StatusRequest.loading;
    determineEat();
    determineAmount();
    var response = await addFormData.postData(
        "${Get.arguments["studentID"]}",
        "${Get.arguments["subjectID"]}",
        {
          "date":DateFormat('yyyy-MM-dd').format(DateTime.now()),
          "amount":eat,
          "meal_content":mealAmount,
          "notes":note.text,
          "chapter_id":Get.arguments["chapterID"]=="none"?null:Get.arguments["chapterID"],
        });
    statusRequest.value = handlingData(response);

    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        Get.defaultDialog(title: "",middleText:"Assessment Saved Successfully");
      }else{
        //Get.defaultDialog(title: "",middleText:response["message"]);
        statusRequest.value = StatusRequest.failure;
      }
    }
  }


  @override
  void onInit() {
    note = TextEditingController();
    note.text = "";
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    note.dispose();
    super.onClose();
  }

  changeEveryone(){
    everyone.value = true;
    most.value = false;
    some.value = false;
    more.value = false;
  }

  changeMost(){
    everyone.value = false;
    most.value = true;
    some.value = false;
    more.value = false;
  }

  changeSome(){
    everyone.value = false;
    most.value = false;
    some.value = true;
    more.value = false;
  }

  changeMore(){
    everyone.value = false;
    most.value = false;
    some.value = false;
    more.value = true;
  }

  determineEat(){
    eat=(everyone.value?"everyone":(most.value?"most":(some.value?"some":(more.value?"more":""))));
  }
  ////////////
  changeSuitable(){
    suitable.value = true;
    notAppropriate.value = false;
  }

  changeNotAppropriate(){
    suitable.value = false;
    notAppropriate.value = true;
  }

  determineAmount(){
    mealAmount=(suitable.value?"suitable":notAppropriate.value?"not_appropriate":"");
  }

}

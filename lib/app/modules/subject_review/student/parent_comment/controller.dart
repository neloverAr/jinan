import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/class/status_request.dart';
import '../../../../data/providers/parentSubjectReview.dart';
import '../../../../data/services/storage/services.dart';
import '../../../../functions/handling_data.dart';

class AddCommentController extends GetxController {
  ParentSubjectReviewData addFormData = ParentSubjectReviewData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  StorageService storageService = Get.find();
  TextEditingController note = TextEditingController();

  postData() async{
    statusRequest.value = StatusRequest.loading;
    var response = await addFormData.postData("${Get.arguments["reviewID"]}",{
      "parent_note":note.text,
    });
    statusRequest.value = handlingData(response);

    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        Get.defaultDialog(title: "",middleText:"Comment Submitted Successfully");

      }else{
        //Get.defaultDialog(title: "",middleText:response["message"]);
        statusRequest.value = StatusRequest.failure;
      }
    }
  }


  @override
  void onInit() {
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

}

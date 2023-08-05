import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school/app/data/providers/addFormData.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/class/status_request.dart';
import '../../../../data/services/storage/services.dart';
import '../../../../functions/handling_data.dart';

class AddMaterialModelController extends GetxController {
  AddFormData addFormData = AddFormData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;

  String reviewFromThree="";
  String data= "";
  StorageService storageService = Get.find();

  Rx<bool> versed = false.obs;
  Rx<bool> needsFollow = false.obs;
  Rx<bool> unversed = false.obs;

  postData() async{
    statusRequest.value = StatusRequest.loading;
    determineVersed();
    var response = await addFormData.postData(
        "${Get.arguments["studentID"]}",
        "${Get.arguments["subjectID"]}",
        {
          "date":DateFormat('yyyy-MM-dd').format(DateTime.now()),
          "review_from_three":reviewFromThree,
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

  changeVersed(){
    versed.value = true;
    needsFollow.value = false;
    unversed.value = false;
  }

  changeNeedsFollow(){
    versed.value = false;
    needsFollow.value = true;
    unversed.value = false;
  }

  changeUnversed(){
    versed.value = false;
    needsFollow.value = false;
    unversed.value = true;
  }

  determineVersed(){
    reviewFromThree=(versed.value?"versed":(needsFollow.value?"needs_follow":(unversed.value?"unversed":"")));
  }
}

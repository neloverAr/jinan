import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school/app/data/providers/addFormData.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/class/status_request.dart';
import '../../../../data/services/storage/services.dart';
import '../../../../functions/handling_data.dart';

class AddInteractivePeriodsController extends GetxController {
  AddFormData addFormData = AddFormData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;

  String interactivity="";
  String data= "";
  StorageService storageService = Get.find();

  Rx<bool> interactive = false.obs;
  Rx<bool> notInteractive = false.obs;
  Rx<bool> absent = false.obs;

  postData() async{
    statusRequest.value = StatusRequest.loading;
    determineInteractive();
    var response = await addFormData.postData(
        "${Get.arguments["studentID"]}",
        "${Get.arguments["subjectID"]}",
        {
          "date":DateFormat('yyyy-MM-dd').format(DateTime.now()),
          "review":interactivity,
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

  changeInteractive(){
    interactive.value = true;
    notInteractive.value = false;
    absent.value = false;
  }

  changeNotInteractive(){
    interactive.value = false;
    notInteractive.value = true;
    absent.value = false;
  }

  changeAbsent(){
    interactive.value = false;
    notInteractive.value = false;
    absent.value = true;
  }

  determineInteractive(){
    interactivity=(notInteractive.value?"not_interacting":(absent.value?"absent":(interactive.value?"interactive":"")));
  }
}

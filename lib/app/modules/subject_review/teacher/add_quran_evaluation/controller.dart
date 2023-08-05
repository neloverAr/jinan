import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school/app/data/providers/addFormData.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/class/status_request.dart';
import '../../../../data/services/storage/services.dart';
import '../../../../functions/handling_data.dart';

class AddQuranEvaluationController extends GetxController {
  AddFormData addFormData = AddFormData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;

  String previousDaySave="";
  String previousDayLink="";
  String previousDayRecital="";

  String todaySave="";
  String todayLink="";
  String todayRecital="";

  String data= "";
  StorageService storageService = Get.find();

  Rx<bool> pdSaveExc = false.obs;
  Rx<bool> pdSaveVG = false.obs;
  Rx<bool> pdSaveG = false.obs;

  Rx<bool> pdLinkExc = false.obs;
  Rx<bool> pdLinkVG = false.obs;
  Rx<bool> pdLinkG = false.obs;

  Rx<bool> pdRecitalExc = false.obs;
  Rx<bool> pdRecitalVG = false.obs;
  Rx<bool> pdRecitalG = false.obs;
  ///////////
  Rx<bool> tSaveExc = false.obs;
  Rx<bool> tSaveVG = false.obs;
  Rx<bool> tSaveG = false.obs;

  Rx<bool> tLinkExc = false.obs;
  Rx<bool> tLinkVG = false.obs;
  Rx<bool> tLinkG = false.obs;

  Rx<bool> tRecitalExc = false.obs;
  Rx<bool> tRecitalVG = false.obs;
  Rx<bool> tRecitalG = false.obs;

  postData() async{
    statusRequest.value = StatusRequest.loading;
    determinePDSave();
    determinePDLink();
    determinePDRecital();
    determineTSave();
    determineTLink();
    determineTRecital();
    var response = await addFormData.postData(
        "${Get.arguments["studentID"]}",
        "${Get.arguments["subjectID"]}",
        {
          "date":DateFormat('yyyy-MM-dd').format(DateTime.now()),
          "save_verses":todaySave,
          "link_verses":todayLink,
          "recital":todayRecital,
          "save_the_previous_day":previousDaySave,
          "link_verses_the_previous_day_verses":previousDayLink,
          "recital_the_previous_day":previousDayRecital,
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
  ///////////
  changePdSaveEx(){
    pdSaveExc.value = true;
    pdSaveVG.value = false;
    pdSaveG.value = false;
  }

  changePdSaveVG(){
    pdSaveExc.value = false;
    pdSaveVG.value = true;
    pdSaveG.value = false;
  }

  changePdSaveG(){
    pdSaveExc.value = false;
    pdSaveVG.value = false;
    pdSaveG.value = true;
  }
  ///////////
  changePdLinkEx(){
    pdLinkExc.value = true;
    pdLinkVG.value = false;
    pdLinkG.value = false;
  }

  changePdLinkVG(){
    pdLinkExc.value = false;
    pdLinkVG.value = true;
    pdLinkG.value = false;
  }

  changePdLinkG(){
    pdLinkExc.value = false;
    pdLinkVG.value = false;
    pdLinkG.value = true;
  }
  ///////////
  changePdRecitalEx(){
    pdRecitalExc.value = true;
    pdRecitalVG.value = false;
    pdRecitalG.value = false;
  }

  changePdRecitalVG(){
    pdRecitalExc.value = false;
    pdRecitalVG.value = true;
    pdRecitalG.value = false;
  }

  changePdRecitalG(){
    pdRecitalExc.value = false;
    pdRecitalVG.value = false;
    pdRecitalG.value = true;
  }
  /////////////////////////////////
  changeTSaveEx(){
    tSaveExc.value = true;
    tSaveVG.value = false;
    tSaveG.value = false;
  }

  changeTSaveVG(){
    tSaveExc.value = false;
    tSaveVG.value = true;
    tSaveG.value = false;
  }

  changeTSaveG(){
    tSaveExc.value = false;
    tSaveVG.value = false;
    tSaveG.value = true;
  }
  ///////////
  changeTLinkEx(){
    tLinkExc.value = true;
    tLinkVG.value = false;
    tLinkG.value = false;
  }

  changeTLinkVG(){
    tLinkExc.value = false;
    tLinkVG.value = true;
    tLinkG.value = false;
  }

  changeTLinkG(){
    tLinkExc.value = false;
    tLinkVG.value = false;
    tLinkG.value = true;
  }
  ///////////
  changeTRecitalEx(){
    tRecitalExc.value = true;
    tRecitalVG.value = false;
    tRecitalG.value = false;
  }

  changeTRecitalVG(){
    tRecitalExc.value = false;
    tRecitalVG.value = true;
    tRecitalG.value = false;
  }

  changeTRecitalG(){
    tRecitalExc.value = false;
    tRecitalVG.value = false;
    tRecitalG.value = true;
  }

  determinePDSave(){
    previousDaySave=(pdSaveExc.value?"excellent":(pdSaveVG.value?"very_good":(pdSaveG.value?"good":"")));
  }
  determinePDLink(){
    previousDayLink=(pdLinkExc.value?"excellent":(pdLinkVG.value?"very_good":(pdLinkG.value?"good":"")));
  }
  determinePDRecital(){
    previousDayRecital=(pdRecitalExc.value?"excellent":(pdRecitalVG.value?"very_good":(pdRecitalG.value?"good":"")));
  }
  determineTSave(){
    todaySave=(tSaveExc.value?"excellent":(tSaveVG.value?"very_good":(tSaveG.value?"good":"")));
  }
  determineTLink(){
    todayLink=(tLinkExc.value?"excellent":(tLinkVG.value?"very_good":(tLinkG.value?"good":"")));
  }
  determineTRecital(){
    todayRecital=(tRecitalExc.value?"excellent":(tRecitalVG.value?"very_good":(tRecitalG.value?"good":"")));
  }
}

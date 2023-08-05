import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school/app/data/providers/addAssignment.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/class/status_request.dart';
import '../../../../functions/handling_data.dart';

class AddChapterController extends GetxController {
  late final TextEditingController arNameController;
  late final TextEditingController enNameController;
  late final TextEditingController arDetailsController;
  late final TextEditingController enDetailsController;
  late final TextEditingController videoController;
  late Rx<PlatformFile?> pickedFile = PlatformFile(name: '', size: 2).obs;
  late Rx<PlatformFile?> pickedImage = PlatformFile(name: '', size: 2).obs;
  late Rx<DateTime?> deliveryDate = DateTime.now().obs;
  GlobalKey<FormState> chapterFormKey = GlobalKey<FormState>();
  late DateTime createdDate;
  late String id;
  AddToSubjectData addChapterData = AddToSubjectData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;

  @override
  void onInit() {
    arNameController = TextEditingController();
    enNameController = TextEditingController();
    arDetailsController = TextEditingController();
    enDetailsController = TextEditingController();
    videoController = TextEditingController();
    id = Get.arguments["subjectID"];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    arNameController.dispose();
    enNameController.dispose();
    arDetailsController.dispose();
    enDetailsController.dispose();
    videoController.dispose();
    super.onClose();
  }

  Future selectFile() async{
    final result = await FilePicker.platform.pickFiles();
    if(result==null) return;
    pickedFile.value = result.files.first;
  }

  Future selectImage() async{
    final result = await FilePicker.platform.pickFiles(type:FileType.image);
    if(result==null) return;
    pickedImage.value = result.files.first;
  }

  addChapter() async{
    if(chapterFormKey.currentState!.validate()){
      statusRequest.value = StatusRequest.loading;
      var response = await addChapterData.getData(
          id,{
        "en_name":enNameController.text,
        "ar_name":arNameController.text,
        "ar_description":arDetailsController.text,
        "en_description":enDetailsController.text,
        "delivery_time":DateFormat('yyyy-MM-dd').format(deliveryDate.value!),
        "video":videoController.text,
        "type":"chapter",
      },(pickedFile.value!.path!=null)
          ?File(pickedFile.value!.path!)
          :null,(pickedImage.value!.path!=null)?File(pickedImage.value!.path!)
        :null
      );
      statusRequest.value = handlingData(response);
      if(StatusRequest.success == statusRequest.value){
        if(response['status']==true){
          Get.defaultDialog(title: "",middleText:"Chapter Added Successfully");
        }else{
          statusRequest.value = StatusRequest.failure;
        }
      }
    }
  }
}

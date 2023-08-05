import 'package:get/get.dart';

class TeacherSubjectDetailsController extends GetxController {
  late String arName;
  late String enName;
  late String id;

  @override
  void onInit() {
    id = "${Get.arguments["subjectID"]}";
    enName = Get.arguments["subjectEnglishName"];
    arName = Get.arguments["subjectArabicName"];
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

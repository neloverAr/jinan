import 'package:get/get.dart';
import '../parent_child_selection/view.dart';

class AuthController extends GetxController {
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

  login(){
    Get.to(()=>ChildSelectionScreen());
    //Get.to(()=>TeacherHomeScreen());
  }

}
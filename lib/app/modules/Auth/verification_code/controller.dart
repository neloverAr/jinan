
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:school/app/modules/home/student/home_view.dart';

class VerificationCodeController extends GetxController{
  late List<TextEditingController> codes;

  final index = 0.obs;

  @override
  void onInit() async{
    codes = <TextEditingController>[];
    TextEditingController code1 = TextEditingController();
    TextEditingController code2 = TextEditingController();
    TextEditingController code3 = TextEditingController();
    TextEditingController code4 = TextEditingController();
    TextEditingController code5 = TextEditingController();

    codes.add(code1);codes.add(code2);codes.add(code3);codes.add(code4);codes.add(code5);
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

  void changeAutoFocus(TextEditingController controller,int value){
    if(controller.text.isNotEmpty){
      if(value<4){
      index.value=value++;
      }
      else{
        Get.to(HomeScreen());
      }
    }
  }

  @override
  void dispose() {
    codes.map((e) => e.dispose());
    super.dispose();
  }
}
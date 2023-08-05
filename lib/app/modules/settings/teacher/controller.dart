import 'package:get/get.dart';

class TeacherSettingsController extends GetxController {
  // late TextEditingController fNameController;
  // late TextEditingController lNameController;
  // late TextEditingController categoryController;
  // HomeTeacherController homeController = Get.find();

  // late var ageDropDawnValue ;
  // late var  sexDropDawnValue ;

  @override
  void onInit() {
    // fNameController = TextEditingController();
    // lNameController = TextEditingController();
    // categoryController = TextEditingController();
    // ageDropDawnValue = homeController.student.value.age.obs;
    // sexDropDawnValue = homeController.student.value.sex.obs;
    // fNameController.text = homeController.student.value.fName!;
    // lNameController.text = homeController.student.value.lName!;
    // categoryController.text = homeController.student.value.category!;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // fNameController.dispose();
    // lNameController.dispose();
    // categoryController.dispose();
    super.onClose();
  }


  // void changeAgeValue(int newValue){
  //   ageDropDawnValue.value=newValue;
  // }
  //
  // void changeSexValue(String newValue){
  //   sexDropDawnValue.value=newValue;
  // }
  //
  // void updateStudent(){
  //   final newStudent = Student(avatar:profile,fName: fNameController.text, lName: lNameController.text,age: ageDropDawnValue.value, sex: sexDropDawnValue.value, level: homeController.student.value.level, category: categoryController.text);
  //   homeController.student.value = newStudent;
  //   //student.refresh();
  // }


}

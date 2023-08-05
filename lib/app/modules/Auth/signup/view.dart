
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/modules/Auth/login/view.dart';
import 'package:school/app/modules/Auth/signup/controller.dart';
import 'package:school/app/modules/Auth/signup/widgets/auth_drop_down.dart';
import 'package:school/app/modules/Auth/widgets/authTitle.dart';
import 'package:school/app/modules/Auth/widgets/auth_textfield.dart';
import 'package:school/app/modules/Auth/widgets/bottom_widget.dart';

import '../widgets/phone_field.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({Key? key}) : super(key: key);
  final ageItems = ["٥ سنوات","٦ سنوات","٧ سنوات","٨ سنوات","٩ سنوات","١٠ سنوات",];
  final sexItems = ["ذكر","أنثى"];

   @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.put(SignupController());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const AuthTitle(title: "تسجيل حساب جديد",),
            Padding(
              padding: EdgeInsets.all(mainPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 3.0.hp,),
                  //AuthTextField(hintText: "محمد عبد الرحمن الشهري", labelText: "اسم الطالب", controller: signupController.nameController),SizedBox(height: 4.0.hp),
                  //AuthTextField(hintText: "example@gmail.com", labelText: "الايميل", controller: signupController.emailController ),SizedBox(height: 4.0.hp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GetX<SignupController>(
                        builder: (controller) {
                          return AuthDropDawn(
                            items:ageItems,
                            labelText: "العمر",
                            onChanged: (String? newValue){
                              controller.changeAgeValue(newValue!);
                            },
                            dropDawnValue: controller.ageDropDawnValue.value,
                          );
                        },
                      ),
                      SizedBox(width: 3.0.wp,),
                      GetX<SignupController>(
                        builder: (controller) {
                          return AuthDropDawn(
                            items:sexItems,
                            labelText: "الجنس",
                            onChanged: (String? newValue){
                              signupController.changeSexValue(newValue!);
                            },
                            dropDawnValue: signupController.sexDropDawnValue.value,);
                        },
                      ),
                    ],
                  ),SizedBox(height: 4.0.hp),
                  //PhoneField(controller: signupController.phoneController),SizedBox(height: 4.0.hp),
                  //AuthTextField(hintText: "***********************", labelText: "كلمة المرور", controller: signupController.passwordController,obscureText: true,),SizedBox(height: 4.0.hp),
                  //AuthTextField(hintText: "***********************", labelText: "تأكيد كلمة المرور", controller: signupController.confirmPasswordController,obscureText: true),SizedBox(height: 2.0.hp),
                  GetX<SignupController>(builder: (signupController)=>
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: red,
                            value: signupController.policyAgreement.value,
                            onChanged: (bool? value) {
                              signupController.changePolicyAgreement();
                            },
                          ),
                          InkWell(
                              onTap:(){
                                signupController.changePolicyAgreement();
                              },
                              child: Text("الموافقة على سياسة الاستخدام")),
                        ],
                      )
                  ),SizedBox(height: 4.0.hp),
                ],
              ),
            ),
            BottomWidget(text: "تسجيل",onPressed: (){
              Get.to(()=>LoginScreen());
            },),
          ],
        ),
      ),
    );
  }
}


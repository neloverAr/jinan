
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/modules/Auth/verification_code/controller.dart';
import 'package:school/app/modules/Auth/verification_code/widgets/code_field.dart';
import 'package:school/app/modules/Auth/widgets/authTitle.dart';
import 'package:school/app/modules/Auth/widgets/bottom_widget.dart';
import '../controller.dart';

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({Key? key}) : super(key: key);
  final index = [0,1,2,3,4];
  VerificationCodeController verificationCodeController = Get.put(VerificationCodeController());
  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Align(alignment:Alignment.topCenter,child: AuthTitle(title: "enterVerificationCode".tr,)),
                Padding(
                  padding: EdgeInsets.all(10.0.wp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ...index.map((e) =>
                              GetX<VerificationCodeController>(
                                builder: (verificationCodeController)=>
                                  Expanded(child: CodeField(controller: verificationCodeController.codes[e],
                                    autoFocuses:verificationCodeController.index.value==e?true:false,
                                    onChanged: (value){
                                      FocusScope.of(context).nextFocus();
                                      verificationCodeController.changeAutoFocus(verificationCodeController.codes[e], e);
                                  },
                                  )),
                              )
                          ).toList(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomWidget(text: "logIn".tr,onPressed: (){
                authController.login();
              },),
            ),
          ],
        ),
      ),
    );
  }
}


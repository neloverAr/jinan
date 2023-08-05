
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/modules/Auth/forget_password/controller.dart';
import 'package:school/app/modules/Auth/widgets/authTitle.dart';
import 'package:school/app/modules/Auth/widgets/bottom_widget.dart';
import '../../../widgets/handling_data_view_request.dart';
import '../widgets/phone_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({Key? key}) : super(key: key);
  ForgetPasswordController forgetPasswordController = Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetX<ForgetPasswordController>(
          builder: (forgetPasswordController){
            return HandlingDataViewRequest(statusRequest: forgetPasswordController.statusRequest.value,
                widget: Stack(
                  children: [
                    ListView(
                      children: [
                        Align(alignment:Alignment.topCenter,child: AuthTitle(title: "forgetPassword".tr,)),
                        Form(
                          key: forgetPasswordController.formKey,
                          child: Padding(
                            padding: EdgeInsets.all(mainPadding),
                            child:PhoneField(controller:forgetPasswordController.phoneController ,
                                validator: (String? value){
                                  if(value == null || value.isEmpty){
                                    return "This field is required";
                                  }
                                  return null;
                                }),

                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: BottomWidget(text: "sendCode".tr,onPressed: (){
                        forgetPasswordController.sendCode();
                      },
                      ),
                    ),
                  ],
                ),);
          }
        )
      ),
    );
  }
}


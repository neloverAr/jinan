
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/modules/settings/edit_password/controller.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';

import '../../../core/constants/border_radius.dart';
import '../../../core/constants/height.dart';
import '../../../core/constants/padding.dart';
import '../../../core/values/colors.dart';
import '../../../widgets/handling_data_view_request.dart';

class EditPasswordScreen extends StatelessWidget {
   EditPasswordScreen({Key? key}) : super(key: key);
  EditPasswordController controller = Get.put(EditPasswordController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: Get.height,
        child: Stack(
          children: [
            TopWidget(type: "fixed", containedWidget: TopWidgetTitle(
                text: "editPassword".tr, type: "withBackArrow")),
            Positioned(
                top: upperWidgetHeight - upperWidgetRadius+5,
                left: mainPadding,
                right: mainPadding,
                child: Card(
                  shape: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(cardsRadius),
                  ),
                  child: GetX<EditPasswordController>(
                    builder: (controller){
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,vertical: 30),
                          child: Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                EditPasswordTextField(caption: "currentPassword".tr,hint: "12121581398599",controller:controller.oldPasswordController,),SizedBox(height: 3.0.hp,),
                                EditPasswordTextField(caption: "newPassword".tr,hint: "5651961969269",controller:controller.newPasswordController,),SizedBox(height: 3.0.hp,),
                                EditPasswordTextField(caption: "newPasswordConfirmation".tr,hint: "5651961969269",controller:controller.newPasswordConfirmationController,),SizedBox(height: 4.0.hp,),
                                ElevatedButton(
                                    onPressed: (){

                                      controller.resetPassword();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:red ,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(7.0)),
                                      minimumSize: Size(double.infinity, 52), //////// HERE
                                    ),
                                    child: Text("saveNewPassword".tr)),
                                HandlingDataViewRequest(statusRequest: controller.statusRequest.value, widget: Text(""))
                              ],
                            ),
                          )
                      );
                    },
                  )
            ))
          ],
        ),
      ),
    );
  }
}

class EditPasswordTextField extends StatelessWidget {
  final controller;
  final caption;
  final hint;
   EditPasswordTextField({
    Key? key,required this.controller,required this.caption,
     required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(caption),SizedBox(height: 1.0.hp),
        TextFormField(
          controller: controller,
          validator:(String? value){
          if(value == null || value.isEmpty){
          return "This field is required";
          }
          return null;
          },obscureText: true,
          decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor:Color(0xFFF6F6F6),
              border:  OutlineInputBorder(
                borderRadius:  BorderRadius.circular(textFieldRadius),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xEEEEEEEE),
                ),
              )
          ),
        )
      ],
    );
  }
}

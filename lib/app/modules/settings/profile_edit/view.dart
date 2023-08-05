
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/border_radius.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/modules/settings/profile_edit/controller.dart';
import 'package:school/app/widgets/avatar.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import 'package:school/app/widgets/top_widget.dart';
import '../../../core/constants/height.dart';
import '../../../core/values/icons.dart';
import '../../../widgets/filedAvatar.dart';
import '../../../widgets/top_widget_title.dart';
import '../../Auth/widgets/auth_button.dart';

class EditProfileScreen extends StatelessWidget {
   EditProfileScreen({Key? key}) : super(key: key);

   ProfileEditController controller = Get.put(ProfileEditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<ProfileEditController>(
        builder: (controller){
        return Stack(
          fit: StackFit.expand,
          children: [
             TopWidget(
                type: "fixed",
                containedWidget:
                TopWidgetTitle(type: "withBackArrow", text: 'editProfile'.tr,)),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: mainPadding),
                child: Align(alignment: Alignment.bottomCenter,
                    child: AuthButton(text:  "save".tr,onPressed: (){
                      controller.postData();
                    },
                    )
                ),
              ),
            ),Positioned(
              top: upperWidgetHeight - upperWidgetRadius,
              left: mainPadding,
              right: mainPadding,
              child: HandlingDataView(statusRequest: controller.statusRequest.value,
                widget: Column(
                children: [
                  Card(
                    elevation:3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(cardsRadius),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 8.0),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          controller.pickedImage.value!.name==""?
                          Avatar(image: controller.imageUrl)
                              :FiledAvatar(image: controller.pickedImage.value!.path!),
                          InkWell(
                              onTap: () async{
                                controller.pickImage();
                              },
                              child: SvgPicture.asset(avatarEditIcon)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 1.0.hp,),
                  InformationWidget(controller: controller.fNameController),SizedBox(height: 1.0.hp,),
                  InformationWidget(controller: controller.lNameController),SizedBox(height: 1.0.hp,),
                  InformationWidget(controller: controller.emailController),SizedBox(height: 1.0.hp,),
                 //Spacer(),

                ],
              ),)
            )
          ],
        );}
      ),
    );
  }
}

class InformationWidget extends StatelessWidget {
  final TextEditingController controller;
  const InformationWidget({
    super.key, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardsRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            //hintText: controller.student.value.category!,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintStyle: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

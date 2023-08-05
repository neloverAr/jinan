
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/border_radius.dart';
import 'package:school/app/core/constants/height.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/icons.dart';
import 'package:school/app/data/services/storage/services.dart';
import 'package:school/app/modules/Auth/login/view.dart';
import 'package:school/app/modules/home/student/honor/view.dart';
import 'package:school/app/modules/settings/edit_password/view.dart';
import 'package:school/app/modules/settings/language_screen/view.dart';
import 'package:school/app/modules/settings/student/controller.dart';
import 'package:school/app/widgets/avatar.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import '../../../core/constants/padding.dart';
import '../../../widgets/custom_divider.dart';
import '../../../widgets/top_widget.dart';
import '../../../widgets/top_widget_title.dart';
import '../../about_us/view.dart';
import '../profile_view/view.dart';
import '../widgets/settings_button.dart';

class TeacherProfileScreen extends StatelessWidget {
  TeacherProfileScreen({Key? key}) : super(key: key);
 StorageService storageService = Get.find();

 SettingsController settingsController=Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          TopWidget(
              type: "fixed",
              containedWidget:
              TopWidgetTitle(type: "main", text: "profile".tr,)),
          Positioned(
              top: upperWidgetHeight - upperWidgetRadius-20,
              left: 0,
              right: 0,
              child: Padding(
                padding:EdgeInsets.all(mainPadding),
                child: Container(
                  height: Get.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(cardsRadius),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.2),
                        spreadRadius: 6,
                        blurRadius: 7,
                        offset: const Offset(0,7.5)
                      )
                    ]
                  ),
                  child: GetX<SettingsController>(
                    builder: (controller){
                      return ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          HandlingDataView(statusRequest: controller.statusRequest.value,
                              widget: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                              Padding(
                                  padding:EdgeInsets.only(
                                    top: 3.0.hp,
                                    bottom: 1.0.hp,
                                  ),
                                  child: Avatar(image: controller.data.profileImage!)
                                //Image.asset(homeController.teacher.value.avatar!,height: 94,width: 94,),
                              ),
                              Text(controller.data.fullName!),
                            ],
                          )),
                          SettingsButton(text: "profile".tr,icon: profileEditIcon,onPressed: (){Get.to(() =>ProfileViewScreen());},),const CustomDivider(),
                          SettingsButton(text: "subjects".tr,icon: subjectsIcon,onPressed: (){
                            Get.toNamed("/teacher-subjects-screen",arguments: {
                            "nextPage":""
                          });},),const CustomDivider(),
                          SettingsButton(text: "honorBoard".tr,icon: honorIcon,onPressed: (){Get.to(() => HonorScreen());},),const CustomDivider(),
                          SettingsButton(text: 'aboutUs'.tr,icon: infoIcon,onPressed: (){Get.to(() => AboutScreen());},), const CustomDivider(),
                          //SettingsButton(text: 'dailySchedule'.tr,icon: tableIcon,onPressed: (){},), const CustomDivider(),
                          SettingsButton(text: 'appLanguage'.tr,icon: languageIcon,onPressed: (){Get.to(() =>LanguageScreen());},),const CustomDivider(),
                          SettingsButton(text: 'editPassword'.tr,icon: changePasswordIcon,onPressed: (){Get.to(() =>EditPasswordScreen());},),const CustomDivider(),
                          SettingsButton(text: 'logOut'.tr,icon: logoutIcon,onPressed: (){
                            storageService.write("step", "1");
                            //int userID = storageService.read("id");
                            //FirebaseMessaging.instance.unsubscribeFromTopic("users");
                            //FirebaseMessaging.instance.unsubscribeFromTopic("users$userID");Get.offAll(() =>LoginScreen());
                            Get.off(() =>LoginScreen());},),
                          SizedBox(height: 5.0.hp),
                          SizedBox(height: 5.0.hp),
                          SizedBox(height: 5.0.hp),
                          SizedBox(height: 5.0.hp),
                          SizedBox(height: 5.0.hp),
                          SizedBox(height: 2.0.hp),
                        ],
                      );
                    },
                  )
                ),
              ))
        ],
      ),
    );
  }
}



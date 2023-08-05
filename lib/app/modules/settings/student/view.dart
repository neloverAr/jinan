
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/border_radius.dart';
import 'package:school/app/core/constants/height.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/icons.dart';
import 'package:school/app/modules/Auth/login/view.dart';
import 'package:school/app/modules/attendances/view.dart';
import 'package:school/app/modules/notifications/controller.dart';
import 'package:school/app/modules/parent_child_selection/view.dart';
import 'package:school/app/modules/settings/edit_password/view.dart';
import 'package:school/app/modules/settings/language_screen/view.dart';
import 'package:school/app/modules/settings/profile_view/view.dart';
import 'package:school/app/modules/settings/student/student_file/view.dart';
import 'package:school/app/widgets/avatar.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import '../../../core/constants/padding.dart';
import '../../../core/utils/keys.dart';
import '../../../core/values/colors.dart';
import '../../../data/services/storage/services.dart';
import '../../../widgets/custom_divider.dart';
import '../../../widgets/top_widget.dart';
import '../../../widgets/top_widget_title.dart';
import '../../about_us/view.dart';
import '../../home/student/home_controller.dart';
import '../widgets/settings_button.dart';
import '../widgets/settings_button_exit.dart';
import 'controller.dart';
import 'points/view.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);
   StorageService storageService = Get.find();

   @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SettingsController());
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
                  width: double.infinity,
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
                  ),child: GetX<SettingsController>(
                    builder: (settingsController){
                      return ListView(
                        //mainAxisSize: MainAxisSize.min,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          HandlingDataView(
                              statusRequest: settingsController.statusRequest.value,
                              widget: Column(
                                children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 3.0.hp,
                                    bottom: 1.0.hp,
                                  ),
                                  child: Avatar(image: settingsController.data.profileImage!,),
                                ),
                                Text("${settingsController.data.fullName}"),
                              ],) ,
                          ),
                          SizedBox(height: 2.0.hp,),
                          SettingsButton(text: "profile".tr,icon: profileEditIcon,onPressed: (){Get.to(() =>ProfileViewScreen());},),const CustomDivider(),
                          SettingsButton(text: "studentFile".tr,icon: studentFileIcon,onPressed: (){Get.to(()=>StudentFileScreen());},),const CustomDivider(),
                          SettingsButton(text: "attendanceList".tr,icon: attendanceIcon,onPressed: (){Get.to(()=>AttendancesScreen());},),const CustomDivider(),
                          SettingsButton(text: "myPoints".tr,icon: giftIcon,onPressed: (){
                            Get.to(() =>PointsScreen());},
                          ),const CustomDivider(),
                          SettingsButtonExit(text: "exitButton".tr,icon: exitIcon,
                            onPressed: (){
                              _showConfirmationDialog(context);
                            },
                          ),const CustomDivider(),
                          GetX<SettingsController>(builder: (controller){
                            return Theme(
                              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Transform.translate(
                                  offset: Offset(storageService.read(langKey)=="ar"?30:-30, 0),
                                  child: Text('settings'.tr,style:TextStyle(color: Colors.black,fontSize:10.0.sp),),
                                ),
                                leading:SvgPicture.asset(settingIcon),
                                collapsedBackgroundColor: Colors.transparent,
                                trailing:
                                SvgPicture.asset(controller.expanded.value?arrow2Icon:arrowIcon),
                                children: [
                                  ListTile(
                                    selected: true,
                                    tileColor: Colors.red,
                                    selectedColor:Colors.red,
                                    visualDensity: const VisualDensity(vertical: -3),
                                    onTap: (){
                                      Get.to(() =>EditPasswordScreen());
                                      },
                                    title: Transform.translate(
                                      offset: Offset(storageService.read(langKey)=="ar"?30:-30, 0),
                                      child: Text('editPassword'.tr,style:TextStyle(color: Color(0xFF2F2F2F).withOpacity(.6),fontSize:10.0.sp) ,),
                                    ),leading:SvgPicture.asset(changePasswordIcon),
                                  ),const CustomDivider(),
                                  ListTile(
                                    visualDensity: const VisualDensity(vertical: -3),
                                    onTap: (){
                                      Get.to(() =>LanguageScreen());
                                    },
                                    title: Transform.translate(
                                      offset: Offset(storageService.read(langKey)=="ar"?30:-30, 0),
                                      child: Text('appLanguage'.tr,style:TextStyle(color:  Color(0xFF2F2F2F).withOpacity(.6),fontSize:10.0.sp) ,),
                                    ),leading:SvgPicture.asset(languageIcon),
                                  )
                                ],
                                onExpansionChanged: (bool expanded) {
                                  controller.updateExpand();
                                },
                              ),
                            );
                          }),const CustomDivider(),
                          SettingsButton(text: 'switchAccount'.tr,icon: switchIcon,onPressed: (){Get.to(() =>ChildSelectionScreen());},), const CustomDivider(),
                          SettingsButton(text: 'aboutUs'.tr,icon: infoIcon,onPressed: (){Get.to(() =>AboutScreen());},), const CustomDivider(),
                          SettingsButton(text: 'logOut'.tr,icon: logoutIcon,onPressed: (){
                            storageService.write("step", "1");
                            //int userID = storageService.read("id");
                            //FirebaseMessaging.instance.unsubscribeFromTopic("users");
                            //FirebaseMessaging.instance.unsubscribeFromTopic("users$userID");
                            Get.delete<NotificationController>();
                            Get.offAll(() =>LoginScreen());
                            },),
                          SizedBox(height: 5.0.hp),
                          SizedBox(height: 5.0.hp),
                          SizedBox(height: 5.0.hp),
                          SizedBox(height: 5.0.hp),
                          SizedBox(height: 5.0.hp),
                          SizedBox(height: 2.0.hp),
                          //Flexible(flex:5,fit: FlexFit.loose,child: Container()),
                        ],
                      );
                    }
                  ),
          ),
          ),
         )
        ],
      ),
    );
  }
}
////////////
void _showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text("exitButton".tr),
        content: Text("exitButtonConfirm".tr,textAlign: TextAlign.justify,),
        actions: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  primary: red
              ),
              child: Text("cancel".tr)
          ),
          ElevatedButton(
              onPressed: () async{
                Navigator.of(context).pop();
                HomeController homeController = Get.find();
                if(await homeController.sendFcmMessage()){
                  Get.defaultDialog(title: " ",middleText: "Your order has sent Successfully");
                }else{
                  Get.defaultDialog(title: "⚠",middleText: "An Error has occurred");}
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.green
              ),
              child: Text("yes".tr)
          ),
        ],
      );
    },
  );
}



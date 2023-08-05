
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/core/values/icons.dart';
import 'package:school/app/widgets/avatar.dart';
import 'package:school/app/widgets/custom_divider.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import 'package:school/app/widgets/top_widget.dart';
import '../../../widgets/top_widget_title.dart';
import '../widgets/student_data_widget.dart';
import 'controller.dart';

class ProfileViewScreen extends StatelessWidget {
   ProfileViewScreen({Key? key}) : super(key: key);

   ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<ProfileController>(
        builder: (controller){
          return HandlingDataView(
            statusRequest: controller.statusRequest.value, widget: Column(
              children:[
                TopWidget(
                    type: "fixed",
                    containedWidget:
                    TopWidgetTitle(type: "withBackArrow", text: 'myProfile'.tr,)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: mainPadding,vertical: 15),
                      child: Row(
                        children: [
                          Expanded(
                              flex:1,
                              child: Avatar(image: controller.data.profileImage!,),),
                          Expanded(
                              flex:2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width:40.0.wp,
                                          child: Text(controller.data.fullName!,maxLines: 3,overflow: TextOverflow.ellipsis,)),
                                      //SizedBox(height: 1.0.hp,),
                                      // Text(homeController.student.value.level!,style: TextStyle(
                                      //   color: grey,
                                      // ),),
                                    ],
                                  ),
                                  InkWell(
                                      onTap: (){
                                        Get.toNamed("/edit-profile-screen",
                                        arguments: {
                                          "profileImage":controller.data.profileImage,
                                          "fullName":controller.data.fullName,
                                          "fName":controller.data.firstName,
                                          "lName":controller.data.lastName??"",
                                          "email":controller.data.email,
                                        }
                                        );
                                        //Get.to(() =>EditProfileScreen());
                                      },
                                      child: SvgPicture.asset(profileEditIcon,color: red,)),
                                ],
                              )
                          )
                        ],
                      ),
                    ),
                    const CustomDivider(),
                    StudentDataWidget(dataType: "firstName", dataValue:controller.data.firstName??""),
                    StudentDataWidget(dataType: "lastName", dataValue:controller.data.lastName??""),
                    StudentDataWidget(dataType: "email", dataValue:controller.data.email??""),
                    StudentDataWidget(dataType: "mobile", dataValue:"${controller.data.mobile}"),
                    //StudentDataWidget(dataType: "address", dataValue:controller.data.address),
                    //StudentDataWidget(dataType: "level", dataValue:homeController.student.value.category!),
                  ],
                )
              ]
          ),);
        },
      )
    );
  }
}

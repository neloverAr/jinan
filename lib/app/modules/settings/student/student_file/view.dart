
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/functions/get-date.dart';
import 'package:school/app/modules/settings/widgets/student_data_widget.dart';
import 'package:school/app/widgets/avatar.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import 'controller.dart';

class StudentFileScreen extends StatelessWidget {
  StudentFileScreen({Key? key}) : super(key: key);
  StudentFileController studentFileController = Get.put(StudentFileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopWidget(type: "fixed", containedWidget: TopWidgetTitle(
            text:"studentFile".tr,
            type:"withBackArrow",
          )),
          GetX<StudentFileController>(
              builder: (controller){
            return HandlingDataView(
              statusRequest: controller.statusRequest.value,
                widget: Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    children: [
                      SizedBox(height: 1.0.hp,),
                       Center(
                        child: Avatar(image:controller.data.profileImage!),
                      ),
                      SizedBox(height: 1.0.hp,),
                      Center(child: Text(controller.data.fullName!)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StudentDataWidget(dataType: "firstName", dataValue:controller.data.firstName!),
                            StudentDataWidget(dataType: "fatherName", dataValue: storageService.read("firstName")),
                            StudentDataWidget(dataType: "grandFatherName", dataValue: controller.data.grandfatherName??""),
                            StudentDataWidget(dataType: "lastName", dataValue: controller.data.lastName??""),
                            StudentDataWidget(dataType: "birthday", dataValue: getDate3(controller.data.birthDay!)),
                            StudentDataWidget(dataType: "idNumber", dataValue: controller.data.idCart??""),
                            StudentDataWidget(dataType: "gender", dataValue: controller.data.gender!),
                            StudentDataWidget(dataType: "age", dataValue: "${controller.data.age}"),
                            StudentDataWidget(dataType: "level", dataValue: controller.data.levelData!),
                            StudentDataWidget(dataType: "semester", dataValue: controller.data.semesterData!),
                            StudentDataWidget(dataType: "totalPoints", dataValue: "${controller.data.totalPoint}"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            );
          })
        ],
      ),
    );
  }
}

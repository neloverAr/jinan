
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import '../../../../core/constants/border_radius.dart';
import '../../../../core/constants/height.dart';
import '../../../../core/values/colors.dart';
import '../../../../widgets/top_widget.dart';
import '../../../../widgets/top_widget_title.dart';
import '../../widgets/teacher_assessment_button.dart';
import 'controller.dart';

class AddInteractivePeriodsScreen extends StatelessWidget {
  AddInteractivePeriodsController controller = Get.put(AddInteractivePeriodsController());
  AddInteractivePeriodsScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          TopWidget(
              type: "fixed",
              containedWidget:
              TopWidgetTitle(type: "withBackArrow", text: "interactivePeriods".tr,)),
          Positioned(
              top: upperWidgetHeight - upperWidgetRadius +10,
              left: mainPadding,
              right: mainPadding,
              child: GetX<AddInteractivePeriodsController>(
                  builder:(controller){
                    return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardsRadius)),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: mainPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("assessment".tr,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.0.sp)),
                            SizedBox(height: 2.0.hp,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(flex:1,child: TeacherAssessmentButton(text: "interactive".tr, selected: controller.interactive.value, onTap: (){
                                  controller.changeInteractive();
                                })),
                                SizedBox(width: 2.0.wp,),
                                Expanded(flex:1,child: TeacherAssessmentButton(text: "notInteractive".tr, selected: controller.notInteractive.value, onTap: (){
                                  controller.changeNotInteractive();
                                })),
                                SizedBox(width: 2.0.wp,),
                                Expanded(flex:1,child: TeacherAssessmentButton(text: "absents".tr, selected: controller.absent.value, onTap: (){
                                  controller.changeAbsent();
                                })),
                              ],
                            ),SizedBox(height: 30.0.hp,)
                          ],
                        ),
                      )
                    );
                  }
              )
          ),SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: mainPadding,right: mainPadding),
              child: Align(alignment: Alignment.bottomCenter,child: ElevatedButton(
                onPressed: (){
                  controller.postData();
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:red ,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0)),
                  minimumSize: Size(double.infinity, 52), //////// HERE
                ),
                child: Text("save".tr),
              ),),
            ),
          )
        ],
      ),
    );
  }
}
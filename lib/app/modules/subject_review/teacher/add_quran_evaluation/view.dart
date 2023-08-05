
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

class AddQuranEvaluationScreen extends StatelessWidget {
  AddQuranEvaluationController controller = Get.put(AddQuranEvaluationController());
  AddQuranEvaluationScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          TopWidget(
              type: "fixed",
              containedWidget:
              TopWidgetTitle(type: "withBackArrow", text: "quranEvaluation".tr,)),
          Positioned(
              top: upperWidgetHeight - upperWidgetRadius +10,
              left: mainPadding,
              right: mainPadding,
              child: GetX<AddQuranEvaluationController>(
                  builder:(controller){
                    return Column(
                      children: [
                        Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardsRadius)),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 10.0,vertical: mainPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("hezbPreviousDay".tr,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.0.sp),),
                                  SizedBox(height: 2.0.hp,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(flex:2,child: Text("memorisingAssessment".tr,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "excellent".tr, selected: controller.pdSaveExc.value, onTap: (){
                                        controller.changePdSaveEx();
                                      })),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "veryGood".tr, selected: controller.pdSaveVG.value, onTap: (){
                                        controller.changePdSaveVG();
                                      })),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "good".tr, selected: controller.pdSaveG.value, onTap: (){
                                        controller.changePdSaveG();
                                      })),
                                    ],
                                  ),SizedBox(height: 2.0.hp,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(flex:2,child: Text("connectAssessment".tr,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "excellent".tr, selected: controller.pdLinkExc.value, onTap: (){
                                        controller.changePdLinkEx();
                                      })),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "veryGood".tr, selected: controller.pdLinkVG.value, onTap: (){
                                        controller.changePdLinkVG();
                                      })),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "good".tr, selected: controller.pdLinkG.value, onTap: (){
                                        controller.changePdLinkG();
                                      })),
                                    ],
                                  ),SizedBox(height: 2.0.hp,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(flex:2,child: Text("recitalAssessment".tr,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "excellent".tr, selected: controller.pdRecitalExc.value, onTap: (){
                                        controller.changePdRecitalEx();
                                      })),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "veryGood".tr, selected: controller.pdRecitalVG.value, onTap: (){
                                        controller.changePdRecitalVG();
                                      })),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "good".tr, selected: controller.pdRecitalG.value, onTap: (){
                                        controller.changePdRecitalG();
                                      })),
                                    ],
                                  ),SizedBox(height: 2.0.hp,),
                                ],
                              ),
                            )
                        ),SizedBox(height: 1.0.hp,),
                        Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardsRadius)),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 10.0,vertical: mainPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("todayHezh".tr,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.0.sp),),
                                  SizedBox(height: 2.0.hp,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(flex:2,child: Text("memorisingAssessment".tr,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "excellent".tr, selected: controller.tSaveExc.value, onTap: (){
                                        controller.changeTSaveEx();
                                      })),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "veryGood".tr, selected: controller.tSaveVG.value, onTap: (){
                                        controller.changeTSaveVG();
                                      })),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "good".tr, selected: controller.tSaveG.value, onTap: (){
                                        controller.changeTSaveG();
                                      })),
                                    ],
                                  ),SizedBox(height: 2.0.hp,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(flex:2,child: Text("connectAssessment".tr,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "excellent".tr, selected: controller.tLinkExc.value, onTap: (){
                                        controller.changeTLinkEx();
                                      })),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "veryGood".tr, selected: controller.tLinkVG.value, onTap: (){
                                        controller.changeTLinkVG();
                                      })),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "good".tr, selected: controller.tLinkG.value, onTap: (){
                                        controller.changeTLinkG();
                                      })),
                                    ],
                                  ),SizedBox(height: 2.0.hp,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(flex:2,child: Text("recitalAssessment".tr,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "excellent".tr, selected: controller.tRecitalExc.value, onTap: (){
                                        controller.changeTRecitalEx();
                                      })),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "veryGood".tr, selected: controller.tRecitalVG.value, onTap: (){
                                        controller.changeTRecitalVG();
                                      })),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "good".tr, selected: controller.tRecitalG.value, onTap: (){
                                        controller.changeTRecitalG();
                                      })),
                                    ],
                                  ),SizedBox(height: 2.0.hp,),
                                ],
                              ),
                            )
                        ),
                      ],
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
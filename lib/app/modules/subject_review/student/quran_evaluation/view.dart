
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/modules/subject_review/student/quran_evaluation/widgets/handling_data_quran.dart';
import '../../../../core/constants/border_radius.dart';
import '../../../../core/constants/height.dart';
import '../../../../core/values/colors.dart';
import '../../../../widgets/top_widget.dart';
import '../../../../widgets/top_widget_title.dart';
import '../../widgets/teacher_assessment_button.dart';
import 'controller.dart';

class QuranEvaluationScreen extends StatelessWidget {
  QuranEvaluationController controller = Get.put(QuranEvaluationController());
  QuranEvaluationScreen({Key? key,}) : super(key: key);

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
              child: GetX<QuranEvaluationController>(
                  builder:(controller){
                    return HandlingDataViewQuran(
                        statusRequest: controller.statusRequest.value, 
                        widget: Column(
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
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "excellent".tr, selected: controller.data.saveThePreviousDay=="excellent",)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "veryGood".tr, selected: controller.data.saveThePreviousDay=="very_good",)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "good".tr, selected: controller.data.saveThePreviousDay=="good",)),
                                    ],
                                  ),SizedBox(height: 2.0.hp,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(flex:2,child: Text("connectAssessment".tr,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "excellent".tr, selected: controller.data.linkVersesThePreviousDayVerses=="excellent",)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "veryGood".tr, selected: controller.data.linkVersesThePreviousDayVerses=="very_good",)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "good".tr, selected:controller.data.linkVersesThePreviousDayVerses=="good",)),
                                    ],
                                  ),SizedBox(height: 2.0.hp,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(flex:2,child: Text("recitalAssessment".tr,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "excellent".tr, selected: controller.data.recitalThePreviousDay=="excellent",)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "veryGood".tr, selected: controller.data.recitalThePreviousDay=="very_good",)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "good".tr, selected: controller.data.recitalThePreviousDay=="good",)),
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
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "excellent".tr, selected: controller.data.saveVerses=="excellent",)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "veryGood".tr, selected: controller.data.saveVerses=="very_good",)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "good".tr, selected: controller.data.saveVerses=="good",)),
                                    ],
                                  ),SizedBox(height: 2.0.hp,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(flex:2,child: Text("connectAssessment".tr,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "excellent".tr, selected: controller.data.linkVerses=="excellent",)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "veryGood".tr, selected: controller.data.linkVerses=="very_good",)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "good".tr, selected:controller.data.linkVerses=="good",)),
                                    ],
                                  ),SizedBox(height: 2.0.hp,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(flex:2,child: Text("recitalAssessment".tr,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "excellent".tr, selected: controller.data.recital=="excellent",)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "veryGood".tr, selected: controller.data.recital=="very_good",)),
                                      SizedBox(width: 1.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "good".tr, selected: controller.data.recital=="good",)),
                                    ],
                                  ),SizedBox(height: 2.0.hp,),
                                ],
                              ),
                            )
                        ),
                      ],
                    )
                    );
                  }
              )
          ),
        ],
      ),floatingActionButton: FloatingActionButton(
        heroTag: 654,
        tooltip: "Add Comment",backgroundColor:red,
        onPressed: (){
          Get.toNamed("/add-comment-screen",arguments: {
            "reviewID":controller.data.id
          });
        },
        child: const Icon(Icons.comment))
    );
  }
}
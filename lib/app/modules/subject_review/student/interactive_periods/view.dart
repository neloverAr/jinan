
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import '../../../../core/constants/border_radius.dart';
import '../../../../core/constants/height.dart';
import '../../../../core/values/colors.dart';
import '../../../../widgets/top_widget.dart';
import '../../../../widgets/top_widget_title.dart';
import '../../widgets/teacher_assessment_button.dart';
import 'controller.dart';

class InteractivePeriodsScreen extends StatelessWidget {
  InteractivePeriodsController controller = Get.put(InteractivePeriodsController());
  InteractivePeriodsScreen({Key? key,}) : super(key: key);

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
              child: GetX<InteractivePeriodsController>(
                  builder:(controller){
                    return Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardsRadius)),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: mainPadding),
                          child: HandlingDataView(
                            statusRequest: controller.statusRequest.value,
                            widget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("assessment".tr,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.0.sp)),
                              SizedBox(height: 2.0.hp,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(flex:1,child: TeacherAssessmentButton(text: "interactive".tr, selected: controller.data.review=="interactive",)),
                                  SizedBox(width: 2.0.wp,),
                                  Expanded(flex:1,child: TeacherAssessmentButton(text: "notInteractive".tr, selected: controller.data.review=="not_interacting",)),
                                  SizedBox(width: 2.0.wp,),
                                  Expanded(flex:1,child: TeacherAssessmentButton(text: "absents".tr, selected: controller.data.review=="absent")),
                                ],
                              ),SizedBox(height: 30.0.hp,)
                            ],
                          ),)
                        )
                    );
                  }
              )
          ),
        ],
      ),floatingActionButton: FloatingActionButton(
        heroTag: 200,
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
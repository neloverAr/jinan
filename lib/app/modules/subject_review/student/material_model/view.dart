
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

class MaterialModelScreen extends StatelessWidget {
  MaterialModelController controller = Get.put(MaterialModelController());
  MaterialModelScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          TopWidget(
              type: "fixed",
              containedWidget:
              TopWidgetTitle(type: "withBackArrow", text: "materialAssessment".tr,)),
          Positioned(
              top: upperWidgetHeight - upperWidgetRadius +10,
              left: mainPadding,
              right: mainPadding,
              child: GetX<MaterialModelController>(
                  builder:(controller){
                    return Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardsRadius)),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: mainPadding),
                          child: HandlingDataView(statusRequest: controller.statusRequest.value,
                              widget: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("assessment".tr,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.0.sp)),
                                  SizedBox(height: 2.0.hp,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "capable".tr, selected: controller.data.reviewFromThree=="versed",)),
                                      SizedBox(width: 2.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "needsFollowup".tr, selected: controller.data.reviewFromThree=="needs_follow",)),
                                      SizedBox(width: 2.0.wp,),
                                      Expanded(flex:1,child: TeacherAssessmentButton(text: "unable".tr, selected: controller.data.reviewFromThree=="unversed",)),
                                    ],
                                  ),SizedBox(height: 30.0.hp,)
                                ],
                              ),
                          )
                        )
                    );
                  }
              )
          ),
        ],
      ),floatingActionButton: FloatingActionButton(
        heroTag: 210,
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

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

class AddMaterialModelScreen extends StatelessWidget {
  AddMaterialModelController controller = Get.put(AddMaterialModelController());
  AddMaterialModelScreen({Key? key,}) : super(key: key);

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
              child: GetX<AddMaterialModelController>(
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
                                  Expanded(flex:1,child: TeacherAssessmentButton(text: "capable".tr, selected: controller.versed.value, onTap: (){
                                    controller.changeVersed();
                                  })),
                                  SizedBox(width: 2.0.wp,),
                                  Expanded(flex:1,child: TeacherAssessmentButton(text: "needsFollowup".tr, selected: controller.needsFollow.value, onTap: (){
                                    controller.changeNeedsFollow();
                                  })),
                                  SizedBox(width: 2.0.wp,),
                                  Expanded(flex:1,child: TeacherAssessmentButton(text: "unable".tr, selected: controller.unversed.value, onTap: (){
                                    controller.changeUnversed();
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
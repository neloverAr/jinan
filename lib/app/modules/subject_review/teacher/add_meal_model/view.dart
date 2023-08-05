
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/abouts_us_text.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/icons.dart';
import 'package:school/app/modules/subject_review/widgets/teacher_assessment_icon_button.dart';
import '../../../../core/constants/border_radius.dart';
import '../../../../core/constants/height.dart';
import '../../../../core/values/colors.dart';
import '../../../../widgets/top_widget.dart';
import '../../../../widgets/top_widget_title.dart';
import 'controller.dart';

class AddMealModelsScreen extends StatelessWidget {
  AddMealModelController controller = Get.put(AddMealModelController());
  AddMealModelsScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          TopWidget(
              type: "fixed",
              containedWidget:
              TopWidgetTitle(type: "withBackArrow", text: "mealAssessment".tr,)),
          Positioned(
              top: upperWidgetHeight - upperWidgetRadius +10,
              left: mainPadding,
              right: mainPadding,
              child: GetX<AddMealModelController>(
                  builder:(controller){
                    return Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardsRadius)),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: mainPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("eat".tr,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.0.sp)),
                              SizedBox(height: 2.0.hp,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(flex:1,child: TeacherAssessmentIconButton(text: "all".tr, selected: controller.everyone.value, icon: allIcon,onTap: (){
                                    controller.changeEveryone();
                                  })),
                                  SizedBox(width: 2.0.wp,),
                                  Expanded(flex:1,child: TeacherAssessmentIconButton(text: "most".tr, selected: controller.most.value,icon: mostIcon ,onTap: (){
                                    controller.changeMost();
                                  })),
                                  SizedBox(width: 2.0.wp,),
                                  Expanded(flex:1,child: TeacherAssessmentIconButton(text: "little".tr, selected: controller.some.value,icon: littleIcon, onTap: (){
                                    controller.changeSome();
                                  })),
                                  SizedBox(width: 2.0.wp,),
                                  Expanded(flex:1,child: TeacherAssessmentIconButton(text: "nothing".tr, selected: controller.more.value,icon: nothingIcon, onTap: (){
                                    controller.changeMore();
                                  })),
                                ],
                              ),SizedBox(height: 2.0.hp,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(flex:2,child: Text("mealAmount".tr)),
                                  SizedBox(width: 2.0.wp,),
                                  Expanded(flex:2,child: TeacherAssessmentIconButton(text: "suitable".tr, selected: controller.suitable.value,icon: slightlySmilingFaceIcon, onTap: (){
                                    controller.changeSuitable();
                                  })),
                                  SizedBox(width: 2.0.wp,),
                                  Expanded(flex:2,child: TeacherAssessmentIconButton(text: "notSuitable".tr, selected: controller.notAppropriate.value,icon: disappointedIcon, onTap: (){
                                    controller.changeNotAppropriate();
                                  })),
                                ],
                              ),SizedBox(height: 2.0.hp,),
                              Text("note".tr,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.0.sp)),
                              SizedBox(height: 2.0.hp,),
                              TextFormField(
                                controller: controller.note,
                                maxLines: 4,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: trialStr,
                                    hintStyle: TextStyle(color:grey),
                                    fillColor: const Color(0xFFFBFBFB),
                                    filled: true,
                                    border:  OutlineInputBorder(
                                      borderRadius:  BorderRadius.circular(textFieldRadius),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xEEEEEEEE),
                                      ),
                                    )
                                ),

                              ),SizedBox(height: 2.0.hp,),
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
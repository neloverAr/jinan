
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import '../../../../core/constants/border_radius.dart';
import '../../../../core/constants/height.dart';
import '../../../../core/values/colors.dart';
import '../../../../core/values/icons.dart';
import '../../../../widgets/top_widget.dart';
import '../../../../widgets/top_widget_title.dart';
import '../../widgets/teacher_assessment_icon_button.dart';
import 'controller.dart';

class MealModelsScreen extends StatelessWidget {
  MealModelController controller = Get.put(MealModelController());
  MealModelsScreen({Key? key,}) : super(key: key);

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
              child: GetX<MealModelController>(
                  builder:(controller){
                    return Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardsRadius)),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: mainPadding),
                          child: HandlingDataView(statusRequest: controller.statusRequest.value, widget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("eat".tr,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.0.sp)),
                              SizedBox(height: 2.0.hp,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(flex:1,child: TeacherAssessmentIconButton(text: "all".tr,icon: allIcon, selected: controller.data.amount=="everyone",)),
                                  SizedBox(width: 2.0.wp,),
                                  Expanded(flex:1,child: TeacherAssessmentIconButton(text: "most".tr, icon: mostIcon ,selected: controller.data.amount=="most",)),
                                  SizedBox(width: 2.0.wp,),
                                  Expanded(flex:1,child: TeacherAssessmentIconButton(text: "little".tr,icon: littleIcon, selected: controller.data.amount=="some",)),
                                  SizedBox(width: 2.0.wp,),
                                  Expanded(flex:1,child: TeacherAssessmentIconButton(text: "nothing".tr, icon: nothingIcon,selected: controller.data.amount=="more",)),
                                ],
                              ),SizedBox(height: 2.0.hp,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(flex:2,child: Text("mealAmount".tr)),
                                  SizedBox(width: 2.0.wp,),
                                  Expanded(flex:2,child: TeacherAssessmentIconButton(text: "suitable".tr,icon: slightlySmilingFaceIcon, selected: controller.data.mealContent=="suitable",)),
                                  SizedBox(width: 2.0.wp,),
                                  Expanded(flex:2,child: TeacherAssessmentIconButton(text: "notSuitable".tr,icon: disappointedIcon, selected:  controller.data.mealContent=="not_appropriate")),
                                ],
                              ),SizedBox(height: 2.0.hp,),
                              Text("note".tr,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.0.sp)),
                              SizedBox(height: 2.0.hp,),
                              TextFormField(
                                enabled: false,
                                maxLines: 4,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: controller.data.notes,
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
                          ),)
                        )
                    );
                  }
              )
          ),
        ],
      ),
        floatingActionButton: FloatingActionButton(
            heroTag: 345,
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
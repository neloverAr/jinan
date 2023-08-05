import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/values/images_path.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import 'package:school/app/widgets/icon_name_widget.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import '../../../../core/constants/border_radius.dart';
import '../../../../core/constants/height.dart';
import 'controller.dart';

class SubjectDetail extends StatelessWidget {
  final events;
  SubjectDetail({Key? key, this.events,}) : super(key: key);
  SubjectDetailsController controller = Get.put(SubjectDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<SubjectDetailsController>(
        builder: (controller){
          return HandlingDataView(statusRequest: controller.statusRequest.value,
              widget: Stack(
            fit: StackFit.expand,
            children: [
              TopWidget(type: "fixed", containedWidget: TopWidgetTitle(
                type: "withBackArrow",text: controller.data.arName!,
              )),
              Positioned(
                top: upperWidgetHeight - upperWidgetRadius+5,
                left: mainPadding,
                right: mainPadding,
                child: SizedBox(
                  //height: Get.height*.5,
                  child: GridView.count(
                    primary: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children:<Widget>[
                      IconNameWidget(name: "chapters".tr, icon: chaptersImage,onTap: (){
                        Get.toNamed("/chapter-list-screen",arguments: {
                          "subjectID2":controller.data.id!,
                          "nextRoute":getPageRoute(controller.data.reviewForm!),
                        });
                      },),
                      IconNameWidget(name: "homework".tr, icon: studentAssignmentImage,onTap: (){
                        Get.toNamed("/homework-list-screen",arguments: {
                          "subjectID2":controller.data.id!
                        });
                      },),
                      IconNameWidget(name: "activitiesAndEvents".tr, icon: activitiesAndEventsImage,onTap: (){
                        Get.toNamed("/subject-event-screen",arguments: {
                          "subjectID2":controller.data.id!
                        });
                      }),
                      // IconNameWidget(name: "dailyFollowUp".tr, icon: chaptersImage,
                      //     onTap: (){
                      //   Get.toNamed(getPageRoute(controller.data.reviewForm!),arguments: {
                      //     "subjectID2":controller.data.id!
                      //   });
                      // }),
                    ],
                  ),
                ),
              )
            ],
          ));
        },
      )
    );
  }

  String getPageRoute(String formType){
    if(formType=="interactive_periods"){
      return "/interactive-periods-screen";
    }
    else if(formType=="quran_evaluation"){
      return "/quran-evaluation-screen";
    }
    else if(formType=="meal_model"){
      return "material-model-screen";
    }
    return "material-model-screen";
  }
}

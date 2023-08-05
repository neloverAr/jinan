
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/modules/students/widgets/student_box.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import 'controller.dart';

class TeacherStudentsForReviewList extends StatelessWidget {
  TeacherStudentsForReviewList({Key? key}) : super(key: key);
  final StudentsController controller = Get.put(StudentsController());
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetX<StudentsController>(
          builder: (controller){
            return CustomScrollView(
              controller: scrollController,
              slivers: [
                TopWidget(type: "sliver", containedWidget:
                TopWidgetTitle(text: "myStudents".tr, type: 'withBackArrow',)),
                SliverToBoxAdapter(
                  child: HandlingDataView(statusRequest: controller.statusRequest.value, widget:
                  GridView.builder(
                    controller: scrollController,
                    padding: EdgeInsets.symmetric(horizontal: mainPadding,vertical: 1.5.hp),
                    physics:const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.students.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300.0,
                      mainAxisExtent: 200,
                      mainAxisSpacing:12.0,
                      crossAxisSpacing: 12.0,
                      //childAspectRatio: 1.0,
                    ), itemBuilder: (BuildContext context, int index) {
                    return StudentBox(student: controller.students[index],onTap: (){
                        Get.toNamed(getPageRoute(),arguments: {
                          "subjectID":Get.arguments["subjectID"],
                          "chapterID":Get.arguments["chapterID"],
                          "studentID":controller.students[index].id
                        });
                    }
                      ,);
                  },
                  ),
                  ),
                )
              ],
            );
          },
        )
    );
  }

  String getPageRoute(){
    if(Get.arguments["reviewForm"]=="interactive_periods"){
      return "/add-interactive-periods-screen";
    }
    else if(Get.arguments["reviewForm"]=="quran_evaluation"){
      return "/add-quran-evaluation-screen";
    }
    else if(Get.arguments["reviewForm"]=="meal_model"){
      return "/add-meal-model-screen";
    }else{
      return "/add-material-model-screen";
    }
  }
}

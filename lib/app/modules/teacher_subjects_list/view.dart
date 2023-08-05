
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import 'widgets/chapter_box_widget.dart';
import 'controller.dart';

class TeacherChapterListScreen extends StatelessWidget{
  TeacherChapterListScreen({Key? key,}) : super(key: key);
  TeacherChaptersController controller = Get.put(TeacherChaptersController());
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetX<TeacherChaptersController>(
          builder: (controller){
            return CustomScrollView(
              controller: scrollController,
              slivers: [
                TopWidget(type: "sliver", containedWidget: TopWidgetTitle(
                  type: "withBackArrow",text: "chapters".tr,),
                ),
                SliverToBoxAdapter(
                  child: HandlingDataView(
                    statusRequest: controller.statusRequest.value,
                    widget: ListView.builder(
                      controller: scrollController,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context, int index) {
                        return ChapterBoxWidget(chapter: controller.data[index],onTap: (){
                          //print(controller.chapters[index].file);
                          Get.toNamed("/teacher-students-forReview-screen",arguments: {
                            "subjectID":Get.arguments["subjectID"],
                            "reviewForm":Get.arguments["reviewForm"],
                            "chapterID":controller.data[index].id,
                          });
                        },);
                      },
                      itemCount: controller.data.length,
                    ),
                  ),
                ),
              ],
            );
          },
        )
    );
  }
}
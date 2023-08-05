
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/modules/subjects/student/chapters/controller.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import 'chapter_details.dart';
import 'widgets/chapter_summery_widget.dart';

class ChapterListScreen extends StatelessWidget {
  ChapterListScreen({Key? key,}) : super(key: key);
  SubjectChapterController controller = Get.put(SubjectChapterController());
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<SubjectChapterController>(
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
                      return ChapterSummeryWidget(chapter: controller.chapters[index],onTap: (){
                        print(controller.chapters[index].file);
                        Get.to(()=>ChapterDetail(chapter: controller.chapters[index]));
                      },);
                    },
                    itemCount: controller.chapters.length,
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


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/modules/subjects/student/homeworks/controller.dart';
import 'package:school/app/modules/subjects/student/homeworks/widgets/subject_homework_widget.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import '../../../../core/constants/padding.dart';
import '../../../../widgets/top_widget.dart';
import '../../../../widgets/top_widget_title.dart';

class SubjectHomeworkListScreen extends StatelessWidget {
  SubjectHomeworkListScreen({Key? key}) : super(key: key);
  SubjectHomeworksController controller = Get.put(SubjectHomeworksController());
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<SubjectHomeworksController>(
        builder: (controller){
          return CustomScrollView(
              controller: scrollController,
              slivers:[
                TopWidget(
                  type: "sliver",
                  containedWidget:
                  TopWidgetTitle(type: "withBackArrow", text: "homework".tr),),
                SliverToBoxAdapter(
                  child: HandlingDataView(
                    statusRequest: controller.statusRequest.value,
                    widget: ListView.builder(
                        controller: scrollController,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount:controller.homeworks.length,
                        itemBuilder:(BuildContext context,int index){
                          return Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal:mainPadding-10,
                                vertical: 5
                            ),
                            child: SubjectHomeworkWidget(assignment: controller.homeworks[index],),
                          );
                        }
                    ),
                  ),
                ),
              ]
          );
        },
      )
    );
  }
}

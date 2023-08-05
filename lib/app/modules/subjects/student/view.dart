import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/modules/subjects/student/controller.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import 'package:school/app/widgets/icon_name_widget.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import '../../../core/constants/padding.dart';
import '../../../core/values/images_path.dart';

class StudentSubjectsScreen extends StatelessWidget {
  StudentSubjectsScreen({Key? key}) : super(key: key);
  StudentSubjectController controller = Get.put(StudentSubjectController());
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          TopWidget(type: "sliver", containedWidget: TopWidgetTitle(
            type: "main",text: "subjects".tr,
          ),
          ),
          SliverToBoxAdapter(
              child: GetX<StudentSubjectController>(
                builder: (controller){
                  return HandlingDataView(
                    statusRequest: controller.statusRequest.value,
                    widget: GridView.builder(
                      controller: scrollController,
                      padding: EdgeInsets.symmetric(horizontal: mainPadding,vertical: 1.5.hp),
                      physics:const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.data.length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300.0,
                        mainAxisSpacing: 12.0,
                        crossAxisSpacing: 12.0,
                        childAspectRatio: 0.9,
                      ), itemBuilder: (BuildContext context, int index) {
                      return IconNameWidget(name: controller.data[index].name!,
                        icon: onBoarding3,
                        onTap: (){
                          Get.toNamed("/subject-details",arguments: {
                            "subjectID":controller.data[index].id,
                          });
                        },
                      ) ;},
                    ),
                  );
                },
              )
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/modules/add_points/widgets/student_addPoints_card.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import '../../core/constants/padding.dart';
import 'controller.dart';

class AddPoints extends StatelessWidget {
   AddPoints({Key? key}) : super(key: key);
   AddPointsController controller = Get.put(AddPointsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<AddPointsController>(
        builder: (controller){
          return CustomScrollView(
            slivers: [
              TopWidget(type: "sliver", containedWidget: TopWidgetTitle(
                text: 'addPoints'.tr,
                type: 'withBackArrow',
              )),
              SliverToBoxAdapter(
                child: HandlingDataView(statusRequest: controller.statusRequest.value, widget:
                GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: mainPadding,vertical: 1.5.hp),
                  physics:const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.semesterStudents.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300.0,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 12.0,
                    childAspectRatio: 0.9,
                  ), itemBuilder: (BuildContext context, int index) {
                  return StudentAddPointsCard(std:controller.semesterStudents[index],
                  );
                },
                ),
                )
              )

            ],
          );
        },
      )
    );
  }
}

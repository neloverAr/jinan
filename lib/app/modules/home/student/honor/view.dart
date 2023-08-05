
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import 'controller.dart';
import 'widgets/honor_box.dart';

class HonorScreen extends StatelessWidget {
  HonorScreen({Key? key}) : super(key: key);
  HonorController controller = Get.put(HonorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<HonorController>(
        builder: (controller){
          return CustomScrollView(
            slivers: [
              TopWidget(type: "sliver", containedWidget:
              TopWidgetTitle(text: "honorBoard".tr, type: 'withBackArrow',)),
              SliverToBoxAdapter(
                child: HandlingDataView(statusRequest: controller.statusRequest.value, widget:
                GridView.builder(
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
                  return HonorBox(board:controller.data[index]) ;},
                ),)
              )
            ],
          );
        },
      )
    );
  }
}

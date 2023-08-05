
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/data/services/storage/services.dart';
import 'package:school/app/modules/settings/student/points/controller.dart';
import 'package:school/app/modules/settings/student/points/widgets/points_number.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import '../../../../core/constants/padding.dart';

class PointsScreen extends StatelessWidget {
  //final int points;
  PointsScreen({Key? key}) : super(key: key);
  PointsController pointsController = Get.put(PointsController());
  StorageService storageService = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<PointsController>(
        builder: (controller){
          return CustomScrollView(
            slivers: [
              TopWidget(type: "sliver", containedWidget: TopWidgetTitle(
                text:"myPoints".tr, type: 'withBackArrow' ,
              )),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: mainPadding-10,vertical: 5),
                  child: PointsNumberWidget(name:"noOfPoints".tr,
                    points:controller.total),
                ),
              ),
              SliverToBoxAdapter(
                child: HandlingDataView(statusRequest: controller.statusRequest.value,
                    widget: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                        itemCount: controller.data.length,
                         itemBuilder: (BuildContext context,int index){
                          return Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal:mainPadding-10,
                                vertical: 5
                            ),
                            child: PointsNumberWidget(name: controller.data[index].reasonsForEvaluation!.title!, points: controller.data[index].totalPoints!),
                          );
                        })
                ),
              )
            ],
          );
        },
      )
    );
  }
}
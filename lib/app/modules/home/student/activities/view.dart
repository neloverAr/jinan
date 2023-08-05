
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/modules/home/student/activities/controller.dart';
import 'package:school/app/modules/home/widgets/handling_data_view_event.dart';
import '../../../../core/constants/padding.dart';
import 'widgets/activity_widget.dart';

class ActivitiesScreen extends StatelessWidget{
  ActivitiesScreen({Key? key}) : super(key: key);
  ActivitiesController controller = Get.put(ActivitiesController());

  @override
  Widget build(BuildContext context) {
    return GetX<ActivitiesController>(builder: (controller){
      return HandlingDataViewEvent(
        statusRequest: controller.statusRequest.value,
        widget: Column(
        children: [
          ...controller.data.map((e) =>
              Padding(
                padding:EdgeInsets.symmetric(
                  horizontal: mainPadding,
                  vertical: 12.0,
                ),
                child: ActivityWidget(event: e,onTap: (){
                  controller.goToDescData(e);
                },),
              )).toList(),
        ],
      )
        ,);
    });
  }
}

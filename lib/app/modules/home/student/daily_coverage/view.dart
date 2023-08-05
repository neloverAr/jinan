
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/modules/home/student/daily_coverage/controller.dart';
import 'package:school/app/modules/home/widgets/handling_data_view_event.dart';
import '../../../../core/constants/padding.dart';
import '../../widgets/event_widget.dart';

class DailyCoverageScreen extends StatelessWidget{
  DailyCoverageScreen({Key? key}) : super(key: key);

  DailyCoverageController controller = Get.put(DailyCoverageController());

  @override
  Widget build(BuildContext context) {
    return GetX<DailyCoverageController>(builder: (controller){
      return HandlingDataViewEvent(statusRequest: controller.statusRequest.value,
        widget: Column(
          children: [
            ...controller.data.map((e) =>
                Padding(
                  padding:EdgeInsets.symmetric(
                    horizontal: mainPadding,
                    vertical: 12.0,
                  ),
                  child: EventWidget(event: e, onTap: () {
                    controller.goToDescData(e.id!);
                    },),
                ))
                .toList(),
          ],
        )
        ,);
    });
  }
}

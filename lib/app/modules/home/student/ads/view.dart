
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/modules/home/student/ads/controller.dart';
import 'package:school/app/modules/home/widgets/handling_data_view_event.dart';
import '../../../../core/constants/padding.dart';
import '../../widgets/event_widget.dart';

class AdsScreen extends StatelessWidget{
  AdsScreen({Key? key}) : super(key: key);
  AdsController controller = Get.put(AdsController());

  @override
  Widget build(BuildContext context) {
    return GetX<AdsController>(builder: (controller){
      return HandlingDataViewEvent(statusRequest: controller.statusRequest.value,widget:
      Column(
        children: [
          ...controller.data.map((e) =>
              Padding(
                padding:EdgeInsets.symmetric(
                  horizontal: mainPadding,
                  vertical: 12.0,
                ),
                child: EventWidget(event: e,onTap: (){
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

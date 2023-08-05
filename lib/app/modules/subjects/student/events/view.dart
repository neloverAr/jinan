
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/padding.dart';
import '../../../../widgets/handling_data_view.dart';
import '../../../../widgets/top_widget.dart';
import '../../../../widgets/top_widget_title.dart';
import 'controller.dart';
import 'subject_event_details.dart';
import 'widgets/event_summery.dart';

class SubjectEventScreen extends StatelessWidget{
  SubjectEventScreen({Key? key}) : super(key: key);
  SubjectEventsController controller = Get.put(SubjectEventsController());
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<SubjectEventsController>(builder: (controller){
      return CustomScrollView(
        controller: scrollController,
        slivers: [
          TopWidget(type: "sliver", containedWidget: TopWidgetTitle(
            type: "withBackArrow",text: "activitiesAndEvents".tr,),),
          SliverToBoxAdapter(
            child: HandlingDataView(
              statusRequest: controller.statusRequest.value,
              widget: ListView.builder(
                controller: scrollController,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder:
                    (BuildContext context, int index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal:mainPadding-10,
                        vertical: 5
                    ),
                    child: EventSummery(event: controller.events[index],
                      onTap: (){
                        Get.to(()=>SubjectEventDescription(event: controller.events[index]));
                      },
                    ),
                  );
                },
                itemCount: controller.events.length,
              ),
            ),
          ),
        ],
      );
    },
    ));
  }
}

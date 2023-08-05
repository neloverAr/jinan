
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/modules/notifications/widgets/notification_box.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import 'package:school/app/widgets/top_widget.dart';
import '../../core/constants/padding.dart';
import '../../core/values/colors.dart';
import '../../widgets/top_widget_title.dart';
import 'controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);
  NotificationController controller = Get.put(NotificationController());
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<NotificationController>(
        builder: (controller){
          return CustomScrollView(
            controller: scrollController,
            slivers: [
              TopWidget(
                  type: "sliver",
                  containedWidget:
                  TopWidgetTitle(type: "withBackArrow",
                    text: 'notifications'.tr,)),
              SliverToBoxAdapter(
                child:HandlingDataView(statusRequest: controller.statusRequest.value,
                  widget: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount:controller.notificationList.length,
                    controller: scrollController,
                    itemBuilder: (BuildContext context,int index){
                      return Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal:mainPadding-10,
                            vertical: 5
                        ),
                        child: NotificationBox(notification: controller.notificationList[index],),
                      );
                    }
                ),)
              ),
            ],
          );
        },
      ),floatingActionButton: FloatingActionButton(
        heroTag: 15,
        tooltip: "Mark as Read",
        backgroundColor:red,
        onPressed: (){
          controller.readNotification();
        },
        child: const Icon(Icons.check))
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/class/status_request.dart';
import 'package:school/app/core/values/colors.dart';
import '../core/values/icons.dart';
import '../modules/notifications/controller.dart';
import 'dart:io' show Platform;

class NumberedNotification extends StatelessWidget {
  NumberedNotification({Key? key,}) : super(key: key);
  NotificationController notificationController = Get.find();
  //notificationController.calculateUnReadController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: null, icon: SvgPicture.asset(notificationIcon)),
        Positioned(
        right: 11,
        top: 11,
        child: Container(
        padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(6),
          ),
          constraints: const BoxConstraints(
            minWidth: 14,
            minHeight: 14,
          ),
          child: GetX<NotificationController>(
          builder: (controller){
            return (controller.statusRequest.value==StatusRequest.loading)?
           SizedBox(
             height: 4,
             width: 4,
             child: (Platform.isAndroid? Center(child: const CircularProgressIndicator()):
             Center(child: const CupertinoActivityIndicator())),
           )
             :Text(
              '${controller.numberOfUnread.value}',
               style: const TextStyle(
               color: red,
               fontSize: 8,
             ),
            textAlign: TextAlign.center,
           );
           },
          )
        ))
      ],
    );
  }
}

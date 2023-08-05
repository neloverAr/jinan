import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/class/status_request.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/modules/table/controller.dart';
import '../../../core/values/icons.dart';
import '../../../widgets/numbered_notification.dart';
import '../../notifications/controller.dart';
import '../../notifications/view.dart';
import 'dart:io' show Platform;

class TopWidgetTableTitle extends StatelessWidget {
  final text;
  TopWidgetTableTitle({Key? key,required this.text}) : super(key: key);
  NotificationController notificationController =  Get.find();
  TableController tableController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style:const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600
        ),),
        Row(
          children: [
            GetX<TableController>(
                builder: (controller){
              return InkWell(
                onTap: (){
                  tableController.downloadImage();
                }, child:(controller.downloadStatusRequest.value==StatusRequest.loading)?
              (Platform.isAndroid?const CircularProgressIndicator():
              const CupertinoActivityIndicator())
                    :SvgPicture.asset(
                      downloadIcon,
                  color: Colors.white,
                ),
              );
            }),
            SizedBox(width: 2.0.wp,),
            GestureDetector(
              onTap: (){
                //notificationController.getData();
                Get.to(()=> NotificationScreen());
              },
              child: NumberedNotification(),
            ),

          ],
        ),
      ],
    );
  }
}
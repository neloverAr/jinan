
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/modules/notifications/controller.dart';
import 'package:school/app/widgets/numbered_notification.dart';
import '../core/utils/keys.dart';
import '../core/values/icons.dart';
import '../data/services/storage/services.dart';
import '../modules/notifications/view.dart';

class TopWidgetTitle extends StatelessWidget {
  final String text;
  final String type;
  final Function()? onPressed;
  TopWidgetTitle({Key? key,required this.text,required this.type,this.onPressed}) : super(key: key);
  NotificationController notificationController = Get.put(NotificationController());
  static const types = ["main","withBackArrow"];
  StorageService storageService = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      child:type==types[0]?
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,style:const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600
          ),),
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  //notificationController.getData();
                  Get.to(()=> NotificationScreen());
                },
                child: NumberedNotification(),
              ),
            ],
          )
        ],
      ):
      ///////////////////////////////////////////
      Container(
        //color: Colors.red,
        height: 5.0.hp,
        child: Stack(
          fit: StackFit.loose,
          children: [
            Align(
              alignment: storageService.read(langKey)=="ar"?Alignment.centerRight:Alignment.centerLeft,
              child: GestureDetector(
                onTap: (){
                  if(onPressed!=null) {
                    onPressed!();
                  }
                  Get.back();
                }, child: storageService.read(langKey)=="ar"?SvgPicture.asset(
               backIcon,color: Colors.white,)
                  :const Icon(Icons.arrow_back,color: Colors.white,),
              ),),
            Center(
              //heightFactor: 1,
              child: Text(text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),),
            ),
          ],
        ),
      ),
    );
  }
}

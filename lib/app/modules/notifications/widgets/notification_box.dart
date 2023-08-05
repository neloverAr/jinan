
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/core/values/icons.dart';
import '../../../core/constants/border_radius.dart';
import '../../../data/models/notification.dart';

class NotificationBox extends StatelessWidget {
  final NotificationModel notification;
  const NotificationBox({Key? key,required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardsRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(cardsRadius),
        onTap: (){

        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 21.0,
              vertical: 23.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(notification.message!,style: TextStyle(
                color: notification.read=='true'?grey:Colors.black,
              ),),
              Row(
                children: [
                  Text(notification.createdAt!,style: TextStyle(
                    color: notification.read=='true'?grey:Colors.black,
                  ),),
                //   SizedBox(width: 4.0.wp,),
                //   SvgPicture.asset(closeIcon,
                //     color: notification.read=='true'?grey:Colors.black,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

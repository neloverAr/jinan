import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/border_radius.dart';
import 'package:school/app/data/models/EventSummery.dart';
import 'package:school/app/modules/home/student/home_controller.dart';
import '../../../core/constants/height.dart';
import '../../../core/values/colors.dart';

class EventWidget extends StatelessWidget {
   EventWidget({
     required this.event,
    Key? key, required this.onTap,
  }) : super(key: key);
  final EventSummery event;
  final Function() onTap;
  HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height:homeBoxHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image:  DecorationImage(
                  image: CachedNetworkImageProvider(event.image!,),
                  fit:BoxFit.fill,
              ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(cardsRadius),
          onTap: onTap,
          child: Container(
            height:homeBoxHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    red.withOpacity(.7),
                    Colors.white.withOpacity(.3),
                  ]
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize:MainAxisSize.min,
                  children: [
                    Text(event.name!,
                      maxLines:1,
                      style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis
                    ),),
                    const SizedBox(height: 5,),
                    SizedBox(
                      width: 300,
                      child: Text(event.description!,
                       overflow: TextOverflow.ellipsis,
                        maxLines:1,
                        style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                          //overflow: TextOverflow.ellipsis
                      ),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/extensions.dart';

import '../../../../../core/constants/border_radius.dart';
import '../../../../../core/values/colors.dart';
import '../../../../../core/values/icons.dart';

class PointsNumberWidget extends StatelessWidget {
  PointsNumberWidget({
    super.key, required this.name, required this.points,
  });

  final String name;
  final int points;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(cardsRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Row(
          children: [
            Expanded(flex:1,
              child: Container(
                height: 73,
                width: 67,
                decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.circular(cardsRadius)
                ),
                child: Center(
                    child:SvgPicture.asset(
                        pointsIcon
                    )
                ),
              ),
            ),SizedBox(width: 2.0.wp,),
            Expanded(flex:3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,style: TextStyle(fontSize: 12),),
                    SizedBox(height: 1.0.hp,),
                    Text("$points ${"points".tr}",style: TextStyle(color: red,fontSize: 16),),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

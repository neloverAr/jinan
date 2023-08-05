
import 'package:flutter/material.dart';
import '../core/constants/border_radius.dart';
import '../core/constants/height.dart';
import '../core/constants/padding.dart';
import '../core/values/colors.dart';
import 'sliver_upper_widget.dart';

class TopWidget extends StatelessWidget {
  final Widget containedWidget;
  final String type;
  static const types = ["fixed","sliver",];
   const TopWidget({Key? key,required this.type,required this.containedWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(type==types[0]) {
      return Container(
        height: upperWidgetHeight,
        child: Stack(
        children: [
          Container(
            height:upperWidgetHeight,
            decoration:const BoxDecoration(
              color: red,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(upperWidgetRadius),
                  bottomLeft: Radius.circular(upperWidgetRadius)),
            ),),
          Padding(
            padding: EdgeInsets.only(
              top:upperWidgetHeight/2,
              left:mainPadding,
              right:mainPadding,
            ),
            child: containedWidget,
          ),
        ],
    ),
      );
    }
    return SliverUpperWidget(containedWidget: containedWidget);
  }
}


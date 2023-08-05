import 'package:flutter/material.dart';
import 'package:school/app/core/constants/height.dart';
import '../core/constants/border_radius.dart';
import '../core/constants/padding.dart';
import '../core/values/colors.dart';

class SliverUpperWidget extends SliverPersistentHeader{
  final Widget containedWidget;
  SliverUpperWidget({super.key, required this.containedWidget}) : super(delegate: SliverUpperWidgetDelegate(containedWidget: containedWidget));
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate:SliverUpperWidgetDelegate(containedWidget: containedWidget,) ,);
  }

}

class SliverUpperWidgetDelegate extends SliverPersistentHeaderDelegate{
  final Widget containedWidget;
  SliverUpperWidgetDelegate({required this.containedWidget});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: upperWidgetHeight,
      decoration: BoxDecoration(
        color: red,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(upperWidgetRadius-shrinkOffset),
            bottomLeft: Radius.circular(upperWidgetRadius-shrinkOffset)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: 50,
            right: mainPadding,
            left: mainPadding
        ),
        child: containedWidget
      ),
    );
  }

  @override
  double get maxExtent => upperWidgetHeight;

  @override
  double get minExtent => 95.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

}
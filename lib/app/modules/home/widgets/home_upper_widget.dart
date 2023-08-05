import 'package:flutter/material.dart';
import 'package:school/app/core/constants/border_radius.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/functions/checkLanguage.dart';
import 'package:school/app/modules/home/widgets/Search-field.dart';
import 'package:school/app/modules/home/widgets/Search-field_teacher.dart';
import 'package:school/app/widgets/top_widget_title.dart';

class HomeUpperWidget extends SliverPersistentHeader{
  final text;
  final maxHeight;
  HomeUpperWidget({required this.text,required this.maxHeight}) : super(delegate: SliverUpperWidgetDelegate(text: text,maxHeight: maxHeight));
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate:SliverUpperWidgetDelegate(text: text,maxHeight: maxHeight) ,);
  }
}
class SliverUpperWidgetDelegate extends SliverPersistentHeaderDelegate{
  final String text;
  final maxHeight;

  SliverUpperWidgetDelegate({required this.text,required this.maxHeight});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior :Clip.none,
      children: [
        Container(
          height: maxHeight,
          decoration: BoxDecoration(
            color: red,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(upperWidgetRadius-shrinkOffset),
                bottomLeft: Radius.circular(upperWidgetRadius-shrinkOffset)),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: 30,
                right: mainPadding,
                left: mainPadding
            ),
            child: TopWidgetTitle(text: text,type: "main",)
          ),
        ),
        Positioned(
            top: maxHeight - shrinkOffset -upperWidgetRadius,
            left: mainPadding-shrinkOffset/6,
            right: mainPadding-shrinkOffset/6,
            child: Opacity(
                opacity: disappear(shrinkOffset),
            child: storageService.read("type")=="parents"?SearchField()
            :SearchFieldTeacher())),
      ],
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => 95.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  disappear(shrinkOffset) =>1-shrinkOffset/maxHeight;

}
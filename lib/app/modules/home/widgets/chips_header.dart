
import 'package:flutter/material.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'keywords.dart';

class ChipsSliverPersistentHeader extends SliverPersistentHeaderDelegate{
  final List<String> chips;
  ChipsSliverPersistentHeader({required this.chips});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      alignment: Alignment.topRight,
      height:95,
      color: const Color(0xFFFAFAFA),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: mainPadding,vertical: 5),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return KeywordsWidget(text:chips[index],index:index,);
        },
        separatorBuilder: (BuildContext context, int index) {return SizedBox(width: 3.0.wp,);},
        itemCount: chips.length,
      ),
    );
  }

  @override
  double get maxExtent => 60.0;

  @override
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
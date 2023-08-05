
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school/app/core/utils/extensions.dart';
import '../../../core/constants/padding.dart';
import '../../../core/values/colors.dart';

class DetailLine extends StatelessWidget {
  final String icon;
  final String fieldName;
  final String fieldValue;
  const DetailLine({
    Key? key,
    required this.icon,
    required this.fieldName,
    required this.fieldValue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:mainPadding,vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex:2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(icon),
                SizedBox(width: 1.0.wp,),
                Text("${fieldName} :"),
              ],
            ),
          ),
          Expanded(flex:1,child: Text(fieldValue,style: TextStyle(color: grey),),),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/values/colors.dart';

class AssessmentButton extends StatelessWidget {
  final String text;
  final bool selected;
  final double? width;
  const AssessmentButton({Key? key, required this.text, required this.selected,this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width??80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(
          color: selected?red:Color(0xFFEEEEEE),
        ),
        color: selected?red:Color(0xFFFBFBFB),
      ),
      child: InkWell(
        onTap: (){},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(text,style: TextStyle(
              color: selected?Colors.white:Color(0xFF1A1B23).withOpacity(.4),
              fontWeight: FontWeight.w500
            ),),
          ),
        ),
      ),
    );
  }
}

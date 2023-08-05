
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school/app/core/values/colors.dart';

class TeacherAssessmentIconButton extends StatelessWidget {
  final String text;
  final bool selected;
  final double? width;
  final Function()? onTap;
  final String icon;
  const TeacherAssessmentIconButton({Key? key, required this.text, 
    required this.selected,this.width, this.onTap, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected?red:const Color(0xFFFBFBFB),
      borderRadius: BorderRadius.circular(7.0),
      child: (onTap!=null)?InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(7.0),
        child: Container(
          height: 85,
          //width: width??100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            border: Border.all(
              color: selected?red:Color(0xFFEEEEEE),
            ),
            //color: selected?red:Color(0xFFFBFBFB),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text,style: TextStyle(
                      color: selected?Colors.white:Color(0xFF1A1B23).withOpacity(.4),
                      fontWeight: FontWeight.w500
                  ),),
                  SizedBox(height: 10,),
                  SvgPicture.asset(icon)
                ],
              ),
            ),
          ),
        ),
      ):Container(
        height: 85,
        //width: width??100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(
            color: selected?red:Color(0xFFEEEEEE),
          ),
          //color: selected?red:Color(0xFFFBFBFB),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text,style: TextStyle(
                    color: selected?Colors.white:Color(0xFF1A1B23).withOpacity(.4),
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 10,),
                SvgPicture.asset(icon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum Gender{
 female,male
}

enum Weekdays{
  saturday,sunday,monday,tuesday,wednesday,thursday,friday
}

enum WeekNum{
 first,second,third,forth
}

enum Role{
 student,teacher
}

enum AssessmentBy{
  discipline,food,focus,attendance,assignment,interaction
}

 Map<dynamic,Color> reviewsColor = {
  AssessmentBy.discipline:const Color(0xFFBE1D2C),
  AssessmentBy.food:const Color(0xFFF4C419),
  AssessmentBy.focus:const Color(0xFF983591),
  AssessmentBy.attendance:const Color(0xFF1AB6F1),
  AssessmentBy.assignment:const Color(0xFF96C94F),
  AssessmentBy.interaction:const Color(0xFF008C99),
  "default":const Color(0xFF292D32).withOpacity(.4),
};

List<Widget> emojis = [
 SvgPicture.asset("assets/images/icons/heartEyes.svg"),
 SvgPicture.asset("assets/images/icons/smilingFace.svg"),
 SvgPicture.asset("assets/images/icons/slightlySmilingFace.svg"),
 SvgPicture.asset("assets/images/icons/worried.svg"),
 SvgPicture.asset("assets/images/icons/disappointed.svg"),
];

List<String> subjects = [
 "reciteLastHizb",
 "tibyan",
 "lettersAndNumbers",
 "meal",
 "playground",
 "mainChapters",
 "essentials",
 "scienceAndLiterature",
 "lastLesson",
 "english",
];
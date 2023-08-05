
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/data/models/student.dart';
import 'package:school/app/modules/students/student_details.dart';
import 'package:school/app/widgets/avatar.dart';
import '../../../core/constants/border_radius.dart';
import '../../../widgets/student_avatar.dart';

class StudentBox extends StatelessWidget {
  final Student student;
  final Function() onTap;
  const StudentBox({Key? key,required this.student,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(cardsRadius),
        borderSide: BorderSide.none,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(cardsRadius),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15,vertical: 15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Avatar(image: student.profileImage!,),
                const SizedBox(height:10.0),
                Text(student.fullName!,maxLines: 1,overflow: TextOverflow.ellipsis,),
                Text(student.levelData!,style: const TextStyle(color: red),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

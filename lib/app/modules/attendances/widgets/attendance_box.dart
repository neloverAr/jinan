
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/border_radius.dart';
import 'package:school/app/core/values/icons.dart';
import 'package:school/app/modules/home/student/home_controller.dart';

class AttendanceBox extends StatelessWidget {
  final bool absent;
  final String day;
  final String date;
  AttendanceBox({Key? key,required this.absent,
    required this.day, required this.date}) : super(key: key);
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardsRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(cardsRadius),
        onTap: (){
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                SizedBox(
                  width: 70,
                  child: Text(day),
                ),
                Text(date),
              ],),
              Row(children: [
                SvgPicture.asset(presentIcon,
                  color: absent?Color(0xFF9E9E9E).withOpacity(.4)
                      :Color(0xFF80EA4E),),
                SizedBox(width: 10,),
                SvgPicture.asset(absentIcon,
                  color: absent?Color(0xFFBE1D2C)
                      :Color(0xFF9E9E9E).withOpacity(.4),),
              ],),
            ],
          ),
        ),
      ),
    );
  }

}

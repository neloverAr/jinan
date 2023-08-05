
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/border_radius.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/widgets/avatar.dart';
import '../../../data/models/student.dart';
import '../../../data/services/storage/services.dart';
import '../../../functions/checkLanguage.dart';
import '../controller.dart';

class AddAttendanceBox extends StatelessWidget {
  final Student std;
  final int index;
  final Function() onTap;
  AddAttendanceBox({Key? key,required this.std,required this.onTap,
    required this.index}) : super(key: key);
  StorageService storageService = Get.find();
  AddAttendancesController addAttendancesController = Get.find();

  @override
  Widget build(BuildContext context) {
    //var radius = 35.0;
    return GetX<AddAttendancesController>(builder: (controller){
      return Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 40,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: InkWell(
          onTap: (){
            addAttendancesController.attendancesStatus[index].value
            =!(addAttendancesController.attendancesStatus[index]).value;
          },
          child: Row(
            children: [
              Expanded(flex:3,child: Container(
                height:10.0.hp,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: isArLang()?Radius.circular(0):Radius.circular(cardsRadius),
                    bottomLeft: isArLang()?Radius.circular(0):Radius.circular(cardsRadius),
                    topRight: isArLang()?Radius.circular(cardsRadius):Radius.circular(0),
                    bottomRight: isArLang()?Radius.circular(cardsRadius):Radius.circular(0),
                  ),
                ),child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Avatar(image: std.profileImage!),
                ),
                SizedBox(width:40.0.wp,child: Text(std.fullName!,maxLines: 1,overflow: TextOverflow.ellipsis,)),
              ],),
              )),
              Expanded(flex:1,child: Container(
                height:10.0.hp,decoration:
              BoxDecoration(
                color: addAttendancesController.attendancesStatus[index].value ?const Color(0xEE80EA4E):red,
                borderRadius:  BorderRadius.only(
                  topLeft: isArLang()?Radius.circular(cardsRadius):Radius.circular(0),
                  bottomLeft: isArLang()?Radius.circular(cardsRadius):Radius.circular(0),
                  topRight: isArLang()?Radius.circular(0):Radius.circular(cardsRadius),
                  bottomRight: isArLang()?Radius.circular(0):Radius.circular(cardsRadius),
                ),
              ),child: Center(child: Text(addAttendancesController.attendancesStatus[index].value ?"present".tr:"absent".tr,style: TextStyle(color: Colors.white),)),
              )),
            ],
          ),
        ),
      );
    });
  }
}
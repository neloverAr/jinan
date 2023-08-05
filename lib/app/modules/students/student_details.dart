
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/icons.dart';
import 'package:school/app/data/models/student.dart';
import 'package:school/app/widgets/avatar.dart';
import 'package:school/app/widgets/custom_divider.dart';
import '../../core/constants/border_radius.dart';
import '../../core/constants/height.dart';
import '../../core/constants/padding.dart';
import '../../core/values/colors.dart';
import '../../widgets/top_widget.dart';
import '../../widgets/top_widget_title.dart';
import 'controller.dart';
import 'widgets/detail_line.dart';

class StudentDetailsScreen extends StatelessWidget {
  final Student std;
  StudentDetailsScreen({Key? key,required this.std}) : super(key: key);
  StudentsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SizedBox(
       height: Get.height,
       child: Stack(
         children: [
           TopWidget(
               type: "fixed",
               containedWidget:
               TopWidgetTitle(type: "withBackArrow", text: "studentDetails".tr,)),
           Positioned(
               top: upperWidgetHeight - upperWidgetRadius-20,
               left: 0,
               right: 0,
               child: Padding(
                 padding:EdgeInsets.all(mainPadding),
                 child: Container(
                   width: double.infinity,
                   height: Get.height,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(cardsRadius),
                       boxShadow: [
                         BoxShadow(
                             color: Colors.grey.withOpacity(.2),
                             spreadRadius: 6,
                             blurRadius: 7,
                             offset: const Offset(0,7.5)
                         )
                       ]
                   ),
                   child: Column(
                     children: [
                       SizedBox(height: 2.0.hp,),
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal:mainPadding),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Avatar(image: std.profileImage!)
                               //StudentAvatar(avatar: std.avatar,radius: 50.0,),
                             ),
                             ElevatedButton(
                               onPressed: () {
                                 if(std.email!=null){
                                   controller.sendEmail(std.email!);
                                 }else{
                                   Get.defaultDialog(title: "",middleText:"No Entered Email");
                                 }
                               },
                               style: OutlinedButton.styleFrom(
                                 backgroundColor: red,
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(10)),
                               ),
                               child: Row(
                                 mainAxisSize: MainAxisSize.min,
                                 children: [
                                   Text("contactNow".tr), // <-- Text
                                   const SizedBox(
                                     width: 5,
                                   ),
                                   SvgPicture.asset(contactIcon)
                                 ],
                               ),
                             ),
                           ],
                         ),
                       ),
                       DetailLine(icon: studentDetailsName,fieldName: "name".tr,fieldValue: std.fullName!,),
                       const CustomDivider(),
                       DetailLine(icon: studentDetailsLevel,fieldName: "level".tr,fieldValue: std.levelData!,),
                       const CustomDivider(),
                       DetailLine(icon: studentDetailsAge,fieldName: "age".tr,fieldValue: "${std.age!} ${"years".tr}",),
                       const CustomDivider(),
                       DetailLine(icon: studentDetailsSex,fieldName: "gender".tr,fieldValue: std.gender!,),
                       const CustomDivider(),
                       DetailLine(icon: studentDetailsPoints,fieldName: "noOfPoints".tr,fieldValue: "${std.totalPoint!} ${"points".tr}",),
                     ],
                   ),
                 ),
               ))
         ],
       ),
     ),
    );
  }
}

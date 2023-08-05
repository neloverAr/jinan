//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:school/app/core/constants/padding.dart';
// import 'package:school/app/core/utils/extensions.dart';
// import 'package:school/app/core/values/constants.dart';
// import 'package:school/app/core/values/icons.dart';
// import 'package:school/app/modules/Auth/login/view.dart';
// import 'package:school/app/modules/type/controller.dart';
// import 'package:school/app/widgets/type_card.dart';
//
// class TypeScreen extends StatelessWidget {
//    TypeScreen({Key? key}) : super(key: key);
//   final typeController = Get.put(TypeController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: mainPadding),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("typeSelection".tr,style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 13.0.sp,
//                     color: const Color(0xFF292D32).withOpacity(.7),
//                   ),),
//                   SizedBox(height: 5.0.hp),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: GetX<TypeController>(builder: (typeController){
//                           return TypeCard(
//                               onTap: (){
//                                 typeController.changeSelected(Role.teacher.index);
//                               },
//                               onDoubleTap: (){
//                                 typeController.changeSelected(Role.teacher.index);
//                                 typeController.changeType(Role.teacher.index);
//                                 Get.to(()=>LoginScreen());
//                               },
//                               cardName: Role.teacher.name.tr,
//                               cardIcon: teacherIcon,
//                               isSelected: typeController.selected.value==Role.teacher.index?true:false);
//                         }),
//                       ), SizedBox(width: 1.5.wp,),
//                       Expanded(
//                         flex: 1,
//                         child: GetX<TypeController>(builder: (typeController){
//                           return TypeCard(
//                               onTap: (){
//                                 typeController.changeSelected(Role.student.index);},
//                               onDoubleTap: (){
//                               typeController.changeSelected(Role.student.index);
//                               typeController.changeType(Role.student.index);
//                               Get.to(()=>LoginScreen());
//                               },
//                               cardName:Role.student.name.tr,
//                               cardIcon: studentIcon,
//                               isSelected: (typeController.selected.value)==(Role.student.index)?true:false);
//                         }),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//               top: Get.height - 140,
//               child: Image.asset("assets/images/img.png",height: 180,width: 480,))
//         ],
//       ),
//     );
//   }
// }

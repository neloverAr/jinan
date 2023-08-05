
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/modules/chat/view.dart';
import 'package:school/app/modules/home/student/honor/view.dart';
import 'package:school/app/modules/home/widgets/handling_data_view_home.dart';
import 'package:school/app/modules/home/widgets/section-teacher.dart';
import 'package:school/app/modules/settings/teacher/view.dart';
import 'package:school/app/modules/students/view.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/icons.dart';
import '../../../data/models/bottomNavigationItem.dart';
import '../widgets/home_upper_widget.dart';
import 'controller.dart';
import 'widgets/floating_icon.dart';

class TeacherHomeScreen extends StatelessWidget {
   TeacherHomeScreen({Key? key}) : super(key: key);

   final List<BottomNavigationItem> bottomNavigationItems = <BottomNavigationItem>[
     BottomNavigationItem(name: "main", icon: homeIcon, selectedIcon: homeFilled),
     BottomNavigationItem(name: "chat", icon: chatIcon, selectedIcon: chatFilled),
     BottomNavigationItem(name: "", icon: chatIcon, selectedIcon: chatFilled),
     BottomNavigationItem(name: "myStudents", icon: studentsIcon, selectedIcon: studentsFilled),
     BottomNavigationItem(name: "profile", icon: profileIcon, selectedIcon: profileFilled),
   ];
   final double buttonSize = 80;
   final double addButtonHeight = 56.0;
   final double floatingButtonHeight = 76;
   final double floatingButtonWidth = 135;
   final bottomItems =["main","chat","myStudents","profile"];

   HomeTeacherController controller = Get.put(HomeTeacherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GetX<HomeTeacherController>(
          builder: (homeTeacherController){
            return IndexedStack(
              index: homeTeacherController.tabIndex.value,
              children: [
                CustomScrollView(
                slivers: [
                  HomeUpperWidget(text: "${"greeting".tr} ${homeTeacherController.fName} 👋", maxHeight: 160.0),
                  SliverToBoxAdapter(
                    child:HandlingDataViewHome(statusRequest: controller.statusRequest.value, widget:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.0.hp,),
                        SectionTeacher(name: "honorBoard".tr, list: homeTeacherController.honorBoard,
                          height: 163.0, label: 'teacherHonorBoard',seeAllOnTap: (){
                          Get.to(HonorScreen());
                          },),
                        SizedBox(height: 3.0.hp,),
                        SectionTeacher(name: "subjects".tr, list:homeTeacherController.subjects,height:160.0,seeAllOnTap: (){
                          Get.toNamed("/teacher-subjects-screen",arguments: {
                            "nextPage":""
                          });
                        }, label: 'teacherSubjects',),
                      ],
                    ),)
                  ),
],                ),
                ChatScreen(),
                TeacherStudentsList(),
                TeacherStudentsList(),
                TeacherProfileScreen(),
              ],
            );
          }
      ) ,
      floatingActionButton: Flow(
        delegate: MyFlowDelegate(
            floatingButtonWidth: floatingButtonWidth,controller: controller.animationController,buttonSize: buttonSize,),
        children: [
          FloatingIcons(text: "dailyAssessment".tr, icon: addHomeworkIcon, onPressed: () {
            controller.startAnimation();Get.toNamed("/teacher-subjects-screen",
              arguments: {"nextPage":"assess"});}, size: buttonSize,),
          FloatingIcons(text: "addAttendance".tr, icon: addSubjectsIcon, onPressed: () {
            controller.startAnimation();
            Get.toNamed("/teacher-semesters-screen",arguments: {
              "nextPage":"/add-attendances-screen"
            });
            }, size: buttonSize,),
          FloatingIcons(text: "addPoints".tr, icon: addPointsIcon, onPressed: () {
            controller.startAnimation();
          Get.toNamed("/teacher-semesters-screen",arguments: {
            "nextPage":"/add-points-screen"
          });
            }, size: buttonSize,
          ),
          Stack(
            fit: StackFit.loose,
            children: [
              SvgPicture.asset(ellipseIcon,height: 75.11,width: 134.35,),
              Positioned(
                top:0,
                right: 134.35/2 - addButtonHeight/2,
                child: GetX<HomeTeacherController>(
                  builder:(controller){
                    return FloatingActionButton(
                      backgroundColor: red,
                      onPressed: (){
                        controller.startAnimation();
                      },
                      child: Icon(controller.expanded.value?Icons.clear:Icons.add,color: Colors.white,), //icon inside button
                    );
                  }
                )
              ),
            ],
          ),
        ],
      ),
      resizeToAvoidBottomInset:false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:GetX<HomeTeacherController>(
          builder: (controller){
            return  BottomNavigationBar(
              backgroundColor: red,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,
                color: Colors.white,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 11,
                color: Colors.white,
              ),
              onTap:(int index) {
                if(index!=2){
                  controller.changeTabIndex(index);
                }if(index==2){
                  return;
                }
              },
              currentIndex: controller.tabIndex.value,
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: [
                ...bottomNavigationItems.map((e) =>
                    BottomNavigationBarItem(
                  label: e.name.tr,
                  icon: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: SvgPicture.asset(
                      e.icon,
                      color: Colors.white,
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: SvgPicture.asset(
                        e.selectedIcon,
                    ),
                  ),
                ),).toList(),
              ],


            );
          }),
    );
  }
}

class MyFlowDelegate extends FlowDelegate{
  final floatingButtonWidth;
  final buttonSize;
  final Animation<double> controller;
  const MyFlowDelegate({this.floatingButtonWidth,required this.controller,required this.buttonSize,}) : super(repaint: controller);


  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context. size;
    final xStart = Get.width/2 - floatingButtonWidth/2;
    final yStart = size.height - 93.2;
    for(int i=0;i<context.childCount;i++){
      final isLastItem = i==context.childCount -1;
      setValue(value) => isLastItem?0.0:value;

        final theta = i*(pi/context.childCount);
        final radius = 120.0*controller.value;
        final x = xStart - setValue(radius*cos(theta+pi/4))+ setValue(56/2);
        final y = yStart - setValue(radius*sin(theta+pi/4));
        context.paintChild(i,
          transform: Matrix4.identity()..translate(x, y, 0)
            ..translate(buttonSize/2,buttonSize/2)
          ..rotateZ(setValue(180 *(1-controller.value)*pi /180))
            ..scale(isLastItem?1.0:max(controller.value, .5))
            ..translate(-buttonSize/2,-buttonSize/2)
        );

    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return false;
  }
}


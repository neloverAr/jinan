import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/icons.dart';
import 'package:school/app/data/models/bottomNavigationItem.dart';
import 'package:school/app/modules/chat/view.dart';
import 'package:school/app/modules/subjects/student/view.dart';
import '../../../core/values/colors.dart';
import '../../settings/student/view.dart';
import '../../table/view.dart';
import 'activities/view.dart';
import '../widgets/chips_header.dart';
import '../widgets/home_upper_widget.dart';
import 'ads/view.dart';
import 'daily_coverage/view.dart';
import 'home_controller.dart';
import 'overview/view.dart';

class HomeScreen extends StatelessWidget{
  final List<String> chips = ["main","activities","announcements","dailyCoverage"];

 final List<BottomNavigationItem> bottomNavigationItems = <BottomNavigationItem>[
   BottomNavigationItem(name: "main", icon: homeIcon, selectedIcon: homeFilledRed),
   BottomNavigationItem(name: "chat", icon: chatIcon, selectedIcon: chatFilledRed),
   BottomNavigationItem(name: "studentSubjects", icon: studentSubjectsIcon, selectedIcon: studentSubjectsFilledRed),
   BottomNavigationItem(name: "schedule", icon: tableIcon, selectedIcon: tableFilledRed),
   BottomNavigationItem(name: "profile", icon: profileIcon, selectedIcon: profileFilledRed),
 ];

  HomeScreen({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());
  //HomeTeacherController homeTeacherController = Get.put(HomeTeacherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        displacement: 26.0.hp,
        color: red,
        onRefresh: (){
          return homeController.getData();
        },
        child: GetX<HomeController>(
          builder: (homeController){
            return IndexedStack(
            index: homeController.tabIndex.value,
            children: [
              CustomScrollView(
                slivers:[
                  HomeUpperWidget(text: "${"greeting".tr} ${homeController.fName} 👋",
                  maxHeight: 160.0,),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 4.0.hp,),
                  ),
                  SliverPersistentHeader(
                      pinned: true,
                      delegate: ChipsSliverPersistentHeader(chips:chips)
                  ),
                  SliverToBoxAdapter(
                    child: getChipWidget(homeController.chipIndex.value),
                  ),
                ]
              ),
              ChatScreen(),
              StudentSubjectsScreen(),
              TableScreen(),
              //const Text("data"),
              ProfileScreen(),
            ],
          );
          },
        ),
      ),
      /////////////////////////////////////////////
      bottomNavigationBar: GetX<HomeController>(
        builder: (homeController){
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.grey[300]!, spreadRadius: 0, blurRadius: 10),
              ],
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0)),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                  color: Color(0xFF2F2F2F),
                ),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                    fontSize: 11,
                  color: Color(0xFF2F2F2F),
                ),
                onTap:(int index)=> homeController.changeTabIndex(index),
                currentIndex: homeController.tabIndex.value,
                unselectedItemColor: Colors.black,
                selectedItemColor: red,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                items:  [
                  ...bottomNavigationItems.map((e) => BottomNavigationBarItem(
                      label: e.name.tr,
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          e.icon,
                          //color: bottomItemsIndex[e.key]==homeController.tabIndex.value?red:Colors.black,
                        ),
                      ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      e.selectedIcon,
                    ),
                  ),
                  ))
                      .toList(),
                ],

              ),
            ),
          );
        },
      ),
    );
  }

  Widget getChipWidget(int index){
    if(index==0){
      return OverviewScreen();
    }else if(index==1){
      return ActivitiesScreen();
    }
    else if(index==2){
      return AdsScreen();
    }
    else if(index==3){
      return DailyCoverageScreen();
    }
    return ActivitiesScreen();
  }
}









import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/modules/home/widgets/handling_data_view_home.dart';
import 'package:school/app/modules/subjects/student/view.dart';
import 'package:school/app/modules/weekly_plan/view.dart';
import '../../../../core/constants/border_radius.dart';
import '../../../../core/values/icons.dart';
import '../../../../functions/checkLanguage.dart';
import '../../widgets/section.dart';
import '../home_controller.dart';

class OverviewScreen extends StatelessWidget {
  OverviewScreen({Key? key}) : super(key: key);
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 3.0.hp,),
        GetX<HomeController>(builder: (controller) {
          return HandlingDataViewHome(
            statusRequest: controller.statusRequest.value,
            widget: Column(
              children: [
                Section(name: "subjects".tr,label: "subjects",
                  list: homeController.subjects,
                  height: 160.0,seeAllOnTap: (){
                  Get.to(()=>StudentSubjectsScreen());
                  },),
                SizedBox(height: 3.0.hp,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: mainPadding),
                  child: InkWell(
                    onTap: (){
                      Get.to(()=>WeeklyPlanScreen());
                    },
                    child: Row(
                      children: [
                        Expanded(flex:6,child: Container(
                          height: 50,
                          alignment: isArLang()?Alignment.centerRight:Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 40,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],borderRadius: BorderRadius.only(
                            topLeft: isArLang()?Radius.circular(0):Radius.circular(buttonRadius),
                            bottomLeft: isArLang()?Radius.circular(0):Radius.circular(buttonRadius),
                            topRight: isArLang()?Radius.circular(buttonRadius):Radius.circular(0),
                            bottomRight: isArLang()?Radius.circular(buttonRadius):Radius.circular(0),
                          ),
                          ),child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14.0,
                                ),
                            child: Text("seeWeeklyPlan".tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),),
                          ),
                        )),
                        Expanded(flex:1,child:
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: red,
                            borderRadius:  BorderRadius.only(
                              topLeft: isArLang()?Radius.circular(buttonRadius):Radius.circular(0),
                              bottomLeft: isArLang()?Radius.circular(buttonRadius):Radius.circular(0),
                              topRight: isArLang()?Radius.circular(0):Radius.circular(buttonRadius),
                              bottomRight: isArLang()?Radius.circular(0):Radius.circular(buttonRadius),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 40,
                                offset: Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),child:isArLang()
                            ? const Icon(Icons.arrow_forward,color: Colors.white,)
                            :Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                backIcon,color: Colors.white,),
                            )
                        )),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 3.0.hp,),
                Section(name: "lastHomework".tr,label: "lastHomework",
                  list: homeController.homeworks,
                  height: 130.0,),
                SizedBox(height: 3.0.hp,),
                Section(name: "announcements".tr,label:"announcements" ,
                  list: homeController.ads,
                  height: 170.0,),
                SizedBox(height: 3.0.hp,),
              ],
            ),
          );
         },
        ),

      ],
    );
  }
}
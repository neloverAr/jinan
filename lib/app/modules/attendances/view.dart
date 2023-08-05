
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/modules/attendances/widgets/attendance_box.dart';
import 'package:school/app/modules/attendances/widgets/attendence_number_box.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import '../../widgets/top_widget.dart';
import 'controller.dart';

class AttendancesScreen extends StatelessWidget {
  AttendancesScreen({Key? key}) : super(key: key);
  AttendancesController chatController = Get.put(AttendancesController());
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetX<AttendancesController>(
          builder: (controller){
            return CustomScrollView(
              controller: scrollController,
              slivers: [
                TopWidget(
                    type: "sliver",
                    containedWidget:
                    TopWidgetTitle(type: "withBackArrow",
                      text: 'attendanceList'.tr,)),
                SliverToBoxAdapter(
                    child:HandlingDataView(statusRequest: controller.statusRequest.value,
                      widget:  Column(
                        children: [
                          ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount:controller.data.length,
                              controller: scrollController,
                              itemBuilder: (BuildContext context,int index){
                                return Padding(
                                  padding:  EdgeInsets.symmetric(
                                      horizontal:mainPadding-10,
                                      vertical: 5
                                  ),
                                 child: AttendanceBox(absent: controller.data[index].attendance=="absent"?true:false
                                     , day: controller.data[index].attendanceData!.day!, date: controller.data[index].attendanceData!.date!)
                                );
                              }
                          ),const SizedBox(height: 15,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: mainPadding-10),
                            child: Row(
                              children: [
                                Expanded(flex:1,child: AttendanceNumBox(text: "daysOfAttendance".tr, count: controller.data.isEmpty?0:controller.data[0].attendanceCount!, color: Colors.black)),
                                const SizedBox(width: 10,),
                                Expanded(flex:1,child: AttendanceNumBox(text: "dayOfAbsence".tr, count: controller.data.isEmpty?0:controller.data[0].absentCount!, color: Colors.black)),
                              ],
                            ),
                          )
                        ],
                      ),)
                ),
              ],
            );
          },
        )
    );
  }
}
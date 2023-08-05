
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school/app/core/constants/border_radius.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/modules/add_attendence/widgets/addAttendanceBox.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import '../../core/values/colors.dart';
import '../../widgets/top_widget.dart';
import 'controller.dart';

class AddAttendancesScreen extends StatelessWidget {
  AddAttendancesScreen({Key? key}) : super(key: key);
  AddAttendancesController chatController = Get.put(AddAttendancesController());
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetX<AddAttendancesController>(
          builder: (controller){
            return Stack(
              children: [
                CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    TopWidget(
                        type: "sliver",
                        containedWidget:
                        TopWidgetTitle(type: "withBackArrow", text: "addAttendance".tr,)),
                    SliverToBoxAdapter(
                        child: HandlingDataView(
                            statusRequest: controller.statusRequest.value,
                            widget:Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                                  child: Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardsRadius)),
                                    child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(DateFormat("yyyy-MM-dd").format(DateTime.now())),
                                        Container(width:5,height: 40,child: VerticalDivider(color: Color(0xEE1A1B23).withOpacity(.2),thickness: 1.0,)),
                                        ////Color(0xEE1A1B23).withOpacity(.2)
                                        Text(DateFormat("EEEE").format(DateTime.now()).toLowerCase().tr),
                                      ],
                                    ),
                                  ),),
                                ),
                                ListView.builder(
                                    controller: scrollController,
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: controller.semesterStudents.length,
                                itemBuilder: (context, index){
                                  return Padding(
                                    padding:  EdgeInsets.symmetric(
                                        horizontal:mainPadding-10,
                                        vertical: 10
                                    ),
                                    child: AddAttendanceBox(std: controller.semesterStudents[index],
                                      index: index,onTap: (){
                                    },),
                                  );
                                }
                               ),SizedBox(height: 1.0.hp,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                                  child: SafeArea(
                                    child: ElevatedButton(
                                      onPressed: () async{
                                        await controller.postAttendances();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:red ,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(7.0)),
                                        minimumSize: const Size(double.infinity, 52), //////// HERE
                                      ),
                                      child: Text("save".tr),
                                    ),
                                  ),
                                )
                              ],
                            )
                        )
                    ),
                    //SliverList(delegate: ,)
                  ],
                ),

              ],
            );
          },
        )
    );
  }
}

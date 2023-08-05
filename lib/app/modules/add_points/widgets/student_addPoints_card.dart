
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/border_radius.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/data/models/student.dart';
import 'package:school/app/modules/add_points/controller.dart';
import 'package:school/app/widgets/avatar.dart';
import 'package:school/app/widgets/handling_data_view.dart';

class StudentAddPointsCard extends StatelessWidget {
  final Student std;
  StudentAddPointsCard({Key? key,required this.std}) : super(key: key);
  AddPointsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(cardsRadius),
        borderSide: BorderSide.none,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Avatar(image: std.profileImage!),
          //StudentAvatar(avatar: std.avatar!,radius: 50.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(std.fullName!,maxLines: 1,
              overflow: TextOverflow.ellipsis,),
          ),
          ElevatedButton.icon(
          onPressed:(){
            controller.getReasonsForEvaluation();
          showDialog(context: context, builder: (BuildContext context){
            return GetX<AddPointsController>(
                builder: (controller){
                  return AlertDialog(
                    content: HandlingDataView(
                    statusRequest: controller.statusRequest2.value,
                    widget: Column(
                        mainAxisSize : MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 1.0.hp,),
                          ...controller.reasonsForEvaluation.map((e) => PointWidget(
                            selected: controller.reasonID.value==e.id?true:false,
                            onTap: () {
                              controller.changeNo(e.id!);
                            },
                            name: e.title!,))
                              .toList(),
                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: (){
                          controller.addPoints("${controller.reasonID.value}","${std.id}");
                          //controller.updatePoints(controller.noOfPoints.value, std);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:purple ,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          minimumSize: Size(double.infinity,5.0.hp), //////// HERE
                        ), child: Text("save".tr),

                      ),
                    ],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(cardsRadius))),
                    contentPadding: EdgeInsets.all(0.0),
                  );
                }

            );
          });
          },
          icon: const Icon(Icons.add,color: Colors.white,),
          label: Text("addPoints".tr,
            style: const TextStyle(color: Colors.white),
          ),
          style:OutlinedButton.styleFrom(
            backgroundColor: purple,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
          ),
          )
        ],
      ),
    );
  }
}

class PointWidget extends StatelessWidget {
  final bool selected;
  final Function() onTap;
  final String name;
  const PointWidget({
    Key? key,
    required this.selected,
    required this.onTap,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        onTap();
      },
      child: Container(
        alignment: Alignment.centerRight,
        width: Get.width*.9,
        height: 50,
        decoration: BoxDecoration(
             border: Border(
                left: BorderSide(
                  color: selected?purple:Colors.white,
                  width: 4,
                ))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(name,style: TextStyle(color: selected?purple:Colors.black),),
        ),
      ),
    );
  }
}

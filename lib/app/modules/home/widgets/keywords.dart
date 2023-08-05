import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/colors.dart';
import '../student/home_controller.dart';

class KeywordsWidget extends StatelessWidget {
  HomeController homeController = Get.find<HomeController>();
  KeywordsWidget({
    required this.text,
    required this.index,
    Key? key,
  }) : super(key: key);
  final text ;
  final index;
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder:(homeController){
          return  Card(
            elevation: 0,
            color: index==homeController.chipIndex.value?red:Colors.transparent,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(26),
              borderSide: BorderSide(color:index==homeController.chipIndex.value?red: Color(0xFFEDECED))
            ),
            child: SizedBox(
              child: InkWell(
                borderRadius: BorderRadius.circular(26),
                onTap: (){
                  homeController.changeChipIndex(index);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0,vertical:4.0),
                  child: Center(
                    child: Text("$text".tr,style:
                    TextStyle(
                      color: index==homeController.chipIndex.value?Colors.white:Colors.black,
                    ),),
                  ),
                ),
              ),
            ),
          );
        }

    );
  }
}
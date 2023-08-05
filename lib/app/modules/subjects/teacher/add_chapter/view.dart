
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/abouts_us_text.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/modules/subjects/teacher/widgets/add_fields.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import '../../../../core/constants/border_radius.dart';
import '../../../../core/constants/height.dart';
import '../../../../core/constants/padding.dart';
import '../../../../core/values/icons.dart';
import '../../../Auth/widgets/bottom_widget.dart';
import 'controller.dart';

class AddChapterScreen extends StatelessWidget {
  AddChapterScreen({Key? key}) : super(key: key);
  AddChapterController controller = Get.put(AddChapterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetX<AddChapterController>(
          builder: (controller){
            return Stack(
              fit: StackFit.expand,
              children: [
                TopWidget(type: "fixed", containedWidget: TopWidgetTitle(
                  text: "addChapter".tr,type:"withBackArrow",
                ),
                ),
                Positioned(
                    top: upperWidgetHeight - upperWidgetRadius,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: mainPadding),
                      child: Form(
                        key:controller.chapterFormKey,
                        child: Container(
                          //width: double.infinity,
                          height: Get.height-upperWidgetHeight+upperWidgetRadius,
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
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal:19.0),
                                child: ListView(
                                  padding: EdgeInsets.symmetric(vertical: mainPadding+8),
                                  children: [
                                    AddFieldsWidget(hintText: 'chapterOne'.tr, labelText: 'chapterName'.tr,
                                        controller: controller.arNameController,maxLines: 1,validator: (String? value){
                                      if(value == null || value.isEmpty){
                                        return "This field is required";
                                      }
                                      return null;
                                    }
                                    ),
                                    SizedBox(height: 3.0.hp,),
                                    AddFieldsWidget(hintText: trialStr, labelText: 'chapterDetails'.tr,
                                      controller: controller.arDetailsController,maxLines:6,validator: (String? value){
                                          if(value == null || value.isEmpty){
                                            return "This field is required";
                                          }
                                          return null;
                                        }
                                    ),
                                    SizedBox(height: 3.0.hp,),
                                    Text("attachFile".tr,style: TextStyle(
                                        fontSize: 12.0.sp,
                                        color: Colors.black
                                    ),),
                                    const SizedBox(height: 17.0,),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFFBFBFB),
                                          border: Border.all(
                                            color: Color(0xEEEEEEEE),
                                          )
                                      ),
                                      child: Material(
                                        child: InkWell(
                                          onTap: (){
                                            controller.selectFile();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(controller.pickedFile.value!.name==""?"attachFile".tr:controller.pickedFile.value!.name,
                                                  style: TextStyle(color:const Color(0xEE333333).withOpacity(.5) ),),
                                                SvgPicture.asset(fileIcon)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),),
                                    ////////////////
                                    // Attach Video
                                    SizedBox(height: 3.0.hp,),
                                    AddFieldsWidget(hintText: 'attachVideo'.tr, labelText: 'attachVideo'.tr, controller: controller.videoController,maxLines: 1,),
                                    ////////////////
                                    // Attach Image
                                    SizedBox(height: 3.0.hp,),
                                    Text("attachImage".tr,style: TextStyle(
                                        fontSize: 12.0.sp,
                                        color: Colors.black
                                    ),),
                                    const SizedBox(height: 17.0,),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFFBFBFB),
                                          border: Border.all(
                                            color: Color(0xEEEEEEEE),
                                          )
                                      ),
                                      child: Material(
                                        child: InkWell(
                                          onTap: (){
                                            controller.selectImage();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(controller.pickedImage.value!.name==""?"attachImage".tr:controller.pickedImage.value!.name,
                                                  style: TextStyle(color:const Color(0xEE333333).withOpacity(.5) ),),
                                                SvgPicture.asset(galleryAddIcon)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),),
                                    //deliveryDateAssignment
                                    //SizedBox(height: 3.0.hp,),
                                    SizedBox(height: 3.0.hp,),
                                    SizedBox(height: 3.0.hp,),
                                    SizedBox(height: 3.0.hp,),
                                    SizedBox(height: 3.0.hp,),
                                  ],
                                ),
                              ),
                              Align(alignment: Alignment.bottomCenter,
                                child:
                                BottomWidget(text: "add".tr,onPressed: (){
                                  controller.addChapter();
                                  Get.back();
                                },),)
                            ],
                          ),
                        ),
                      ),
                    )
                ),

              ],
            );
          },
        )
    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/abouts_us_text.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import '../../../../core/constants/border_radius.dart';
import '../../../../core/constants/height.dart';
import '../../../../core/values/colors.dart';
import '../../../../widgets/top_widget.dart';
import '../../../../widgets/top_widget_title.dart';
import 'controller.dart';

class AddCommentScreen extends StatelessWidget {
  AddCommentController controller = Get.put(AddCommentController());
  AddCommentScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          TopWidget(
              type: "fixed",
              containedWidget:
              TopWidgetTitle(type: "withBackArrow", text: "parentComment".tr,)),
          Positioned(
              top: upperWidgetHeight - upperWidgetRadius +10,
              left: mainPadding,
              right: mainPadding,
              child: GetX<AddCommentController>(
                  builder:(controller){
                    return Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardsRadius)),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: mainPadding),
                          child: HandlingDataView(statusRequest: controller.statusRequest.value, widget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("note".tr,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.0.sp)),
                              SizedBox(height: 2.0.hp,),
                              TextFormField(
                                controller: controller.note,
                                maxLines: 10,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: trialStr,
                                    hintStyle: TextStyle(color:grey),
                                    fillColor: const Color(0xFFFBFBFB),
                                    filled: true,
                                    border:  OutlineInputBorder(
                                      borderRadius:  BorderRadius.circular(textFieldRadius),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xEEEEEEEE),
                                      ),
                                    )
                                ),

                              ),SizedBox(height: 2.0.hp,),
                            ],
                          ),)
                        )
                    );
                  }
              )
          ),SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: mainPadding,right: mainPadding),
              child: Align(alignment: Alignment.bottomCenter,child: ElevatedButton(
                onPressed: (){
                  controller.postData();
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:red ,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0)),
                  minimumSize: Size(double.infinity, 52), //////// HERE
                ),
                child: Text("submit".tr),
              ),),
            ),
          )
        ],
      ),
    );
  }
}
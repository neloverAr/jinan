import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/functions/checkLanguage.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import '../../../core/constants/border_radius.dart';
import '../../../core/constants/height.dart';
import '../../../core/values/icons.dart';
import '../../Auth/widgets/auth_button.dart';
import '../widgits/information_widget.dart';
import 'controller.dart';

class SendNewMessageScreen extends StatelessWidget {
  SendNewMessageScreen({Key? key}) : super(key: key);
  SendNewMessageController controller = Get.put(SendNewMessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetX<SendNewMessageController>(
          builder: (controller){
            return Stack(
              fit: StackFit.expand,
              children: [
                TopWidget(type: "fixed", containedWidget: TopWidgetTitle(
                  text: "startNewConversation".tr,type:"withBackArrow",
                ),
                ),
                Positioned(
                  top: upperWidgetHeight - upperWidgetRadius,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: mainPadding),
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(cardsRadius)
                          ),
                          child: DropdownButtonFormField<String>(
                            //value: controller.receiverName,
                            isExpanded: true,
                            itemHeight:48,
                            decoration:  InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(cardsRadius),
                                borderSide: const BorderSide(
                                  color: Color(0xEEEEEEEE),
                                ),),
                              border: OutlineInputBorder(),
                            ),
                            elevation: 0,
                            borderRadius: BorderRadius.circular(textFieldRadius),
                            icon: SvgPicture.asset(arrowIcon),
                            items: controller.items.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            hint: Text("selectReceiverName".tr,style: TextStyle(color:
                            Color(0xFF292D32).withOpacity(.4))),
                            onChanged: (String? value){
                              controller.changeReceiverName(value);
                            },
                          ),
                        ),SizedBox(height: 1.0.hp,),
                        Card(
                          elevation:3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(cardsRadius),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 24.0),
                            child: Row(
                              //mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:70.0.wp,
                                  child: Text("${"senderName".tr} ${storageService.read("fullName")}",
                                    maxLines: 1,overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Color(0xFF292D32).withOpacity(.4),
                                        fontSize: 17
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 1.0.hp,),
                        Card(
                          elevation:3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(cardsRadius),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 24.0),
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text("${"attachFile".tr} :",
                                      style: const TextStyle(
                                          fontSize: 17
                                      ),
                                    ),
                                    Text(controller.pickedFile.value!.name==""?""
                                        :controller.pickedFile.value!.name)
                                  ],
                                ),
                                InkWell(onTap:(){
                                  controller.selectFile();
                                },
                                    child: Icon(Icons.attach_file,color:red,))
                              ],
                            ),
                          ),
                        ),SizedBox(height: 1.0.hp,),
                        InformationWidget(controller: controller.message,maxLines: 7,
                        hintText: "typing".tr,
                        )
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: mainPadding),
                    child: Align(alignment: Alignment.bottomCenter,
                        child: AuthButton(text:  "send".tr,onPressed: (){
                          if(controller.pickedFile.value!.name==""){
                            controller.submit(controller.message.text,
                                controller.receiversID[controller.receiverName]!);
                          }else{
                            controller.submit(controller.message.text,
                                controller.receiversID[controller.receiverName]!,
                                File(controller.pickedFile.value!.path!));
                          }
                        },
                        )
                    ),
                  ),
                )
              ],
            );
          },
        )
    );
  }
}

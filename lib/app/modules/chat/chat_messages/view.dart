
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:school/app/core/constants/border_radius.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/functions/extention.dart';
import 'package:school/app/functions/get-date.dart';
import 'package:school/app/functions/urlLauncher.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import '../../../data/models/message.dart';
import 'package:intl/intl.dart';
import 'controller.dart';
import 'dart:io';

class ChatMessages extends StatelessWidget {
   ChatMessages({Key? key}) : super(key: key);
   ChatMessagesController chatMessagesController = Get.put(ChatMessagesController());

  @override
  Widget build(BuildContext context) {
    return GetX<ChatMessagesController>(builder: (controller){
      return Scaffold(
        appBar: AppBar(
          title: Text(chatMessagesController.data.receiverData!.fullName!),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: InkWell(
                  onTap: (){
                    controller.getData(controller.id);
                  },
                  child: Icon(Icons.refresh,color: Colors.white,)),
            )
          ],
          backgroundColor: red,
        ),
        body: HandlingDataView(
          statusRequest: controller.statusRequest.value,
          widget: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: GroupedListView<Message,DateTime>(
                useStickyGroupSeparators: true,
                floatingHeader: true,
                reverse: true,
                order: GroupedListOrder.DESC,
                //useStickyGroupSeparators: true,
                //floatingHeader: true,
                shrinkWrap: true,
                padding: EdgeInsets.all(mainPadding),
                elements: controller.data.messages!,
                groupBy: (Message message)=> DateTime(
                  getDate4(message.createdAt!).year,
                  getDate4(message.createdAt!).month,
                  getDate4(message.createdAt!).day,
                ),
                groupHeaderBuilder: (Message message)=>SizedBox(
                  height: 40,
                  child:
                  Center(
                    child: Card(
                        color: red,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            DateFormat.yMMMd().format(getDate4(message.createdAt!)),
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                    ),
                  ),
                ),
                itemBuilder: (context,Message message)=>
                    Align(
                      alignment: message.senderId == controller.data.senderId?
                      Alignment.centerRight:Alignment.centerLeft
                      // message.isSentBy
                      //     ?Alignment.centerRight
                      //     :Alignment.centerLeft
                      ,
                      child: SizedBox(
                        //width: 60.0.wp,
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardsRadius)),
                          elevation: 8,
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if(Uri.parse(message.file!).isAbsolute&&
                                 (getExt(message.file!)=="png"||getExt(message.file!)=="jpg"||getExt(message.file!)=="jpeg"||getExt(message.file!)=="webp"))
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          launchURL(message.file!);
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: CachedNetworkImage(imageUrl: message.file!,
                                            height: 150,width: 200,fit: BoxFit.fill,),
                                        ),
                                      ),const SizedBox(height: 10,),
                                    ],
                                  ),Text(message.message!),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              ),
            ),
            Container(
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: controller.messageText,
                  decoration: InputDecoration(
                    border:  InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                    hintText: "typing".tr,
                      prefixIcon:InkWell(
                          onTap: (){
                            controller.selectFile();
                          },
                          child: const Icon(Icons.attach_file,color: Colors.black,)) ,
                      suffixIcon: InkWell(
                          onTap: (){
                            if(controller.pickedFile.name==""){
                              controller.submit(controller.messageText.text,chatMessagesController.data.id!);
                            }else{
                              controller.submit(controller.messageText.text,chatMessagesController.data.id!,File(controller.pickedFile.path!));
                            }
                            controller.messageText.text = "";
                          },
                          child: Icon(Icons.send,color: red,))
                  ),
                  onSubmitted: (String? message){

                  },

                ),
              ),
            )
          ],
        ),)
      );
    });
  }
}



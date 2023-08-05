
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/modules/chat/widgits/single_chat_box.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import '../../widgets/top_widget.dart';
import 'controller.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({Key? key}) : super(key: key);
   ChatController chatController = Get.put(ChatController());
   final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetX<ChatController>(
        builder: (controller){
      return Scaffold(
           body: Stack(
           children: [
             CustomScrollView(
               controller: scrollController,
               slivers: [
                 TopWidget(
                     type: "sliver",
                     containedWidget:
                     TopWidgetTitle(type: "main", text: "chat".tr,)),
                 SliverToBoxAdapter(
                   child: HandlingDataView(
                     statusRequest: controller.statusRequest.value, widget:
                   ListView.builder(
                       controller: scrollController,
                       padding: EdgeInsets.zero,
                       shrinkWrap: true,
                       itemCount: controller.data.length,
                       itemBuilder: (context, index){
                       return Padding(
                       padding:  EdgeInsets.symmetric(
                       horizontal:mainPadding-10,
                       vertical: 5
                       ),
                       child: ChatBox(chat: controller.data[index],onTap: (){
                          Get.toNamed("/chat-messages-screen",arguments: {
                            "chatID":controller.data[index].id
                          });
                         //print("kkkk${controller.data[index].messages![controller.data[index].messages!.length-1].file}");
                       },),
                       );
                       }
                     )
                   )
                 ),
                 //SliverList(delegate: ,)
               ],
             ),

           ],
         ),floatingActionButton: FloatingActionButton(
        heroTag: 2,
         tooltip: "Start New Conversation",
          child: const Icon(Icons.edit_note),backgroundColor:red,
          onPressed: (){
          Get.toNamed("/send-new-message-screen",arguments: {
          //"chatID":controller.data[index].id
          });
          })
      );
       },
     );
  }
}

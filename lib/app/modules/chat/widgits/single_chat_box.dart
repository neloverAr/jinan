
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/border_radius.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/data/models/Chat.dart';
import 'package:school/app/widgets/avatar.dart';
import '../../../data/models/message.dart';
import '../../../data/services/storage/services.dart';

class ChatBox extends StatelessWidget {
  final Chat chat;
  final Function() onTap;
  ChatBox({Key? key,required this.chat,required this.onTap}) : super(key: key);
  StorageService storageService = Get.find();

  @override
  Widget build(BuildContext context) {
    //var radius = 35.0;
    return Card(
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(cardsRadius),
     ),
      child: InkWell(
        borderRadius: BorderRadius.circular(cardsRadius),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 4),
                child: Avatar(image: chat.receiverData!.profileImage!),
              )
              // CircleAvatar(
              //   radius: 40.0,
              //   backgroundColor: Colors.white,
              //   child: CircleAvatar(
              //     radius: 38.0,
              //     backgroundImage: AssetImage(chat.avatarUrl!),
              //     backgroundColor: Color(0xFFD8D8D8),
              //     child: Align(
              //       alignment: storageService.read(langKey)=="ar"?Alignment.bottomLeft:Alignment.bottomRight,
              //       child: CircleAvatar(
              //         backgroundColor: Colors.white,
              //         radius: 10.0,
              //         child: CircleAvatar(
              //           backgroundColor:chat.status?Color(0xFF80EA4E):Color(0xFFD8D8D8),
              //           radius:7.0,),
              //       ),
              //     ),
              //   ),
              // ),
            ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width:40.0.wp,
                          child: Text(chat.receiverData!.fullName!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                            color: red,
                            fontWeight: FontWeight.w700,
                          ),),
                        ),
                        Text(chat.messages![chat.messages!.length-1].createdTime!,style: TextStyle(
                          color:chat.messages![chat.messages!.length-1].read==0?Color(0xFF292D32).withOpacity(.5)//
                             : Colors.black,
                        ),),
                      ],
                    ),SizedBox(height: 1.0.hp,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex:4,
                          child: Text(chat.messages![chat.messages!.length-1].message!,maxLines:1,overflow:TextOverflow.ellipsis,style: TextStyle(
                              color:chat.messages![chat.messages!.length-1].read==0?Color(0xFF292D32).withOpacity(.5):Colors.black,
                          ),
                          ),
                        ),
                        if(calculateNumberOfUnRead(chat.messages!)!=0)
                        Card(
                           color: red,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
                            child: Center(
                              child: Text("${calculateNumberOfUnRead(chat.messages!)}",style: const TextStyle(
                                color: Colors.white,
                              ),),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  int calculateNumberOfUnRead(List<Message> list){
    //int length = list.length;
    int count = 0;
    list.forEach((message) {if(message.read==0){
      ++count;
    }});
    return count;
  }
}

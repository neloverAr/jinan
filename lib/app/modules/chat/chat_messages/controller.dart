
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:school/app/data/models/message.dart';
import 'package:school/app/data/models/receiverData.dart';
import 'package:school/app/data/models/senderData.dart';
import 'package:school/app/data/providers/sendMessage.dart';
import 'package:school/app/data/providers/showChatData.dart';
import 'dart:io';
import '../../../core/class/crud.dart';
import '../../../core/class/status_request.dart';
import '../../../data/models/Chat.dart';
import '../../../data/services/storage/services.dart';
import '../../../functions/handling_data.dart';
import '../controller.dart';


class ChatMessagesController extends GetxController {
  late TextEditingController messageText;
  ShowChatData showChatData = ShowChatData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  Rx<StatusRequest> statusRequest2 = StatusRequest.success.obs;
  late Chat data = Chat(senderData: SenderData(id: 0,fullName: ""),messages: [
    Message(createdAt: ""),
  ],receiverData: ReceiverData(fullName: ""));
  StorageService storageService = Get.find();
  SendMessageData sendMessageData = SendMessageData(Crud());
  PlatformFile pickedFile = PlatformFile(name: "",size: 0);
  ChatController chatController = Get.find();
  late int id;
  final count = 0.obs;

  getData(int id) async{
    statusRequest.value = StatusRequest.loading;
    var response = await showChatData.getData(storageService.read("token"),id);
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        //var chatList = response['data']['chats'] as List;
        data = Chat.fromJson(response['data']['chat']);
        chatController.getData();
      }else{
        //Get.defaultDialog(title: "⚠",middleText:"Not Parent User");
        statusRequest.value = StatusRequest.failure;
      }
    }
  }

  Future selectFile() async{
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if(result==null) return;
    pickedFile = result.files.first;
  }


  @override
  void onInit() {
    id = Get.arguments["chatID"];
    getData(id);
    messageText = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void submit(String message,int receiverID,[File? file]) async{
    statusRequest2.value = StatusRequest.loading;
    var response = await sendMessageData.postData(storageService.read("token"),receiverID,
    {
      "message":message,
    },file
    );
    statusRequest2.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest2.value){
      if(response['status']==true){
        //var chatList = response['data']['chats'] as List;
        getData(id);
        chatController.getData();
        //Get.defaultDialog(title: "",middleText:"Sent");
      }else{
        //Get.defaultDialog(title: "⚠",middleText:"Not Parent User");
        statusRequest2.value = StatusRequest.failure;
      }
    }
  }

}

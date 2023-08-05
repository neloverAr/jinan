import 'package:school/app/data/models/receiverData.dart';
import 'package:school/app/data/models/senderData.dart';
import 'message.dart';

class Chat {
  int? id;
  int? senderId;
  int? receiverId;
  String? createdAt;
  SenderData? senderData;
  ReceiverData? receiverData;
  List<Message>? messages;

  Chat(
      { this.id,
        this.senderId,
        this.receiverId,
        this.createdAt,
        this.senderData,
        this.receiverData,
        this.messages});

  Chat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    createdAt = json['created_at'];
    senderData = json['sender_data'] != null
        ? SenderData.fromJson(json['sender_data'])
        : null;
    receiverData = json['receiver_data'] != null
        ? ReceiverData.fromJson(json['receiver_data'])
        : null;
    if (json['messages'] != null) {
      messages = <Message>[];
      json['messages'].forEach((v) {
        messages!.add( Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sender_id'] = this.senderId;
    data['receiver_id'] = this.receiverId;
    data['created_at'] = this.createdAt;
    if (this.senderData != null) {
      data['sender_data'] = this.senderData!.toJson();
    }
    if (this.receiverData != null) {
      data['receiver_data'] = this.receiverData!.toJson();
    }
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

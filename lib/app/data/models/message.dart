class Message {
  int? id;
  int? chatId;
  int? senderId;
  int? receiverId;
  String? message;
  String? file;
  int? read;
  String? createdAt;
  String? readName;
  String? createdTime;

  Message(
      {this.id,
        this.chatId,
        this.senderId,
        this.receiverId,
        this.message,
        this.file,
        this.read,
        this.createdAt,
        this.readName,
        this.createdTime});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chatId = json['chat_id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    message = json['message'];
    file = json['file'];
    read = json['read'];
    createdAt = json['created_at'];
    readName = json['read_name'];
    createdTime = json['created_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chat_id'] = this.chatId;
    data['sender_id'] = this.senderId;
    data['receiver_id'] = this.receiverId;
    data['message'] = this.message;
    data['file'] = this.file;
    data['read'] = this.read;
    data['created_at'] = this.createdAt;
    data['read_name'] = this.readName;
    data['created_time'] = this.createdTime;
    return data;
  }
}
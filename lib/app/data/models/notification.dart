class NotificationModel {
  int? id;
  String? title;
  String? message;
  String? createdAt;
  String? read;

  NotificationModel({this.id, this.title, this.message, this.createdAt, this.read});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    createdAt = json['created_at'];
    read = json['read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['message'] = this.message;
    data['created_at'] = this.createdAt;
    data['read'] = this.read;
    return data;
  }
}
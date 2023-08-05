class User {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? profileImage;
  String? statusName;
  String? type;
  int? mobile;
  String? fcmToken;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.fullName,
        this.email,
        this.profileImage,
        this.statusName,
        this.type,
        this.mobile,
        this.fcmToken});

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    email = json['email'];
    profileImage = json['profile_image'];
    statusName = json['status_name'];
    type = json['type'];
    mobile = json['mobile'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['profile_image'] = this.profileImage;
    data['status_name'] = this.statusName;
    data['type'] = this.type;
    data['mobile'] = this.mobile;
    data['fcm_token'] = this.fcmToken;
    return data;
  }
}
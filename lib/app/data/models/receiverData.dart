class ReceiverData {
  int? id;
  String? fullName;
  String? email;
  String? mobile;
  String? profileImage;

  ReceiverData(
      {this.id, this.fullName, this.email, this.mobile, this.profileImage});

  ReceiverData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    mobile = json['mobile'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
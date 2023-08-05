class TeacherParents {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? idCart;
  String? profileImage;
  String? mobile;

  TeacherParents(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.idCart,
        this.profileImage,
        this.mobile});

  TeacherParents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    idCart = json['id_cart'];
    profileImage = json['profile_image'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['id_cart'] = this.idCart;
    data['profile_image'] = this.profileImage;
    data['mobile'] = this.mobile;
    return data;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['first_name'] = this.firstName;
  //   data['last_name'] = this.lastName;
  //   data['full_name'] = this.fullName;
  //   data['birth_day'] = this.birthDay;
  //   data['age'] = this.age;
  //   data['id_cart'] = this.idCart;
  //   data['profile_image'] = this.profileImage;
  //   data['parent_id'] = this.parentId;
  //   data['level_id'] = this.levelId;
  //   data['semester_id'] = this.semesterId;
  //   data['email'] = this.email;
  //   data['gender'] = this.gender;
  //   data['semester_data'] = this.semesterData;
  //   data['level_data'] = this.levelData;
  //   return data;
  // }
}
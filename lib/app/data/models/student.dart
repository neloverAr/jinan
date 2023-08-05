class Student {
  int? id;
  String? firstName;
  String? fatherName;
  String? grandfatherName;
  String? lastName;
  String? fullName;
  String? birthDay;
  int? age;
  String? idCart;
  String? profileImage;
  int? levelId;
  int? semesterId;
  String? email;
  String? gender;
  String? semesterData;
  String? levelData;
  int? totalPoint;

  Student(
      {this.id,
        this.firstName,
        this.fatherName,
        this.grandfatherName,
        this.lastName,
        this.fullName,
        this.birthDay,
        this.age,
        this.idCart,
        this.profileImage,
        this.levelId,
        this.semesterId,
        this.email,
        this.gender,
        this.semesterData,
        this.levelData,
        this.totalPoint});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    fatherName = json['father_name'];
    grandfatherName = json['grandfather_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    birthDay = json['birth_day'];
    age = json['age'];
    idCart = json['id_cart'];
    profileImage = json['profile_image'];
    levelId = json['level_id'];
    semesterId = json['semester_id'];
    email = json['email'];
    gender = json['gender'];
    semesterData = json['semester_data'];
    levelData = json['level_data'];
    totalPoint = json['total_point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['father_name'] = this.fatherName;
    data['grandfather_name'] = this.grandfatherName;
    data['last_name'] = this.lastName;
    data['full_name'] = this.fullName;
    data['birth_day'] = this.birthDay;
    data['age'] = this.age;
    data['id_cart'] = this.idCart;
    data['profile_image'] = this.profileImage;
    data['level_id'] = this.levelId;
    data['semester_id'] = this.semesterId;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['semester_data'] = this.semesterData;
    data['level_data'] = this.levelData;
    data['total_point'] = this.totalPoint;
    return data;
  }
}
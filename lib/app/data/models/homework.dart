class Homework {
  int? id;
  int? studentId;
  int? subjectId;
  String? updatedAt;
  String? createdAt;
  String? deletedAt;
  int? teacherId;
  String? arName;
  String? enName;
  String? arDescription;
  String? enDescription;
  String? deliveryTime;
  String? file = "";
  String? video = "";
  String? image = "";
  String? status;
  String? type;

  Homework(
      {this.id,
        this.studentId,
        this.subjectId,
        this.updatedAt,
        this.createdAt,
        this.deletedAt,
        this.teacherId,
        this.arName,
        this.enName,
        this.arDescription,
        this.enDescription,
        this.deliveryTime,
        this.file,
        this.video,
        this.image,
        this.status,
        this.type});

  Homework.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    subjectId = json['subject_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
    teacherId = json['teacher_id'];
    arName = json['ar_name'];
    enName = json['en_name'];
    arDescription = json['ar_description'];
    enDescription = json['en_description'];
    deliveryTime = json['delivery_time'];
    if(json['file']!=null){
      file = json['file'];
    }
    if(json['video']!=null){
      video = json['video'];
    }
    if(json['image']!=null){
      image = json['image'];
    }
    status = json['status'];
    type = json['type'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['student_id'] = this.studentId;
  //   data['subject_id'] = this.subjectId;
  //   data['updated_at'] = this.updatedAt;
  //   data['created_at'] = this.createdAt;
  //   data['deleted_at'] = this.deletedAt;
  //   data['teacher_id'] = this.teacherId;
  //   data['ar_name'] = this.arName;
  //   data['en_name'] = this.enName;
  //   data['ar_description'] = this.arDescription;
  //   data['en_description'] = this.enDescription;
  //   data['delivery_time'] = this.deliveryTime;
  //   data['file'] = this.file;
  //   data['video'] = this.video;
  //   data['image'] = this.image;
  //   data['status'] = this.status;
  //   data['type'] = this.type;
  //   return data;
  // }
}
class SubjectChapter {
  int? id;
  int? subjectId;
  int? teacherId;
  String? arName;
  String? enName;
  String? arDescription;
  String? enDescription;
  String? deliveryTime;
  String? file="";
  String? video= "";
  String? image= "";
  String? status;
  String? type;
  String? name;
  String? description;
  String? statusName;
  String? createdAtDate;

  SubjectChapter(
      {this.id,
        this.subjectId,
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
        this.type,
        this.name,
        this.description,
        this.statusName,
        this.createdAtDate,
      });

  SubjectChapter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectId = json['subject_id'];
    teacherId = json['teacher_id'];
    arName = json['ar_name'];
    enName = json['en_name'];
    arDescription = json['ar_description'];
    enDescription = json['en_description'];
    deliveryTime = json['delivery_time']??"";
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
    name = json['name'];
    description = json['description'];
    statusName = json['status_name'];
    createdAtDate = json['created_at_date'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['subject_id'] = this.subjectId;
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
  //   data['name'] = this.name;
  //   data['description'] = this.description;
  //   data['status_name'] = this.statusName;
  //   return data;
  // }
}
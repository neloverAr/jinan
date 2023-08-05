class EventSummery {
  int? id;
  String? name;
  String? subDescription;
  String? description;
  String? type;
  String? file = "";
  String? video = "";
  String? image = "";
  List<String>? images;
  String? status;
  String? day;
  String? createdAt;

  EventSummery(
      {this.id,
        this.name,
        this.subDescription,
        this.description,
        this.type,
        this.file,
        this.video,
        this.image,
        this.images,
        this.status,
        this.day,
        this.createdAt});

  EventSummery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subDescription = json['sub_description'];
    description = json['description'];
    type = json['type'];
    if(json['file']!=null){
      file = json['file'];
    }
    if(json['video']!=null){
      video = json['video'];
    }
    if(json['image']!=null){
      image = json['image'];
    }
    if(json['images']==null){
      images=[];
    }else{
      images = json['images'].cast<String>();
    }

    status = json['status'];
    day = json['day'];
    createdAt = json['created_at']?? "";
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['sub_description'] = this.subDescription;
  //   data['description'] = this.description;
  //   data['type'] = this.type;
  //   data['file'] = this.file;
  //   data['video'] = this.video;
  //   data['image'] = this.image;
  //   data['images'] = this.images;
  //   data['status'] = this.status;
  //   data['day'] = this.day;
  //   data['created_at'] = this.createdAt;
  //   return data;
  // }
}
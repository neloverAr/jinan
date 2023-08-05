class StudentSubjectDetails {
  int? id;
  String? arName;
  String? enName;
  String? arDescription;
  String? enDescription;
  String? img;
  String? status;
  String? reviewForm;

  StudentSubjectDetails({this.id, this.arName, this.enName, this.arDescription,
    this.enDescription, this.img, this.status,this.reviewForm});

  StudentSubjectDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    arName = json['ar_name'];
    enName = json['en_name'];
    arDescription = json['ar_description'];
    enDescription = json['en_description'];
    img = json['img'];
    status = json['status'];
    reviewForm = json['review_form'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ar_name'] = this.arName;
    data['en_name'] = this.enName;
    data['ar_description'] = this.arDescription;
    data['en_description'] = this.enDescription;
    data['img'] = this.img;
    data['status'] = this.status;
    data['review_form'] = this.reviewForm;
    return data;
  }
}
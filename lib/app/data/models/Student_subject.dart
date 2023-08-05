class StudentSubjects {
  int? id;
  String? name;
  String? reviewForm;

  StudentSubjects({this.id, this.name,this.reviewForm});

  StudentSubjects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    reviewForm = json['review_form'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   return data;
  // }
}
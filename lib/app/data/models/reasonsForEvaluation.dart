class ReasonsForEvaluation {
  int? id;
  String? title;
  String? type;

  ReasonsForEvaluation({this.id, this.title, this.type});

  ReasonsForEvaluation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    return data;
  }
}
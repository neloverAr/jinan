class ReasonsForEvaluation {
  int? id;
  String? arTitle;
  String? enTitle;
  String? status;
  String? type;
  String? title;
  String? statusName;

  ReasonsForEvaluation(
      {this.id,
        this.arTitle,
        this.enTitle,
        this.status,
        this.type,
        this.title,
        this.statusName});

  ReasonsForEvaluation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    arTitle = json['ar_title'];
    enTitle = json['en_title'];
    status = json['status'];
    type = json['type'];
    title = json['title'];
    statusName = json['status_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ar_title'] = this.arTitle;
    data['en_title'] = this.enTitle;
    data['status'] = this.status;
    data['type'] = this.type;
    data['title'] = this.title;
    data['status_name'] = this.statusName;
    return data;
  }
}
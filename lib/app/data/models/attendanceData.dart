class AttendanceData {
  int? id;
  String? day;
  String? date;

  AttendanceData({this.id, this.day, this.date});

  AttendanceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['day'] = this.day;
    data['date'] = this.date;
    return data;
  }
}
class HonoraryBoard {
  String? studentName;
  int? studentId;
  int? totalPoint;

  HonoraryBoard({this.studentName, this.studentId, this.totalPoint});

  HonoraryBoard.fromJson(Map<String, dynamic> json) {
    studentName = json['student_name'];
    studentId = json['student_id'];
    totalPoint = json['total_point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_name'] = this.studentName;
    data['student_id'] = this.studentId;
    data['total_point'] = this.totalPoint;
    return data;
  }
}
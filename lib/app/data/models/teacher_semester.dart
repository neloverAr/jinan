class TeacherSemester {
  String? semesterName;
  int? semesterId;
  int? teacherId;
  String? teacherName;

  TeacherSemester(
      {this.semesterName, this.semesterId, this.teacherId, this.teacherName});

  TeacherSemester.fromJson(Map<String, dynamic> json) {
    semesterName = json['semester_name'];
    semesterId = json['semester_id'];
    teacherId = json['teacher_id'];
    teacherName = json['teacher_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['semester_name'] = this.semesterName;
    data['semester_id'] = this.semesterId;
    data['teacher_id'] = this.teacherId;
    data['teacher_name'] = this.teacherName;
    return data;
  }
}
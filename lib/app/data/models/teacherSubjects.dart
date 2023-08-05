class TeacherSubjects {
  int? subjectId;
  String? arName;
  String? enName;
  int? teacherId;
  String? teacherName;
  String? reviewForm;

  TeacherSubjects(
      {this.subjectId,
        this.arName,
        this.enName,
        this.teacherId,
        this.teacherName,
        this.reviewForm});

  TeacherSubjects.fromJson(Map<String, dynamic> json) {
    subjectId = json['subject_id'];
    arName = json['ar_name'];
    enName = json['en_name'];
    teacherId = json['teacher_id'];
    teacherName = json['teacher_name'];
    reviewForm = json['review_form'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject_id'] = this.subjectId;
    data['ar_name'] = this.arName;
    data['en_name'] = this.enName;
    data['teacher_id'] = this.teacherId;
    data['teacher_name'] = this.teacherName;
    data['review_form'] = this.reviewForm;
    return data;
  }
}
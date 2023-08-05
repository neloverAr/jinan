import 'attendanceData.dart';

class Attendance {
  int? id;
  int? studentId;
  int? attendanceId;
  int? semesterId;
  String? attendance;
  AttendanceData? attendanceData;
  int? attendanceCount;
  int? absentCount;

  Attendance(
      {this.id,
        this.studentId,
        this.attendanceId,
        this.semesterId,
        this.attendance,
        this.attendanceData,
        this.attendanceCount,
        this.absentCount});

  Attendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    attendanceId = json['attendance_id'];
    semesterId = json['semester_id'];
    attendance = json['attendance'];
    attendanceData = json['attendance_data'] != null
        ? AttendanceData.fromJson(json['attendance_data'])
        : null;
    attendanceCount = json['attendance_count'];
    absentCount = json['absent_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_id'] = this.studentId;
    data['attendance_id'] = this.attendanceId;
    data['semester_id'] = this.semesterId;
    data['attendance'] = this.attendance;
    if (this.attendanceData != null) {
      data['attendance_data'] = this.attendanceData!.toJson();
    }
    data['attendance_count'] = this.attendanceCount;
    data['absent_count'] = this.absentCount;
    return data;
  }
}
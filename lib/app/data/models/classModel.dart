import 'student.dart';

class ClassModel{
  int classNumber;
  List<Student>? students;
  String className;

  ClassModel({required this.classNumber,required this.className,this.students});
}
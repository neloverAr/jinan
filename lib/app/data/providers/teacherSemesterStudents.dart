import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class TeacherSemesterStudentsData{
  Crud crud;
  TeacherSemesterStudentsData(this.crud);

  getData(String token,String semesterID) async{
    var response = await crud.getData("${AppRoute.teacherSemesterStudents}$semesterID", {
      "Authorization":"Bearer $token",
      "Accept-Language":"ar"
    });
    return response.fold((l) => l, (r) => r);
  }
}
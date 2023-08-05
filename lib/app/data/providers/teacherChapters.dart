import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class TeacherChaptersData{
  Crud crud;
  TeacherChaptersData(this.crud);

  getData(String token,String subjectID) async{
    var response = await crud.getData("${AppRoute.teacherChapters}$subjectID", {
      "Authorization":"Bearer $token",
      "Accept-Language":"ar"
    });
    return response.fold((l) => l, (r) => r);
  }
}
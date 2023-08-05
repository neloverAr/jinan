import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class StudentTeachersData{
  Crud crud;
  StudentTeachersData(this.crud);

  getData(String token,int id) async{
    var response = await crud.getData("${AppRoute.studentTeachers}$id", {
      "Authorization":"Bearer $token",
      "Accept-Language":"ar"
    });
    return response.fold((l) => l, (r) => r);
  }
}
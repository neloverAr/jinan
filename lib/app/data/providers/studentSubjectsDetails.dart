import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class StudentSubjectsDetailsData{
  Crud crud;
  StudentSubjectsDetailsData(this.crud);

  getData(String token,int idSon,int idSubject) async{
    var response = await crud.getData("${AppRoute.sonSubjectsDetails}$idSon/$idSubject", {
      "Authorization":"Bearer $token",
      "Accept-Language":"ar"
    });
    return response.fold((l) => l, (r) => r);
  }
}
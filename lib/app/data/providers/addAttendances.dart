import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class AddAttendancesData{
  Crud crud;
  AddAttendancesData(this.crud);

  postData(String token,Map data,String semesterID) async{
    var response = await crud.postDataWithHeaders(
       "${AppRoute.addAttendances}$semesterID",
       data,{
      "Authorization":"Bearer $token",
      "Accept-Language":"ar",
      "Accept": "application/json"
    });
    return response.fold((l) => l, (r) => r);
  }
}
import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class EditPasswordData{
  Crud crud;
  EditPasswordData(this.crud);

  postData(String token,Map data) async{
    var response = await crud.postDataWithHeaders(AppRoute.editPassword,data ,{
      "Authorization":"Bearer $token",
      "Accept-Language":"ar"
    });
    return response.fold((l) => l, (r) => r);
  }
}
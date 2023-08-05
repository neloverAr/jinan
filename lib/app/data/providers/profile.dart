import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class ProfileData{
  Crud crud;
  ProfileData(this.crud);

  getData(String token) async{
    var response = await crud.getData(AppRoute.profile, {
      "Authorization":"Bearer $token",
      "Accept-Language":"ar"
    });
    return response.fold((l) => l, (r) => r);
  }
}
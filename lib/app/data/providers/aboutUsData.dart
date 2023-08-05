import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class AboutUsData{
  Crud crud;
  AboutUsData(this.crud);

  getData(String token) async{
    var response = await crud.getData(AppRoute.settings, {
      "Authorization":"Bearer $token",
      "Accept-Language":"ar"
    });
    return response.fold((l) => l, (r) => r);
  }
}
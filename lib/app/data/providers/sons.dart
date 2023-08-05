import 'package:get/get.dart';
import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';
import 'package:school/app/data/services/storage/services.dart';

class SonsData{
  Crud crud;
  SonsData(this.crud);

  getData(String token) async{
    var response = await crud.getData(AppRoute.sons, {
      "Authorization":"Bearer $token",
      "Accept-Language":"ar"
    });
    return response.fold((l) => l, (r) => r);
  }
}
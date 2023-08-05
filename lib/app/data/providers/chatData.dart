import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class ChatData{
  Crud crud;
  ChatData(this.crud);

  getData(String token) async{
    var response = await crud.getData(AppRoute.chat, {
      "Authorization":"Bearer $token",
      "Accept-Language":"ar"
    });
    return response.fold((l) => l, (r) => r);
  }
}
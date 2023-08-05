import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class ShowChatData{
  Crud crud;
  ShowChatData(this.crud);

  getData(String token,int id) async{
    var response = await crud.getData("${AppRoute.showChat}$id", {
      "Authorization":"Bearer $token",
      "Accept-Language":"ar"
    });
    return response.fold((l) => l, (r) => r);
  }
}
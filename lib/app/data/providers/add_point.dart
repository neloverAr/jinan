import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class AddPointsData{
  Crud crud;
  AddPointsData(this.crud);

  postData(String token,String id,Map data) async{
    var response = await crud.postDataWithHeaders("${AppRoute.addPoints}$id",data, {
      "Authorization":"Bearer $token",
      "Accept-Language":"ar",
    },);
    return response.fold((l) => l, (r) => r);
  }
}
import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class HonorBoardData{
  Crud crud;
  HonorBoardData(this.crud);

  getData(String token,) async{
    var response = await crud.getData(AppRoute.honorBoard, {
      "Authorization":"Bearer $token",
      "Accept-Language":"ar"
    });
    return response.fold((l) => l, (r) => r);
  }
}
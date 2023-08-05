import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class AdsDetailsData{
  Crud crud;
  AdsDetailsData(this.crud);

  getData(String token,int sonID,int adsID) async{
    var response = await crud.getData("${AppRoute.showAppInformation}$sonID/$adsID?type=ads", {
      "Authorization":"Bearer $token",
      "Accept-Language":"ar"
    });
    return response.fold((l) => l, (r) => r);
  }
}
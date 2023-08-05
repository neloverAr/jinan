import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class DailyCoverageDetailsData{
  Crud crud;
  DailyCoverageDetailsData(this.crud);

  getData(String token,int sonID,int dailyCoverageID) async{
    var response = await crud.getData("${AppRoute.showAppInformation}$sonID/$dailyCoverageID?type=daily_coverage", {
      "Authorization":"Bearer $token",
      "Accept-Language":"ar"
    });
    return response.fold((l) => l, (r) => r);
  }
}
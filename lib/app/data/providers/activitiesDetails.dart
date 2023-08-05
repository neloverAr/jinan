import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class ActivitiesDetailsData{
  Crud crud;
  ActivitiesDetailsData(this.crud);

  getData(String token,int sonID,int activityID) async{
    var response = await crud.getData("${AppRoute.showAppInformation}$sonID/$activityID?type=activities", {
      "Authorization":"Bearer $token",
      "Accept-Language":"ar"
    });
    return response.fold((l) => l, (r) => r);
  }
}
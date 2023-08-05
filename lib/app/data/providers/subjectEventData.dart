import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class SubjectEventData{
  Crud crud;
  SubjectEventData(this.crud);

  getData(String token,int sonID,int subjectID) async{
    var response = await crud.getData("${AppRoute.subjectAdditionalDetail}$sonID/$subjectID?type=activity", {
      "Authorization":"Bearer $token",
      "Accept-Language":"ar"
    });
    return response.fold((l) => l, (r) => r);
  }
}
import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class SubjectAdditionalDetailHomeworkData{
  Crud crud;
  SubjectAdditionalDetailHomeworkData(this.crud);

  getData(String token,int sonID,int subjectID) async{
    var response = await crud.getData("${AppRoute.subjectAdditionalDetail}$sonID/$subjectID?type=homework", {
      "Authorization":"Bearer $token",
      "Accept-Language":"ar"
    });
    return response.fold((l) => l, (r) => r);
  }
}
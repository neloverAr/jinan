import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class ReasonsForEvaluationData{
  Crud crud;
  ReasonsForEvaluationData(this.crud);

  getData(String token,) async{
    var response = await crud.getData(AppRoute.reasonsForEvaluation, {
      "Authorization":"Bearer $token",
      "Accept-Language":"ar"
    });
    return response.fold((l) => l, (r) => r);
  }
}
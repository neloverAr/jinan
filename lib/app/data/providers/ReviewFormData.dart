import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class ReviewFormData{
  Crud crud;
  ReviewFormData(this.crud);

  getData(String token,int sonID,String subjectID) async{
    var response = await crud.getData("${AppRoute.subjectReview}$sonID/$subjectID", {
      "Authorization":"Bearer $token",
      "Accept-Language":"ar"
    });
    return response.fold((l) => l, (r) => r);
  }
}
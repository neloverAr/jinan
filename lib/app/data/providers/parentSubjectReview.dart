import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class ParentSubjectReviewData{
  Crud crud;
  ParentSubjectReviewData(this.crud);

  postData(String reviewID,Map data) async{
    var response = await crud.postData("${AppRoute.parentSubjectReview}$reviewID",
        data);
    return response.fold((l) => l, (r) => r);
  }
}
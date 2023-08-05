import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class ReviewChapterFormData{
  Crud crud;
  ReviewChapterFormData
      (this.crud);

  getData(String token,int sonID,String subjectID,String chapterID) async{
    var response = await crud.getData("${AppRoute.subjectChapterReview}$sonID/$subjectID/$chapterID", {
      "Authorization":"Bearer $token",
      "Accept-Language":"ar"
    });
    return response.fold((l) => l, (r) => r);
  }
}
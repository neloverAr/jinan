import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class AddFormData{
  Crud crud;
  AddFormData(this.crud);

  postData(String studentID,String subjectID,Map data) async{
    var response = await crud.postData("${AppRoute.addSubjectReview}$studentID/$subjectID",
        data);
    return response.fold((l) => l, (r) => r);
  }
}
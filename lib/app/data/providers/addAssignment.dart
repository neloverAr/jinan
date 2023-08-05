import 'dart:io';

import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class AddToSubjectData{
  Crud crud;
  AddToSubjectData(this.crud);

  getData(String subjectID,Map<String,String> data,File? file1,File? file2,) async{
    var response = await crud.postDataWithTowFiles("${AppRoute.addSubjectAdditionalDetail}$subjectID",
    data,file1,file2);
    return response.fold((l) => l, (r) => r);
  }
}
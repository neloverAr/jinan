
import 'package:school/app/core/constants/routes.dart';
import '../../core/class/crud.dart';

class ForgetPasswordData{
  Crud crud;
  ForgetPasswordData(this.crud);

  postData(String email,) async{
    var response = await crud.postData(AppRoute.forgetPassword, {
      "email":email,
      //"verifyCode":verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
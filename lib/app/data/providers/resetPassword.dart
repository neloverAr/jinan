
import 'package:school/app/core/constants/routes.dart';
import '../../core/class/crud.dart';

class ResetPasswordData{
  Crud crud;
  ResetPasswordData(this.crud);

  postData(String forgetCode,String password,String passwordConfirmation) async{
    var response = await crud.postData(AppRoute.forgetPassword,{
      "forget_code":forgetCode,
      "password":password,
      "password_confirmation":passwordConfirmation,
    });
    return response.fold((l) => l, (r) => r);
  }
}
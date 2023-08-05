import 'package:school/app/core/class/crud.dart';
import 'package:school/app/core/constants/routes.dart';

class LoginData{
  Crud crud;
  LoginData(this.crud);

  postData(String mobile,String password,String fcmToken) async{
    var response = await crud.postData(AppRoute.login, {
      "mobile": mobile,
      "password": password,
      "fcm_token":fcmToken,
    });
    return response.fold((l) => l, (r) => r);
  }
}
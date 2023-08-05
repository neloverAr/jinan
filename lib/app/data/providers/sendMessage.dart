
import 'dart:io';

import '../../core/class/crud.dart';
import '../../core/constants/routes.dart';

class SendMessageData{
  Crud crud;
  SendMessageData(this.crud);

  postData(String token,int receiverID,Map<String,String> data,[File? file]) async{
    if(file==null){
      var response = await crud.postDataWithHeaders("${AppRoute.sendMessage}$receiverID",data,{
        "Authorization":"Bearer $token",
        "Accept-Language":"ar"
      });
      return response.fold((l) => l, (r) => r);
    }else{
      var response = await crud.postDataWithFile("${AppRoute.sendMessage}$receiverID",data, file!);
      return response.fold((l) => l, (r) => r);
    }

  }
}
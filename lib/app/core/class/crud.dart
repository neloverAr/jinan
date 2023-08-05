
import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:school/app/data/services/storage/services.dart';
import '../../functions/check-internet.dart';
import 'status_request.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' ;


class Crud{
  StorageService storageService = Get.find();

  Future<Either<StatusRequest, Map>> postData(String linkUrl,Map data) async {
   try{
     if(await checkInternet()){

       var response = await http.post(Uri.parse(linkUrl),body: data,headers: {
         "Authorization":"Bearer ${storageService.read("token")}",
         "Accept-Language":"ar"
       });
       if(response.statusCode==200||response.statusCode==201){
         Map responseBody = jsonDecode(response.body);
         return Right(responseBody);
       }else{
         Map responseBody = jsonDecode(response.body);
         Get.defaultDialog(title: "⚠",middleText:responseBody['message']);
         return const Left(StatusRequest.serverFailure);

       }
     }
     //else
       return const Left(StatusRequest.offlineFailure);

   }catch(_){
     return const Left(StatusRequest.serverException);
   }

  }
  /////////
  Future<Either<StatusRequest, Map>> postDataWithHeaders(String linkUrl,Map data,Map<String, String> headers) async {
    try{
      if(await checkInternet()){
        var response = await http.post(Uri.parse(linkUrl),
            body: data,
            headers: headers);
        if(response.statusCode==200||response.statusCode==201){
           Map responseBody = jsonDecode(response.body);
           print(responseBody);
          return Right(responseBody);
        }else{
          Map responseBody = jsonDecode(response.body);
          Get.defaultDialog(title: "⚠",middleText:responseBody['message']);
          return const Left(StatusRequest.serverFailure);
        }
      }
      //else
      return const Left(StatusRequest.offlineFailure);

    }catch(e){
      return const Left(StatusRequest.serverException);
    }

  }

  ////////

  Future<Either<StatusRequest, Map>> getData(String linkUrl,Map<String,String> data) async {
    try{
      if(await checkInternet()){

        var response = await http.get(Uri.parse(linkUrl),headers: data);
        print(linkUrl);
        //print(response.statusCode);
        if(response.statusCode==200||response.statusCode==201){
          Map responseBody = jsonDecode(response.body);
          //print(responseBody);
          return Right(responseBody);
        }else{
          return const Left(StatusRequest.serverFailure);
        }
      }
      //else
      return const Left(StatusRequest.offlineFailure);

    }catch(_){
      return const Left(StatusRequest.serverException);
    }

  }

  /////////
  Future<Either<StatusRequest, Map>> postDataWithProfileImage(String linkUrl,Map<String,String> data,
      File file) async {
    try{
      if(await checkInternet()){
        var request = http.MultipartRequest("POST",Uri.parse(linkUrl));
        int length = await file.length();
        var stream = http.ByteStream(file.openRead());
        var multiPartFile = http.MultipartFile("profile_image",stream,length,
            filename: basename(file.path)
        );
        request.headers["Authorization"] = "Bearer ${storageService.read("token")}";
        request.headers["Accept-Language"] = "ar";

        request.files.add(multiPartFile);
        data.forEach((key, value) {
          request.fields[key] = value;
        });
        var myRequest = await request.send();
        var response = await http.Response.fromStream(myRequest);

        if(response.statusCode==200||response.statusCode==201){
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        }else{
          return const Left(StatusRequest.serverFailure);
        }
      }
      //else
      return const Left(StatusRequest.offlineFailure);

    }catch(e){
      print(e);
      return const Left(StatusRequest.serverException);
    }

  }
  /////////
  Future<Either<StatusRequest, Map>> postDataWithTowFiles(
      String linkUrl,
      Map<String,String> data,
      File? file1,File? file2) async {
      try{
        if(await checkInternet()){
          var request = http.MultipartRequest("POST",Uri.parse(linkUrl));
          if(file1!=null){
            int length = await file1.length();
            var stream = http.ByteStream(file1.openRead());
            var multiPartFile = http.MultipartFile("file",stream,length,
                filename: basename(file1.path)
            );
            request.files.add(multiPartFile);
          }
          ///////////////
          if(file2!=null){
            int length2 = await file2.length();
            var stream2 = http.ByteStream(file2.openRead());
            var multiPartFile2 = http.MultipartFile("image",stream2,length2,
                filename: basename(file2.path)
            );
            request.files.add(multiPartFile2);
          }
          //////////////
          request.headers["Authorization"] = "Bearer ${storageService.read("token")}";
          request.headers["Accept-Language"] = "ar";

          data.forEach((key, value) {
            request.fields[key] = value;
          });
          var myRequest = await request.send();
          var response = await http.Response.fromStream(myRequest);
          print(response);
          if(response.statusCode==200||response.statusCode==201){
            Map responseBody = jsonDecode(response.body);

            return Right(responseBody);
          }else{
            Map responseBody = jsonDecode(response.body);
            print(responseBody);
            return const Left(StatusRequest.serverFailure);
          }
        }
        //else
        return const Left(StatusRequest.offlineFailure);

      }catch(e){
        print(e);
        return const Left(StatusRequest.serverException);
      }

  }
  ////////////////////
  Future<Either<StatusRequest, Map>> postDataWithFile(String linkUrl,Map<String,String> data,
      File file) async {
      try{
        if(await checkInternet()){
          var request = http.MultipartRequest("POST",Uri.parse(linkUrl));
          int length = await file.length();
          var stream = http.ByteStream(file.openRead());
          var multiPartFile = http.MultipartFile("file",stream,length,
              filename: basename(file.path)
          );
          request.headers["Authorization"] = "Bearer ${storageService.read("token")}";
          request.headers["Accept-Language"] = "ar";

          request.files.add(multiPartFile);
          data.forEach((key, value) {
            request.fields[key] = value;
          });
          var myRequest = await request.send();
          var response = await http.Response.fromStream(myRequest);

          if(response.statusCode==200||response.statusCode==201){
            Map responseBody = jsonDecode(response.body);
            return Right(responseBody);
          }else{
            return const Left(StatusRequest.serverFailure);
          }
        }
        //else
        return const Left(StatusRequest.offlineFailure);

      }catch(e){
        print(e);
        return const Left(StatusRequest.serverException);
      }


  }
}
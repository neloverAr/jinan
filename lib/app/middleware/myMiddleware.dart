import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/services/storage/services.dart';

class MyMiddleware extends GetMiddleware{

  StorageService storageService = Get.find();

  @override
  RouteSettings? redirect(String? route){
    if(storageService.read("step")=="3"){
      return const RouteSettings(name: "/home-screen");
    }// /home-screen
   if(storageService.read("step")=="2" && storageService.read("type")=="parents"){
      return const RouteSettings(name: "/child-selection-screen");
    }// /child-selection-screen
   if(storageService.read("step")=="2" && storageService.read("type")=="teacher"){
     return const RouteSettings(name: "/teacher-home-screen");
   }// /teacher-home-screen
   if(storageService.read("step")=="1"){
    return const RouteSettings(name: "/login-screen");
   }
  }

  @override
  int? get priority => 1;
}
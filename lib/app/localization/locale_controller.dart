import 'dart:ui';
import 'package:get/get.dart';
import 'package:school/app/core/utils/keys.dart';
import 'package:school/app/data/services/storage/services.dart';
import 'package:school/app/functions/fcmconfig.dart';

class LocaleController extends GetxController{
  Locale? language;
  StorageService storageService = Get.find();

  changeLanguage(String langCode){
    Locale locale = Locale(langCode);
    storageService.write(langKey, langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit(){
    requestPermissionNotification();
    fcmconfig();
    String? storageLang = storageService.read(langKey);
    if(storageLang=="en"){
      language = const Locale("en");
    }else if(storageLang=="ar"){
      language = const Locale("ar");
    }else{
      language = const Locale("ar");
      //language = Locale(Get.deviceLocale!.languageCode);
      storageService.write(langKey, "ar");
    }
    super.onInit();
  }
}
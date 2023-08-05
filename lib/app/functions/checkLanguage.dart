import 'package:get/get.dart';
import '../core/utils/keys.dart';
import '../data/services/storage/services.dart';

StorageService storageService = Get.find();

bool isArLang(){
 return storageService.read(langKey)=="ar"?true:false;
}

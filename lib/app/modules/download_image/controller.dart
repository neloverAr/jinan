import 'package:get/get.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:school/app/data/providers/schoolScedule.dart';
import 'package:http/http.dart' as http;
import '../../core/class/crud.dart';
import '../../core/class/status_request.dart';
import '../../data/services/storage/services.dart';

class DownloadImageController extends GetxController {

  SchoolSchedulesData schoolSchedulesData = SchoolSchedulesData(Crud());
  Rx<StatusRequest> downloadStatusRequest = StatusRequest.success.obs;
  StorageService storageService = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  downloadImage(String image) async{
    downloadStatusRequest.value = StatusRequest.loading;
    if(Uri.parse(image).isAbsolute){
      try{
        final response = await http.head(Uri.parse(image));
        if(response.statusCode==200||response.statusCode==201){

          await ImageDownloader.downloadImage(image);
          downloadStatusRequest.value = StatusRequest.success;
          Get.defaultDialog(title: "Message",middleText:"The image downloaded Successfully",radius: 3);
        }else{
          Get.defaultDialog(title: "Error",middleText:"Invalid image path",radius: 3);
        }
      }catch(e){
        print(e);
      }
    }else{
      Get.defaultDialog(title: "Error",middleText:"Invalid image path",radius: 3);
      downloadStatusRequest.value = StatusRequest.success;
    }
  }
}

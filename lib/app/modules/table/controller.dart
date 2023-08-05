import 'package:get/get.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:school/app/data/providers/schoolScedule.dart';
import 'package:http/http.dart' as http;
import '../../core/class/crud.dart';
import '../../core/class/status_request.dart';
import '../../data/services/storage/services.dart';
import '../../functions/handling_data.dart';

class TableController extends GetxController {

  SchoolSchedulesData schoolSchedulesData = SchoolSchedulesData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  Rx<StatusRequest> downloadStatusRequest = StatusRequest.success.obs;

  String data= "";
  StorageService storageService = Get.find();
  var response;

  getData() async{
    statusRequest.value = StatusRequest.loading;
    response = await schoolSchedulesData.getData(storageService.read("token"),
        storageService.read("sonID")
    );
    statusRequest.value = handlingData(response);

    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        data = response['data']['School schedule']['image'];

      }else{
        statusRequest.value = StatusRequest.failure;
      }
    }
  }

  refreshData() {
    getData();
  }

  @override
  void onInit() {
    getData();
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

  downloadImage() async{

    downloadStatusRequest.value = StatusRequest.loading;

    if(Uri.parse(data).isAbsolute){
      try{
        final response = await http.head(Uri.parse(data));
        if(response.statusCode==200||response.statusCode==201){

          await ImageDownloader.downloadImage(data);
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

      //downloadStatusRequest.value = StatusRequest.success;

  }
}

import 'package:get/get.dart';
import 'package:school/app/data/models/Settings.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/class/crud.dart';
import '../../core/class/status_request.dart';
import '../../data/models/student.dart';
import '../../data/providers/aboutUsData.dart';
import '../../data/services/storage/services.dart';
import '../../functions/handling_data.dart';

class AboutUsController extends GetxController {
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  AboutUsData aboutUsData = AboutUsData(Crud());
  Settings aboutUs = Settings(logoImage: "",arName: "",enAboutUsDescriptionPage: "",
  arAboutUsDescriptionPage: "",enName: "",arHeaderTitle:"",headerTitle: "",
      arDownloadAppTitle:"",downloadAppTitle:"",arDownloadAppDescription:"",
      downloadAppDescription:"",arContactTitle:"",contactTitle:"",arContactDescription:"",
      contactDescription:"",facebook:"",twitter:""
  );
  StorageService storageService = Get.find();

  getData() async{
    statusRequest.value = StatusRequest.loading;
    var response = await aboutUsData.getData(storageService.read("token"));
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){

        aboutUs = Settings.fromJson(response['data']['settings']);
      }else{
        //Get.defaultDialog(title: "⚠",middleText:response['message']);
        statusRequest.value = StatusRequest.failure;
      }
    }
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

  void sendEmail(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Example Subject&body=Example Body',
    );

    String url = params.toString();

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


}
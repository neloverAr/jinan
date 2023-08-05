
import 'package:get/get.dart';
import 'package:school/app/data/providers/profile.dart';
import '../../../core/class/crud.dart';
import '../../../core/class/status_request.dart';
import '../../../data/models/user.dart';
import '../../../data/services/storage/services.dart';
import '../../../functions/handling_data.dart';

class ProfileController extends GetxController {
  ProfileData subjectsData = ProfileData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  User data = User(firstName: "",lastName: "",profileImage: "",email: "",mobile: 0,fullName: "");
  StorageService storageService = Get.find();

  getData() async{
    statusRequest.value = StatusRequest.loading;
    var response = await subjectsData.getData(storageService.read("token"));
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        var user = response['data']['user'] ;
        data = User.fromJson(user);

      }else{
        //Get.defaultDialog(title: "⚠",middleText:"Not Parent User");
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

}



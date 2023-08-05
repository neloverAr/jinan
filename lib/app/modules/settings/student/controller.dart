import 'package:get/get.dart';
import 'package:school/app/data/models/user.dart';
import 'package:school/app/data/providers/profile.dart';
import '../../../core/class/crud.dart';
import '../../../core/class/status_request.dart';
import '../../../data/services/storage/services.dart';
import '../../../functions/handling_data.dart';

class SettingsController extends GetxController {

  ProfileData profileData = ProfileData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  User data = User(profileImage: "",fullName: "");
  StorageService storageService = Get.find();
  late Rx<bool> expanded=false.obs;

  getData() async{
    statusRequest.value = StatusRequest.loading;
    var response = await profileData.getData(storageService.read("token"),
    );
    statusRequest.value = handlingData(response);
    //print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        data = User.fromJson(response['data']['user']);

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
  void onClose(){
    super.onClose();
  }

  void updateExpand(){
    expanded.value = !(expanded.value) ;
  }

}
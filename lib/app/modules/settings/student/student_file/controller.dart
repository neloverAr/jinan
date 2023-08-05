
import 'package:get/get.dart';
import 'package:school/app/data/models/studentFile.dart';
import 'package:school/app/data/providers/studentFileData.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/class/status_request.dart';
import '../../../../data/services/storage/services.dart';
import '../../../../functions/handling_data.dart';

class StudentFileController extends GetxController {

  StudentFileData studentFileData = StudentFileData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  late StudentFile data = StudentFile(id:0,fullName: "",firstName: "",lastName: "",
  grandfatherName: "",age: 0,birthDay: "",profileImage: "",
      levelData: "",levelId: 0,
  totalPoint: 0,gender: "",fatherName: "",idCart: "",semesterData: "");

  //var data ;
  StorageService storageService = Get.find();

  getData() async{
    statusRequest.value = StatusRequest.loading;
    var response = await studentFileData.getData(storageService.read("token"),
        storageService.read("sonID"));
    statusRequest.value = handlingData(response);

    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        data = StudentFile.fromJson(response['data']['sons']);

      }else{
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

import 'package:get/get.dart';
import 'package:school/app/data/models/studentPoint.dart';
import 'package:school/app/data/providers/pointsData.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/class/status_request.dart';
import '../../../../data/services/storage/services.dart';
import '../../../../functions/handling_data.dart';

class PointsController extends GetxController {
  PointsData pointsData = PointsData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  List<StudentPoint> data = [];
  StorageService storageService = Get.find();
  int total = 0;

  getData() async{
    statusRequest.value = StatusRequest.loading;
    var response = await pointsData.getData(storageService.read("token"),
      storageService.read("sonID")
    );
    statusRequest.value = handlingData(response);
    //print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        var pointsList = response['data']['Student Points'] as List;
        data = pointsList.map<StudentPoint>((json) => StudentPoint.fromJson(json)).toList();
       calculateTotal();
      }else{
        statusRequest.value = StatusRequest.failure;
      }
    }
  }

  calculateTotal() {
    data.forEach((element) {
      total += element.totalPoints!;
    });
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

}
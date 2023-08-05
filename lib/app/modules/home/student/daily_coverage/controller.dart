
import 'package:get/get.dart';
import 'package:school/app/data/models/EventSummery.dart';
import 'package:school/app/data/providers/dailyCoverageSummery.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/class/status_request.dart';
import '../../../../data/services/storage/services.dart';
import '../../../../functions/handling_data.dart';

class DailyCoverageController extends GetxController {

  DailyCoverageData dailyCoverageData = DailyCoverageData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  List<EventSummery> data= [];
  StorageService storageService = Get.find();

  getData() async{
    statusRequest.value = StatusRequest.loading;
    var response = await dailyCoverageData.getData(storageService.read("token"),storageService.read("sonID"));
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        var adsList = response['data']['App information'] as List;
        data = adsList.map<EventSummery>((json) => EventSummery.fromJson(json)).toList();
      }else{
        //Get.defaultDialog(title: "⚠",middleText:"Not Parent User");
        statusRequest.value = StatusRequest.failure;
      }
    }
  }

  goToDescData(int id) async {
    Get.toNamed("/event-desc-screen",arguments:{
      "id":id,
      "type":"dailyCoverage"
    });
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


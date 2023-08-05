import 'package:get/get.dart';
import 'package:school/app/data/models/honory_board.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/class/status_request.dart';
import '../../../../data/providers/honorProvider.dart';
import '../../../../data/services/storage/services.dart';
import '../../../../functions/handling_data.dart';

class HonorController extends GetxController {

  HonorBoardData boardData = HonorBoardData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  List<HonoraryBoard> data = [];
  StorageService storageService = Get.find();

  getData() async{
    statusRequest.value = StatusRequest.loading;
    var response = await boardData.getData(storageService.read("token"));
    statusRequest.value = handlingData(response);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        var boardList = response['data']['Honorary board'] as List;
        data = boardList.map<HonoraryBoard>((json) => HonoraryBoard.fromJson(json)).toList();

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
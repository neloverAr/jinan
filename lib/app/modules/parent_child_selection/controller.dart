import 'package:get/get.dart';
import '../../core/class/crud.dart';
import '../../core/class/status_request.dart';
import '../../data/models/son.dart';
import '../../data/providers/sons.dart';
import '../../data/services/storage/services.dart';
import '../../functions/handling_data.dart';

class ChildSelectionController extends GetxController {

  SonsData sonsData = SonsData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  List<Son> data= [];
  StorageService storageService = Get.find();
  var response;

  getData() async{
    statusRequest.value = StatusRequest.loading;
    response = await sonsData.getData(storageService.read("token"));
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
       try{
         var sonsList = response['data']['sons'] as List;
         data = sonsList.map<Son>((json) => Son.fromJson(json)).toList();
         if(data.isNotEmpty) {
           storageService.write("step","3");
         }
       }catch(_){
         data = [];
      }

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

  void saveId(int index) {
    storageService.write("sonID",response['data']['sons'][index]['id']);
    storageService.write("totalPoints",response['data']['sons'][index]['total_point']);
    storageService.write("sonName",response['data']['sons'][index]['first_name']);
  }

  // changeOfficialAccount(Student std){
  //   officialAccount.value = std;
  // }


}
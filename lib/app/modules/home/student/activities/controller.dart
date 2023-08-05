
import 'package:get/get.dart';
import 'package:school/app/data/providers/activities.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/class/status_request.dart';
import '../../../../data/models/subjectEvent.dart';
import '../../../../data/services/storage/services.dart';
import '../../../../functions/handling_data.dart';
import '../../../subjects/student/events/subject_event_details.dart';

class ActivitiesController extends GetxController {

  ActivitiesData activitiesData = ActivitiesData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  List<SubjectEvent> data= [];
  StorageService storageService = Get.find();

  getData() async{
    statusRequest.value = StatusRequest.loading;
    var response = await activitiesData.getData(storageService.read("token"),storageService.read("sonID"));
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        var activitiesList = response['data']['App information'] as List;
        data = activitiesList.map<SubjectEvent>((json) => SubjectEvent.fromJson(json)).toList();
      }else{
        //Get.defaultDialog(title: "⚠",middleText:"Not Parent User");
        statusRequest.value = StatusRequest.failure;
      }
    }
  }

  goToDescData(SubjectEvent event) async {
    Get.to(()=>SubjectEventDescription(event: event,));
    // Get.toNamed("/event-desc-screen",arguments:{
    //   "id":id,
    //   "type":"activities"
    // });
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


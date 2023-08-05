import 'package:get/get.dart';
import 'package:school/app/data/models/weeklyPlan.dart';
import 'package:school/app/data/providers/weeklyPlanData.dart';
import '../../core/class/crud.dart';
import '../../core/class/status_request.dart';
import '../../data/services/storage/services.dart';
import '../../functions/handling_data.dart';

class WeeklyPlanController extends GetxController {

  WeeklyPlanData weeklyPlanData = WeeklyPlanData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  List<WeeklyPlan> weeklyPlans = [];
  StorageService storageService = Get.find();

  Rx<WeeklyPlan> weekPlanSelected = WeeklyPlan(image: "").obs;
  late List<String> items;

  getData() async{
    statusRequest.value = StatusRequest.loading;
    var response = await weeklyPlanData.getData(
        storageService.read("token"),
        storageService.read("sonID")
    );
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        var weeklyPlanList = response['data']['weekly plan'] as List;
        weeklyPlans =  weeklyPlanList.map<WeeklyPlan>((json) => WeeklyPlan.fromJson(json)).toList();
        if(weeklyPlans.isNotEmpty) {
          weekPlanSelected.value = weeklyPlans[0];
        }
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

  void changeWeekSelected(WeeklyPlan? newWeek) {
    weekPlanSelected.value= newWeek!;
  }

}

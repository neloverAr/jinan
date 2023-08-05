
import 'package:get/get.dart';
import 'package:school/app/data/models/attendance.dart';
import '../../core/class/crud.dart';
import '../../core/class/status_request.dart';
import '../../data/providers/attendancesData.dart';
import '../../data/services/storage/services.dart';
import '../../functions/handling_data.dart';

class AttendancesController extends GetxController {
  AttendancesData attendancesData = AttendancesData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  List<Attendance> data = [];
  StorageService storageService = Get.find();

  getData() async{
    statusRequest.value = StatusRequest.loading;
    var response = await attendancesData.getData(storageService.read("token"),storageService.read("sonID"));
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        var attendanceList = response['data']['attendance_student'] as List;
        data = attendanceList.map<Attendance>((json) => Attendance.fromJson(json)).toList();
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

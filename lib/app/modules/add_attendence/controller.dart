import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school/app/data/providers/addAttendances.dart';
import '../../core/class/crud.dart';
import '../../core/class/status_request.dart';
import '../../data/models/student.dart';
import '../../data/providers/teacherSemesterStudents.dart';
import '../../data/services/storage/services.dart';
import '../../functions/handling_data.dart';

class AddAttendancesController extends GetxController {

  AddAttendancesData addAttendancesData = AddAttendancesData(Crud());
  late String id;
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  Rx<StatusRequest> statusRequest2 = StatusRequest.success.obs;
  TeacherSemesterStudentsData semestersData = TeacherSemesterStudentsData(Crud());
  List<Student> semesterStudents = [];
  List<RxBool> attendancesStatus = <RxBool>[];
  StorageService storageService = Get.find();
  Map data = {};

  Future getData(String semesterID) async{
    statusRequest.value = StatusRequest.loading;
    var response = await semestersData.getData(storageService.read("token"),semesterID);
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        var semestersList = response['data']['Teacher students'] as List;
        semesterStudents = semestersList.map<Student>((json) => Student.fromJson(json)).toList();
        for (var element in semesterStudents) {
          attendancesStatus.add(true.obs);
        }
      }else{
        //Get.defaultDialog(title: "⚠",middleText:response['message']);
        statusRequest.value = StatusRequest.failure;
      }
    }
  }
  //////////////
  postAttendances() async{
    statusRequest2.value = StatusRequest.loading;
    for(int i=0;i<semesterStudents.length;++i){
      data["student_id[$i]"]="${semesterStudents[i].id}";
      data["attendance_status""$i"]=attendancesStatus[i].value?"present":"absent";
    }
    Map attendances = {
      "date":"${DateFormat('yyyy-MM-dd').format(DateTime.now())}",
      "day":DateFormat('EEEE').format(DateTime.now()),
    };
    attendances.addAll(data);
    var response = await addAttendancesData.postData(storageService.read("token"),
        attendances,id);
    statusRequest2.value = handlingData(response);
    if(StatusRequest.success == statusRequest2.value){
      if(response['status']==true){
        Get.defaultDialog(title: "",middleText:"Attendances Added Successfully");
      }else{
        //Get.defaultDialog(title: "⚠",middleText:"Not Parent User");
        statusRequest2.value = StatusRequest.failure;
      }
    }
  }


  @override
  void onInit() {
    id = "${Get.arguments["semesterID"]}";
    getData(id);
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

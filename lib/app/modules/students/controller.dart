import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/class/crud.dart';
import '../../core/class/status_request.dart';
import '../../data/models/student.dart';
import '../../data/providers/studentData.dart';
import '../../data/services/storage/services.dart';
import '../../functions/handling_data.dart';

class StudentsController extends GetxController {
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  TeacherStudentsData studentsData = TeacherStudentsData(Crud());
  List<Student> students = [];
  StorageService storageService = Get.find();

  getData() async{
    statusRequest.value = StatusRequest.loading;
    var response = await studentsData.getData(storageService.read("token"));
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){

        var studentsList = response['data']['Teacher students'] as List;
        students = studentsList.map<Student>((json) => Student.fromJson(json)).toList();

      }else{
        //Get.defaultDialog(title: "⚠",middleText:response['message']);
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

  void sendEmail(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Example Subject&body=Example Body',
    );

    String url = params.toString();
    //final uri = Uri.parse(url);
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }


}
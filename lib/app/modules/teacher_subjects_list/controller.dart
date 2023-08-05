
import 'package:get/get.dart';
import 'package:school/app/data/models/subjectChapter.dart';
import '../../core/class/crud.dart';
import '../../core/class/status_request.dart';
import '../../data/providers/teacherChapters.dart';
import '../../data/services/storage/services.dart';
import '../../functions/handling_data.dart';

class TeacherChaptersController extends GetxController {
  TeacherChaptersData subjectsData = TeacherChaptersData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  List<SubjectChapter> data= [];
  StorageService storageService = Get.find();

  getData(int subjectID) async{
    statusRequest.value = StatusRequest.loading;
    var response = await subjectsData.getData(storageService.read("token"),
        "$subjectID");
    statusRequest.value = handlingData(response);
    print(statusRequest.value);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        var chaptersList = response['data']['Teacher subjects'] as List;
        data = chaptersList.map<SubjectChapter>((json) => SubjectChapter.fromJson(json)).toList();
        // if(data.isEmpty){
        //   Get.offAndToNamed("/teacher-students-forReview-screen",arguments: {
        //     "subjectID":Get.arguments["subjectID"],
        //     "reviewForm":Get.arguments["reviewForm"],
        //     "chapterID":"null",
        //   });
        // }
      }else{
        statusRequest.value = StatusRequest.failure;
      }
    }
  }

  refreshData() {
    getData(Get.arguments["subjectID"]);
  }

  @override
  void onInit() {
    int subjectID = Get.arguments["subjectID"];
    getData(subjectID);
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


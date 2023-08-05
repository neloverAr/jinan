
import 'package:get/get.dart';
import 'package:school/app/data/models/subjectChapter.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/class/status_request.dart';
import '../../../../data/providers/subjectAdditionalDetailChapter.dart';
import '../../../../data/services/storage/services.dart';
import '../../../../functions/handling_data.dart';


class SubjectChapterController extends GetxController {
  SubjectAdditionalDetailChapterData subjectsData = SubjectAdditionalDetailChapterData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  List<SubjectChapter> chapters= [];
  StorageService storageService = Get.find();

  getData(int subjectID) async {
    statusRequest.value = StatusRequest.loading;
    var response = await subjectsData.getData(storageService.read("token"),storageService.read("sonID"),subjectID);
    statusRequest.value = handlingData(response);
    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        var chaptersList = response['data']['Subjects'] as List;
        chapters = chaptersList.map<SubjectChapter>((json) => SubjectChapter.fromJson(json)).toList();
      }else{
        statusRequest.value = StatusRequest.failure;
      }
    }
  }

  @override
  void onInit() {
    int id = Get.arguments["subjectID2"];
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


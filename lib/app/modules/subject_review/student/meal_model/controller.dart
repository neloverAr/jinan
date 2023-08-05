import 'package:get/get.dart';
import 'package:school/app/data/models/review_form.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/class/status_request.dart';
import '../../../../data/providers/reviewChapterFormData.dart';
import '../../../../data/services/storage/services.dart';
import '../../../../functions/handling_data.dart';

class MealModelController extends GetxController {
  ReviewChapterFormData formData = ReviewChapterFormData(Crud());
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;
  late ReviewForm data = ReviewForm(reviewForm: "",review: "",saveVerses: "",linkVerses: "",
      recital: "",saveThePreviousDay: "",linkVersesThePreviousDayVerses: "",recitalThePreviousDay: "",
      reviewFromThree: "",amount: "",mealContent: "",notes: ""
  );
  StorageService storageService = Get.find();

  getData(String subjectID,String chapterID) async{
    statusRequest.value = StatusRequest.loading;
    var response = await formData.getData(
        storageService.read("token"),
        storageService.read("sonID"),
        subjectID,chapterID
    );
    statusRequest.value = handlingData(response);

    if(StatusRequest.success == statusRequest.value){
      if(response['status']==true){
        data = ReviewForm.fromJson(response["data"]["review"]);
      }else{
        //Get.defaultDialog(title: "",middleText:response["message"]);
        statusRequest.value = StatusRequest.failure;
      }
    }
  }


  @override
  void onInit() {
    String subjectID = "${Get.arguments["subjectID2"]}";
    String chapterID = "${Get.arguments["chapterID"]}";
    getData(subjectID,chapterID);
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

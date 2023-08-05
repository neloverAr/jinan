
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/images_path.dart';
import 'package:school/app/data/services/storage/services.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import 'package:school/app/widgets/icon_name_widget.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import '../../../core/constants/padding.dart';
import 'controller.dart';

class TeacherSubjectsScreen extends StatelessWidget {
  TeacherSubjectsScreen({Key? key}) : super(key: key);
  TeacherSubjectsController controller = Get.put(TeacherSubjectsController());
  final scrollController = ScrollController();
  StorageService storageService = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          TopWidget(type: "sliver", containedWidget:
          TopWidgetTitle(
            type: "withBackArrow",text: "subjects".tr,
          ),
          ),
          SliverToBoxAdapter(
              child: GetX<TeacherSubjectsController>(
                builder: (controller){
                  return HandlingDataView(statusRequest: controller.statusRequest.value, widget:
                  GridView.builder(
                    controller: scrollController,
                    padding: EdgeInsets.symmetric(horizontal: mainPadding,vertical: 1.5.hp),
                    physics:const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.subjects.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300.0,
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 12.0,
                      childAspectRatio: 0.9,
                    ), itemBuilder: (BuildContext context, int index) {
                    return IconNameWidget(
                     name: storageService.read("lang")=="ar"?
                    controller.subjects[index].arName!
                    :controller.subjects[index].enName!,
                      icon: onBoarding3,
                      onTap: (){
                       if(Get.arguments['nextPage']=="assess"){
                         Get.toNamed("/teacher-chapters-screen",arguments: {
                           "subjectID":controller.subjects[index].subjectId,
                           "reviewForm":controller.subjects[index].reviewForm,
                         });
                         // Get.toNamed("/teacher-students-forReview-screen",arguments: {
                         //   "subjectID":controller.subjects![index].subjectId,
                         //   "reviewForm":controller.subjects![index].reviewForm,
                         // });
                       }
                       else{
                         Get.toNamed("/teacher-subject-details",arguments: {
                           "subjectID":controller.subjects[index].subjectId,
                           "subjectArabicName":controller.subjects[index].arName,
                           "subjectEnglishName":controller.subjects[index].enName,
                         });
                       }
                      },
                    ) ;},
                  )
                  );
                },
              )
          )
        ],
      ),
    );
  }
}

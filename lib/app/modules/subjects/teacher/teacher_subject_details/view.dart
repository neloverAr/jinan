
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/data/services/storage/services.dart';
import 'package:school/app/widgets/icon_name_widget.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import '../../../../core/constants/border_radius.dart';
import '../../../../core/constants/height.dart';
import '../../../../core/values/images_path.dart';
import 'controller.dart';

class TeacherSubjectDetail extends StatelessWidget {
  TeacherSubjectDetail({Key? key}) : super(key: key);
  TeacherSubjectDetailsController controller = Get.put(TeacherSubjectDetailsController());
  StorageService storageService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            TopWidget(type:"fixed", containedWidget: TopWidgetTitle(
              type: "withBackArrow",text:storageService.read("lang")=="ar"?controller.arName
              :controller.enName,
            )),
            Positioned(
              top: upperWidgetHeight - upperWidgetRadius+5,
              left: mainPadding,
              right: mainPadding,
              child: SizedBox(
                //height: Get.height*.5,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children:  <Widget>[
                    IconNameWidget(name: "addChapter".tr, icon: addSubjectImage,onTap: (){
                      Get.toNamed("/add-chapter-screen",arguments: {
                        "subjectID":controller.id
                      });
                      //Get.to(()=>AddChapterScreen());
                    },),
                    IconNameWidget(name: "addAssignments".tr, icon: addAssignmentImage,onTap: (){
                      Get.toNamed("/add-assignment-screen",arguments: {
                        "subjectID":controller.id
                      });
                      //Get.to(()=>AddAssignmentScreen());
                    }),
                    IconNameWidget(name: "addActivity".tr, icon:activitiesAndEventsImage,onTap: (){
                      Get.toNamed("/add-activity-screen",arguments: {
                        "subjectID":controller.id
                      });
                      //Get.to(()=>AddActivityScreen());
                    }),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}

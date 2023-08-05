
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/icons.dart';
import 'package:school/app/data/services/storage/services.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import 'package:school/app/widgets/icon_name_widget.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import '../../core/constants/padding.dart';
import 'controller.dart';

class TeacherSemestersScreen extends StatelessWidget {
  TeacherSemestersScreen({Key? key}) : super(key: key);
  TeacherSemestersController controller = Get.put(TeacherSemestersController());
  StorageService storageService = Get.find();
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          TopWidget(type: "sliver", containedWidget:
          TopWidgetTitle(
            type: "withBackArrow",text: "semesters".tr,
          ),
          ),
          SliverToBoxAdapter(
              child: GetX<TeacherSemestersController>(
                builder: (controller){
                  return HandlingDataView(statusRequest: controller.statusRequest.value, widget:
                  GridView.builder(
                    controller: scrollController,
                    padding: EdgeInsets.symmetric(horizontal: mainPadding,vertical: 1.5.hp),
                    physics:const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.semesters.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300.0,
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 12.0,
                      childAspectRatio: 0.9,
                    ), itemBuilder: (BuildContext context, int index) {
                    return IconNameWidget(name:controller.semesters![index].semesterName!,
                      icon: classIcon,
                      onTap: (){
                        Get.toNamed(Get.arguments["nextPage"],arguments: {
                          "semesterID":controller.semesters![index].semesterId
                        });
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

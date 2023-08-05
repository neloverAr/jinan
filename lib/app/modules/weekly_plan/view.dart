import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/data/models/weeklyPlan.dart';
import 'package:school/app/modules/download_image/view.dart';
import 'package:school/app/modules/weekly_plan/controller.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import '../../core/constants/border_radius.dart';
import '../../core/constants/height.dart';
import '../../core/constants/padding.dart';
import '../../core/values/icons.dart';
import '../../functions/checkLanguage.dart';
import '../../functions/urlLauncher.dart';
import '../../widgets/top_widget.dart';
import '../../widgets/top_widget_title.dart';

class WeeklyPlanScreen extends StatelessWidget {
   WeeklyPlanScreen({Key? key}) : super(key: key);
  WeeklyPlanController weeklyPlanController = Get.put(WeeklyPlanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<WeeklyPlanController>(
        builder: (controller){
          return Stack(
            fit: StackFit.expand,
            children: [
              TopWidget(
                  type: "fixed",
                  containedWidget:
                  TopWidgetTitle(type: "withBackArrow", text: 'weeklyPlan'.tr,)),
              Positioned(
                top: upperWidgetHeight - upperWidgetRadius,
                left: 0,
                right: 0,
                child: HandlingDataView(statusRequest: controller.statusRequest.value, widget: Padding(
                  padding: EdgeInsets.symmetric(horizontal: mainPadding),
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(cardsRadius)
                        ),
                        child: DropdownButtonFormField<WeeklyPlan>(
                          value: controller.weekPlanSelected.value,
                          isExpanded: true,
                          itemHeight:48,
                          decoration:  InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(cardsRadius),
                              borderSide: const BorderSide(
                                color: Color(0xEEEEEEEE),
                              ),),
                            border: OutlineInputBorder(),
                          ),
                          elevation: 0,
                          borderRadius: BorderRadius.circular(textFieldRadius),
                          icon: SvgPicture.asset(arrowIcon),
                          items: controller.weeklyPlans.map((WeeklyPlan item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item.numberOfWeek!),
                            );
                          }).toList(),
                          onChanged: (WeeklyPlan? value){
                            controller.changeWeekSelected(value);
                          },
                        ),
                      ),SizedBox(height: 1.0.hp,),
                      Container(
                        height: 70.0.hp,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                                width: double.infinity,
                                height: 70.0.hp,
                                decoration:  BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(cardsRadius),
                                ),
                                child: InkWell(
                                  onTap: (){
                                    launchURL(controller.weekPlanSelected.value.image??"");
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(cardsRadius),
                                    child: CachedNetworkImage(imageUrl: controller.weekPlanSelected.value.image??"",
                                      fit: BoxFit.fitWidth,progressIndicatorBuilder: (context, url, downloadProgress) =>
                                          Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    ),
                                  ),
                                ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Align(
                                alignment: isArLang()?Alignment.bottomLeft:Alignment.bottomRight,
                                child: DownloadImageWidget(image: controller.weekPlanSelected.value.image!)
                            ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                )
              ),
            ],
          );
        },
      )
    );
  }
}

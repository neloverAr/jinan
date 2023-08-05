
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/border_radius.dart';
import 'package:school/app/core/constants/height.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/functions/urlLauncher.dart';
import 'package:school/app/modules/table/controller.dart';
import 'package:school/app/widgets/top_widget.dart';
import '../../widgets/handling_data_view.dart';
import 'widgets/top_widget_title.dart';

class TableScreen extends StatelessWidget {
  TableScreen({Key? key}) : super(key: key);
  TableController tableController = Get.put(TableController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<TableController>(
        builder: (tableController){
          return Stack(
              fit:StackFit.expand,
              children: [
                TopWidget(
                    type: "fixed",
                    containedWidget:
                    TopWidgetTableTitle(text:"schedule".tr,)),
                Positioned(
                    top: upperWidgetHeight - upperWidgetRadius +10,
                    left: mainPadding,
                    right: mainPadding,
                    child: Container(
                        width: double.infinity,
                        height: 70.0.hp,
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(cardsRadius),
                          // image: DecorationImage(
                          //   image: NetworkImage(tableController.data),
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                        child: HandlingDataView(
                          statusRequest: tableController.statusRequest.value,
                          widget: InkWell(
                            onTap: (){
                              launchURL(tableController.data);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(cardsRadius),
                              child: CachedNetworkImage(imageUrl: tableController.data,
                                fit: BoxFit.fitWidth,),
                            ),
                          )
                          // Image.network(tableController.data,
                          //   fit: BoxFit.fill,errorBuilder: (context, error, stackTrace){
                          //     return Center(child: SvgPicture.asset("assets/images/icons/nullImage.svg"));
                          //   },),
                        )
                    ),
                )
              ]
          );
        },
      )
    );
  }
}


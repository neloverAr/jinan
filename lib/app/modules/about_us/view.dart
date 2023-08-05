
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/border_radius.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/icons.dart';
import 'package:school/app/functions/checkLanguage.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import '../../functions/urlLauncher.dart';
import 'controller.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({Key? key}) : super(key: key);
  AboutUsController aboutUsController = Get.put(AboutUsController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<AboutUsController>(
        builder: (controller){
          return CustomScrollView(
              slivers:[
                TopWidget(
                  type: "sliver",
                  containedWidget:
                  TopWidgetTitle(type: "withBackArrow", text: "aboutUs".tr),),
                SliverToBoxAdapter(
                  child: HandlingDataView(statusRequest: controller.statusRequest.value, widget:
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                    child: Card(
                      shape: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(cardsRadius),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 7.0.wp,
                            horizontal: mainPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 1.0.hp),
                              child: CachedNetworkImage(imageUrl: controller.aboutUs.logoImage!,
                                width:84,
                                height: 52,progressIndicatorBuilder: (context, url, downloadProgress) =>
                                    Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                errorWidget: (context, url, error) => Icon(Icons.error),

                              )
                            ),
                            Text(isArLang()?controller.aboutUs.arName!
                                :controller.aboutUs.enName!,textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 13.0.sp,
                                  height: 0.2.hp,
                                  fontWeight: FontWeight.bold
                              ),),
                            Text(isArLang()?controller.aboutUs.arHeaderTitle!
                                :controller.aboutUs.headerTitle!,textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 13.0.sp,
                                  height: 0.2.hp,
                                  //fontWeight: FontWeight.bold
                              ),),
                            SizedBox(height: 1.0.hp,),
                            Text(isArLang()?controller.aboutUs.arAboutUsDescriptionPage!
                                :controller.aboutUs.aboutUsDescriptionPage!,textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 11.0.sp,
                                height: 0.2.hp,
                                //fontWeight: FontWeight.bold
                              ),),
                            SizedBox(height: 2.0.hp,),
                            Text(isArLang()?controller.aboutUs.arDownloadAppTitle!
                                :controller.aboutUs.downloadAppTitle!,textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 13.0.sp,
                                height: 0.2.hp,
                                fontWeight: FontWeight.bold
                              ),),
                            SizedBox(height: 1.0.hp,),
                            Text(isArLang()?controller.aboutUs.arDownloadAppDescription!
                                :controller.aboutUs.downloadAppDescription!,textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 11.0.sp,
                                height: 0.2.hp,
                                //fontWeight: FontWeight.bold
                              ),),
                            SizedBox(height: 2.0.hp,),
                            Text(isArLang()?controller.aboutUs.arContactTitle!
                                :controller.aboutUs.contactTitle!,textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 13.0.sp,
                                height: 0.2.hp,
                                fontWeight: FontWeight.bold
                              ),),
                            SizedBox(height: 1.0.hp,),
                            Text(isArLang()?controller.aboutUs.arContactDescription!
                                :controller.aboutUs.contactDescription!,textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 11.0.sp,
                                height: 0.2.hp,
                              ),),
                            SizedBox(height: 2.0.hp,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: (){
                                    launchURL(controller.aboutUs.facebook!);
                                  },
                                    child: SvgPicture.asset(facebookIcon)),
                                InkWell(
                                    onTap: (){
                                      launchURL(controller.aboutUs.twitter!);
                                    },
                                    child: SvgPicture.asset(twitterIcon)),
                                // InkWell(
                                //     onTap: (){
                                //       launchURL("https://instagram.com");
                                //     },
                                //     child: SvgPicture.asset(instagramIcon)),
                                InkWell(
                                    onTap: (){
                                      launchURL("https://whatsapp.com");
                                    },
                                    child: SvgPicture.asset(whatsappIcon)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),)
                ),
              ]
          );
        },
      )
      );
  }
}

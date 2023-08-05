
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/data/models/homework.dart';
import 'package:school/app/functions/get-date.dart';
import 'package:school/app/localization/locale_controller.dart';
import 'package:school/app/modules/home/student/home_controller.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import '../../core/constants/border_radius.dart';
import '../../core/constants/routes.dart';
import '../../core/values/icons.dart';
import '../../functions/checkLanguage.dart';
import '../../functions/extention.dart';
import '../../functions/urlLauncher.dart';
import '../../widgets/youtube_video_player_widget.dart';

class HomeworkDescription extends StatelessWidget {
  final Homework homework;
  HomeworkDescription({Key? key,required this.homework}) : super(key: key);
  LocaleController localeController = Get.find();
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          TopWidget(type: "sliver", containedWidget: TopWidgetTitle(
            text:isArLang()?"${"homeworkSubject".tr} ${homeController.getSubjectName(homework.subjectId!,)}"
                :"${homeController.getSubjectName(homework.subjectId!,)} ${"homeworkSubject".tr}",
            type: 'withBackArrow',
          )),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Card(
                shape: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(cardsRadius),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0.wp,
                    vertical: 2.0.hp,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${"publishedFrom".tr}${getDate(homework.createdAt!)}",style:
                      TextStyle(color: grey),),
                      SizedBox(height: 2.0.hp,),
                      Center(child:
                      CachedNetworkImage(imageUrl: "${AppRoute.baseURLPure}${homework.image!}",
                        height: 200,fit: BoxFit.fill,width:double.infinity,
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                        errorWidget: (context, url, error) => Icon(Icons.error),)
                      ),
                      SizedBox(height: 2.0.hp,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("dueDate".tr),
                          Text(getDate2(homework.deliveryTime!))
                        ],
                      ),SizedBox(height: 2.0.hp,),
                      Text(homework.arName!,style:
                      const TextStyle(color: red,fontWeight: FontWeight.bold),),
                      Text(homework.arDescription!,textAlign: TextAlign.justify,style:
                      TextStyle(color: Color(0xFF292D32).withOpacity(.9),height: 0.2.hp),),
                      SizedBox(height: 3.0.hp,),
                      Text("attachments".tr,style:
                      TextStyle(fontWeight: FontWeight.bold,color: red,fontSize: 13.0.sp),),
                      if(Uri.parse(homework.file!).isAbsolute)
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardsRadius)),
                        child: InkWell(
                          onTap: (){
                            //print("kkkk");
                            try{
                              launchURL(homework.file!);
                            }catch(e){print(e);}
                          },borderRadius: BorderRadius.circular(cardsRadius),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(getExt(homework.file!)=="pdf"?pdfIcon:wordIcon),
                                SizedBox(height: 1.0.hp,),
                                SizedBox(width: 100,
                                    child: Text(basename(homework.file!),textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,maxLines: 2,)),
                              ],
                            ),
                          ),
                        ),),
                      SizedBox(height: 2.0.hp,),
                      if(Uri.parse(homework.video!).isAbsolute)
                        YoutubeVideoPlayer(
                          urlVideo:
                          homework.video!,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

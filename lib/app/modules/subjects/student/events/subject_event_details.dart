
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/core/values/icons.dart';
import 'package:school/app/data/models/subjectEvent.dart';
import 'package:school/app/functions/checkLanguage.dart';
import 'package:school/app/functions/get-date.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import '../../../../core/constants/border_radius.dart';
import '../../../../core/constants/height.dart';
import '../../../../functions/extention.dart';
import '../../../../functions/urlLauncher.dart';
import '../../../../widgets/youtube_video_player_widget.dart';
import '../../../download_image/view.dart';

class SubjectEventDescription extends StatelessWidget {
  SubjectEventDescription({Key? key, required this.event,}) : super(key: key);

  final SubjectEvent event;
  PageController pageController = PageController(viewportFraction:.9);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Color(0xFFF5F5F5),
        body: CustomScrollView(
          slivers: [
            TopWidget(type: "sliver", containedWidget: TopWidgetTitle(
              type: "withBackArrow",text: event.arName!,
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height:innerHomeBoxHeight,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:mainPadding,vertical: 8),
                  child: Container(
                    height: 200,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(imageUrl: event.image!,height: 200,
                            width: double.infinity,fit: BoxFit.fill,progressIndicatorBuilder: (context, url, downloadProgress) =>
                                Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Align(
                              alignment: isArLang()?Alignment.bottomLeft:Alignment.bottomRight,
                              child: DownloadImageWidget(image: event.image!)
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ),
            ),SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: mainPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(calendarIcon,color:grey,),
                            SizedBox(width: 2.0.wp,),
                            Text(isArLang()?"يوم ${DateFormat('EEEE').format(getDate4(event.deliveryTime!)).toLowerCase().tr}"//days[DateFormat('EEEE'). format(event.createdAt!)]
                                :DateFormat('EEEE').format(getDate4(event.deliveryTime!)).toLowerCase().tr,style: TextStyle(color: grey),),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(calendarIcon,color:grey,),
                            SizedBox(width: 2.0.wp,),
                            Text(event.deliveryTime!,//DateFormat('yyyy-MM-dd'). format(event.date!)
                              style: TextStyle(
                                  color: grey
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),SizedBox(height: 2.0.hp,),
                    Text(event.arDescription!,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Color(0xFF292D32)),),
                    SizedBox(height: 2.0.hp,),
                    if(Uri.parse(event.file!).isAbsolute)
                    Column(
                      children: [
                        Text("attachments".tr,style:
                        TextStyle(fontWeight: FontWeight.bold,color: red,fontSize: 13.0.sp),),
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardsRadius)),
                          child: InkWell(
                            onTap: (){
                              try{
                                launchURL(event.file!);
                              }catch(e){print(e);}

                            },borderRadius: BorderRadius.circular(cardsRadius),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(getExt(event.file!)=="pdf"?pdfIcon:getExt(event.file!)=="docx"?wordIcon:imageIcon),
                                  SizedBox(height: 1.0.hp,),
                                  SizedBox(width: 100,child: Text(basename(event.file!),textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,maxLines: 2,))
                                ],
                              ),
                            ),
                          ),),
                      ],
                    ),
                    SizedBox(height: 2.0.hp,),
                    if(Uri.parse(event.video!).isAbsolute)
                      YoutubeVideoPlayer(
                        urlVideo:
                        event.video!,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}

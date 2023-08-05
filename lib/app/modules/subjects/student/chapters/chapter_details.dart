
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:school/app/core/constants/border_radius.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/core/values/icons.dart';
import 'package:school/app/data/models/subjectChapter.dart';
import 'package:school/app/functions/extention.dart';
import 'package:school/app/functions/urlLauncher.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import '../../../../widgets/youtube_video_player_widget.dart';

class ChapterDetail extends StatelessWidget {
  final SubjectChapter chapter;
  const ChapterDetail({Key? key,required this.chapter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          TopWidget(type: "sliver", containedWidget: TopWidgetTitle(
            text: chapter.arName!,type: "withBackArrow",
          )),
         SliverToBoxAdapter(
           child: Column(
             children: [
               Padding(
                 padding: EdgeInsets.symmetric(
                   horizontal: mainPadding-10,
                   vertical: 1.0.hp,
                 ),
                 child: Card(
                   shape: OutlineInputBorder(
                     borderSide: BorderSide.none,
                     borderRadius: BorderRadius.circular(cardsRadius)
                   ),
                   child: Padding(
                     padding: EdgeInsets.symmetric(horizontal: 2.0.wp,vertical: 2.0.hp),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         if(Uri.parse(chapter.video!).isAbsolute)
                         YoutubeVideoPlayer(
                           urlVideo:
                           chapter.video!,
                         ),
                         SizedBox(height: 1.0.hp,),
                         Text(chapter.arDescription!,textAlign:TextAlign.justify,style:TextStyle(height: 2.0,)),
                         SizedBox(height: 2.0.hp,),
                         Center(child: ClipRRect(
                           borderRadius: BorderRadius.circular(cardsRadius),
                             child: CachedNetworkImage(imageUrl:chapter.image!,height: 180,width: double.infinity,fit: BoxFit.fill,))),
                         SizedBox(height: 3.0.hp,),
                         if(Uri.parse(chapter.file!).isAbsolute)
                         Column(
                           children: [
                             Text("attachments".tr,style:
                             TextStyle(fontWeight: FontWeight.bold,color: red,fontSize: 13.0.sp),),
                             Card(
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardsRadius)),
                               child: InkWell(
                                 onTap: (){
                                   //print("kkkk");
                                   try{
                                     launchURL(chapter.file!);
                                   }catch(e){print(e);}

                                 },borderRadius: BorderRadius.circular(cardsRadius),
                                 child: Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       SvgPicture.asset(getExt(chapter.file!)=="pdf"?pdfIcon:getExt(chapter.file!)=="docx"?wordIcon:imageIcon),
                                       SizedBox(height: 1.0.hp,),
                                       SizedBox(width: 100,child: Text(basename(chapter.file!),textAlign: TextAlign.center,
                                         overflow: TextOverflow.ellipsis,maxLines: 2,))
                                     ],
                                   ),
                                 ),
                               ),),
                           ],
                         )
                       ],
                     ),
                   ),
                 ),
               ),
             ],
           ),
         )
        ],
      ),
    );
  }
}

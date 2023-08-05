
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/border_radius.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/core/values/icons.dart';
import 'package:school/app/data/models/subjectChapter.dart';
import 'package:school/app/data/services/storage/services.dart';

class ChapterSummeryWidget extends StatelessWidget {
  final SubjectChapter chapter;
  final Function()? onTap;
  StorageService storageService = Get.find();
  ChapterSummeryWidget({Key? key,required this.chapter,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: mainPadding-10,vertical: 0.5.hp),
      child: Container(
        height: 13.0.hp,
        child: Card(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(cardsRadius),
            borderSide: BorderSide.none
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(cardsRadius),
            onTap: (){
              if(onTap!=null){
                onTap!();
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 4.0.wp,
                 // vertical: 1.0.hp
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(chapter.arName!,style: const TextStyle(color: red,fontWeight: FontWeight.bold),),
                      SizedBox(height:1.0.hp),
                      SizedBox(width:70.0.wp,child: Text(chapter.arDescription!,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black))),
                    ],
                  ),
                  InkWell(
                      onTap:(){
                        Get.toNamed(Get.arguments["nextRoute"],arguments: {
                          "subjectID2":Get.arguments["subjectID2"],
                          "chapterID":chapter.id,
                        });
                  },child: SvgPicture.asset(reviewIcon)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

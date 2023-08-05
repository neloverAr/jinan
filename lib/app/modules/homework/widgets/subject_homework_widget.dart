
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/border_radius.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/data/models/homework.dart';
import 'package:school/app/functions/checkLanguage.dart';
import 'package:school/app/modules/home/student/home_controller.dart';
import 'package:school/app/modules/homework/homework_description.dart';
import '../../../core/constants/routes.dart';
import '../../../core/values/colors.dart';
import '../../../functions/get-date.dart';

class HomeworkWidget extends StatelessWidget {
  Homework homework;
  HomeworkWidget({Key? key,required this.homework}) : super(key: key);
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardsRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(cardsRadius),
        onTap: (){
          //print("https://jenan.portalshub.com${homework.image!}");
          Get.to(()=>HomeworkDescription(homework: homework,));
        },         
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex:1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(imageUrl: "${AppRoute.baseURLPure}${homework.image!}",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
                //CachedNetworkImage(imageUrl:"https://jenan.portalshub.com${homework.image!}"),
              )),
              Expanded(
                  flex:3,child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${"from".tr} ${getDate(homework.createdAt!)}",style: TextStyle(
                        color:const Color(0xFF292D32).withOpacity(.5),
                      ),),
                      SizedBox(
                        width: 130,
                        child: Text("${"dueDate".tr} ${getDate2(homework.deliveryTime!)}",overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(
                          color:const Color(0xFF292D32).withOpacity(.5),
                        ),),
                      ),
                    ],
                  ),
                  SizedBox(height:1.0.hp,),
                  Expanded(
                    flex: 2,
                    child: Text(
                      isArLang()?"${"homeworkSubject".tr} ${homeController.getSubjectName(homework.subjectId!,)}"
                      :"${homeController.getSubjectName(homework.subjectId!,)} ${"homeworkSubject".tr}"
                      ,
                      style: const TextStyle(
                        color: red,
                        fontWeight: FontWeight.w700
                    ),),
                  ),//SizedBox(height:1.0.hp,),
                  Expanded(
                    flex: 2,
                    child: Text(homework.arName!,maxLines:1,overflow: TextOverflow.ellipsis,style: const TextStyle(
                        color:Colors.black)),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

}

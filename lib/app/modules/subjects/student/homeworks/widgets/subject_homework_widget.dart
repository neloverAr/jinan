
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/data/models/subjectHomework.dart';
import 'package:school/app/functions/get-date.dart';
import 'package:school/app/modules/subjects/student/homeworks/SubjectHomeworkDesc.dart';
import '../../../../../core/constants/border_radius.dart';
import '../../../../../core/values/colors.dart';

class SubjectHomeworkWidget extends StatelessWidget {
  final SubjectHomework assignment;
  const SubjectHomeworkWidget({Key? key, required this.assignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardsRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(cardsRadius),
        onTap: (){
          print(assignment.image);
          Get.to(()=>SubjectHomeworkDesc(homework: assignment,));
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex:1,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(imageUrl: assignment.image!,height: 110,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),),
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
                      Text("${"from".tr} ${getDate(assignment.createdAt!)}",style: TextStyle(
                        color:const Color(0xFF292D32).withOpacity(.5),
                      ),),
                      SizedBox(
                        width: 100,
                        //width: 30.0.wp,
                        child: Text("${"dueDate".tr} ${assignment.deliveryTime!} ",maxLines:2,overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                          color:const Color(0xFF292D32).withOpacity(.5),
                        ),),
                      ),
                    ],
                  ),SizedBox(height: 0.5.hp,),
                  Text("${assignment.arName}",style: const TextStyle(
                      color: red,
                      fontWeight: FontWeight.w700
                  ),),
                  Text("${assignment.arDescription}",maxLines:1,overflow: TextOverflow.ellipsis,style: const TextStyle(
                      color:Colors.black)),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

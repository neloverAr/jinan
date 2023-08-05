
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/modules/home/widgets/event_widget.dart';
import 'package:school/app/modules/homework/widgets/subject_homework_widget.dart';
import '../../../core/values/images_path.dart';
import '../../../widgets/icon_name_widget.dart';
import '../student/home_controller.dart';

class Section extends StatelessWidget {
  final String name;
  final String label;
  final dynamic list;
  final double height;
  final Function? seeAllOnTap;
  Section({Key? key,required this.name,required this.list,
    required this.height, this.seeAllOnTap,
    required this.label,}) : super(key: key);

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:EdgeInsets.symmetric(horizontal: mainPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,style: const TextStyle(fontWeight: FontWeight.bold),),
              if(seeAllOnTap!=null)
              InkWell(
                  onTap: (){
                    if(seeAllOnTap!=null){
                      seeAllOnTap!();
                    }
                  }, child: Text("seeAll".tr,style: TextStyle(
                  fontWeight: FontWeight.bold,color: grey),)
              ),

            ],
          ),
        ),
        SizedBox(height: 1.0.hp,),
        SizedBox(width: mainPadding,),
        SizedBox(
          height: height,
          child: list.length==0? Center(child: Text("noAvailableData".tr),)
              :ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: mainPadding),
          scrollDirection : Axis.horizontal,
          itemCount: list.length,
          separatorBuilder: (context, n)=>SizedBox(width: 3.0.wp,),
          itemBuilder: (BuildContext context, int index) {
             if(label=="subjects"){
              return SizedBox(width:160,child: IconNameWidget(name: list[index].name!,
                icon: onBoarding3,
                onTap: (){
                  Get.toNamed("/subject-details",arguments: {
                    "subjectID":list[index].id,
                  });
                },
              ));
             // SubjectWidget(subject: list[index]));
            }else if(label=="lastHomework"){
              return SizedBox(width:350,child: HomeworkWidget(homework: list[index]));
            }
            return SizedBox(width:350,child: EventWidget(event:list[index],onTap: (){
              homeController.goToDescData(list[index].id);
            },));
          },
          ),
        ),
        //SizedBox(width: mainPadding,),
      ],
    );
  }
}

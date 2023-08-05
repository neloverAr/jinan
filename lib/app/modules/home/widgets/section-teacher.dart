
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/colors.dart';
import '../../../core/values/images_path.dart';
import '../../../widgets/icon_name_widget.dart';
import '../student/honor/widgets/honor_box.dart';

class SectionTeacher extends StatelessWidget {
  final String name;
  final String label;
  final dynamic list;
  final double height;
  final Function? seeAllOnTap;
  SectionTeacher({Key? key,required this.name,required this.list,
    required this.height, this.seeAllOnTap,
    required this.label,}) : super(key: key);

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
              if(label=="teacherHonorBoard"){
                return SizedBox(width:160,child: HonorBox(board: list[index],radius: 35.0));
              }else if(label=="teacherSubjects"){
                return SizedBox(width:160,child: IconNameWidget(name: list[index].arName!,
                  icon: onBoarding3,
                  onTap: (){
                    Get.toNamed("/teacher-subject-details",arguments: {
                      "subjectID":list[index].subjectId,
                      "subjectArabicName":list[index].arName,
                      "subjectEnglishName":list[index].enName,
                    });
                  },
                ));
                // SubjectWidget(subject: list[index]));
              };
            },
          ),
        ),
        //SizedBox(width: mainPadding,),
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/border_radius.dart';
import 'package:school/app/core/values/icons.dart';
import 'package:school/app/data/models/honory_board.dart';
import 'package:school/app/widgets/student_avatar.dart';
import '../../../../../core/utils/keys.dart';
import '../../../../../data/services/storage/services.dart';

class HonorBox extends StatelessWidget {
  final radius;
  final HonoraryBoard board;
  StorageService storageService = Get.find();
  HonorBox({Key? key,this.radius,required this.board}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = this.radius??53.0;
    return Card(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(cardsRadius),
        borderSide: BorderSide.none,
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: storageService.read(langKey)=="ar"?21.0:0,
                    left: storageService.read(langKey)=="en"?21.0:0,
                    //top: 17.0,

                ),
                child: SvgPicture.asset(starIcon),
              ),
            ],
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StudentAvatar(avatar: "assets/images/medal.png",radius: radius,),
                //Avatar(image: ""),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text("${board.studentName}",maxLines: 1,overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize:14),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

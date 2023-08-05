
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/colors.dart';
import '../core/constants/border_radius.dart';

class TypeCard extends StatelessWidget {
  final Function() onTap;
  final Function() onDoubleTap;
  final String cardName;
  final String cardIcon;
  final bool isSelected;
  const TypeCard({Key? key,required this.onTap,required this.onDoubleTap,required this.cardName,required this.cardIcon,required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardsRadius), //<-- SEE HERE
        ),
        color: isSelected?red:Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(cardsRadius),
          onTap: (){
            onTap();
          },
          onDoubleTap: (){
            onDoubleTap();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(cardIcon,
                color: isSelected?Colors.white:Colors.black),
              SizedBox(height: 2.0.hp),
              Text(cardName,style: TextStyle(
                //fontSize: 14.0.sp,
                color: isSelected?Colors.white:const Color(0xFF292D32),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}

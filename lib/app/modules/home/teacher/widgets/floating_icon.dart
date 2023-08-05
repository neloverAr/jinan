import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school/app/core/utils/extensions.dart';

class FloatingIcons extends StatelessWidget {
  final String icon;
  final String text;
  final Function()? onPressed;
  final double size;
  const FloatingIcons({Key? key,required this.text,required this.icon,required this.onPressed,required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        heroTag: text,
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(icon,height: 20,width: 20,),
            SizedBox(height: 1.0.hp,),
            Text(text,textAlign:TextAlign.center,style: const TextStyle(color: Colors.black,fontSize: 8.0),),
          ],
        ),
      ),
    );
  }
}
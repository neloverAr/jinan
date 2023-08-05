

import 'package:flutter/material.dart';
import 'package:school/app/modules/Auth/widgets/auth_button.dart';

class BottomWidget extends StatelessWidget {
  final text;
  void Function()? onPressed;
   BottomWidget({Key? key,required this.text,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 26.0),
            child: Align(
              alignment: Alignment.bottomCenter,
                child: Container(color:Colors.white,
                    child: Image.asset("assets/images/img.png",height:158 ,width: double.infinity ,fit: BoxFit.fill,))),
          ),
          Positioned(
              left:24,
              right:24,
              child: AuthButton(text: text,onPressed: onPressed,)),
        ],
      ),
    );
  }
}

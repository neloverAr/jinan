
import 'package:flutter/material.dart';

import '../../../core/values/colors.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const AuthButton({Key? key,required this.text, this.onPressed}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return ElevatedButton(
       onPressed: onPressed,
       style: ElevatedButton.styleFrom(
         backgroundColor:red ,
         shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(7.0)),
         minimumSize: Size(double.infinity, 52), //////// HERE
       ),
       child: Text(text),
     );
   }
 }

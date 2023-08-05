
import 'package:flutter/material.dart';
import 'package:school/app/core/utils/extensions.dart';

import '../../../core/constants/border_radius.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  String? Function(String?)? validator;
  final TextInputType? textInputType;
  bool obscure=false;
  final Function onTap;

   AuthTextField({Key? key,required this.hintText,
     required this.labelText,required this.controller,
     this.validator,this.textInputType,bool? obscureText, required this.onTap
   }) {
     obscure = obscureText??false;
   } //:super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText,style: TextStyle(
          fontSize: 12.0.sp,
        ),),
        SizedBox(height: 17.0,),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType:textInputType ,
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hintText,
            border:  OutlineInputBorder(
              borderRadius:  BorderRadius.circular(textFieldRadius),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xEEEEEEEE),
              ),
            ),
            suffixIcon: InkWell(
                onTap: (){
                  onTap();
                },
                child: Icon(Icons.remove_red_eye_outlined)),

          ),
        ),

      ],
    );
  }
}

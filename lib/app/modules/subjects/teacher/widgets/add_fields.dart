
import 'package:flutter/material.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/colors.dart';

import '../../../../core/constants/border_radius.dart';

class AddFieldsWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  String? Function(String?)? validator;
  final int maxLines;
  AddFieldsWidget({Key? key,required this.hintText,
    required this.labelText,required this.controller,
    required this.maxLines,this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText,style: TextStyle(
          fontSize: 12.0.sp,
          color: Colors.black
        ),),
        const SizedBox(height: 17.0,),
        TextFormField(
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color:grey),
              fillColor: const Color(0xFFFBFBFB),
              filled: true,
              border:  OutlineInputBorder(
                borderRadius:  BorderRadius.circular(textFieldRadius),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xEEEEEEEE),
                ),
              )
          ),

        ),

      ],
    );
  }
}

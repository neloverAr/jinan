
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/icons.dart';

import '../../../core/constants/border_radius.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController controller;
  String? Function(String?)? validator;
  PhoneField({Key? key,required this.controller,this.validator}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
      Text("phoneNumber".tr,style: TextStyle(
        fontSize: 12.0.sp,
      ),),
      SizedBox(height: 15.0,),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: TextInputType.number,
          autofocus: true,
          decoration: InputDecoration(
            hintText: "000-000-000",
            hintStyle: TextStyle(
              color:Color(0xEE333333).withOpacity(.5),
              fontFamily: 'roboto',
              fontSize: 12.0.sp,
            ),
            border:  OutlineInputBorder(
              borderRadius:  BorderRadius.circular(textFieldRadius),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xEEEEEEEE),
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 0),
              child: SvgPicture.asset(flag),
            ),
          ),
        ),
      ]
    );
  }
}

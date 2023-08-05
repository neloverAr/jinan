
import 'package:flutter/material.dart';

import '../../../../core/constants/border_radius.dart';

class CodeField extends StatelessWidget {
  final controller;
  bool autoFocus=false ;
  Function(String)? onChanged;
   CodeField({Key? key,required this.controller,bool? autoFocuses,required this.onChanged}){
    autoFocus = autoFocuses??false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        maxLength: 1,
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType:TextInputType.number,
        decoration: InputDecoration(
            counterText: '',
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(textFieldRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xEEEEEEEE),
            ),
          ),
        ),
      ),
    );
  }
}

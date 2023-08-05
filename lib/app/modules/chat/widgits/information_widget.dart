import 'package:flutter/material.dart';
import '../../../core/constants/border_radius.dart';

class InformationWidget extends StatelessWidget {
  final TextEditingController controller;
  int? maxLines;
  String? hintText;
  InformationWidget({
    super.key, required this.controller,this.maxLines,this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardsRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          maxLines: maxLines??1,
          decoration:  InputDecoration(
            hintText: hintText??"",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintStyle: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
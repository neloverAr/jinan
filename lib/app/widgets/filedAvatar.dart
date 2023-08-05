import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../core/values/images_path.dart';

class FiledAvatar extends StatelessWidget {
  const FiledAvatar({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 50,
        child: SizedBox(
            width: 94,
            height: 94,
            child: ClipOval(
              child: Image.file(File(image),fit: BoxFit.fill,)
            )
        ));
  }
}

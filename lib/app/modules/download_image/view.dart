import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/modules/download_image/controller.dart';
import 'dart:io' show Platform;
import '../../core/class/status_request.dart';
import 'package:flutter/cupertino.dart';

import '../../core/values/colors.dart';

class DownloadImageWidget extends StatelessWidget {
  DownloadImageWidget({Key? key, required this.image}) : super(key: key);
  DownloadImageController downloadImageController = Get.put(DownloadImageController());
  final String image;
  @override
  Widget build(BuildContext context) {
    return GetX<DownloadImageController>(
        builder: (controller){
          return InkWell(
              onTap: (){
                controller.downloadImage(image);
              }, child:(controller.downloadStatusRequest.value==StatusRequest.loading)?
          (Platform.isAndroid?const CircularProgressIndicator():
          const CupertinoActivityIndicator())
              :const CircleAvatar(backgroundColor: red,
            child: Icon(Icons.arrow_downward,color: Colors.white,),)
          );
        });
  }
}

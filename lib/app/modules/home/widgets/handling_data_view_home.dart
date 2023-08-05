
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school/app/core/class/status_request.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:shimmer/shimmer.dart';

import 'shimmer_section.dart';

class HandlingDataViewHome extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataViewHome({Key? key, required this.statusRequest, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      statusRequest == StatusRequest.loading?
     Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(.3),
        highlightColor: Colors.white,
        direction: ShimmerDirection.rtl,
        child: Column(
          children: [
            const ShimmerSection(),
            SizedBox(height: 3.0.hp,),
            const ShimmerSection(),
            SizedBox(height: 3.0.hp,),
            const ShimmerSection(),
          ],
        )
    ):
      statusRequest == StatusRequest.offlineFailure?
      const Center(child: Icon(Icons.wifi_off,size: 90,),):
      statusRequest == StatusRequest.serverFailure?
      const Center(child:  Text("Server Failure"),):
      statusRequest == StatusRequest.failure?
      const Center(child: Text("No Data"),)
          : widget;
  }
}

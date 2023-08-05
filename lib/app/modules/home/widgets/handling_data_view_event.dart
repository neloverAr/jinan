
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/class/status_request.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:shimmer/shimmer.dart';
import 'shimmer_section2.dart';

class HandlingDataViewEvent extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataViewEvent({Key? key, required this.statusRequest, required this.widget}) : super(key: key);

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
              const ShimmerSection2(),
              SizedBox(height: 3.0.hp,),
              const ShimmerSection2(),
              SizedBox(height: 3.0.hp,),
              const ShimmerSection2(),
            ],
          )
      ):
      statusRequest == StatusRequest.offlineFailure?
      const Center(child: Icon(Icons.wifi_off,size: 90,),):
      statusRequest == StatusRequest.serverFailure?
      const Center(child:  Text("Server Failure"),):
      statusRequest == StatusRequest.failure?
      Center(child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Text("noAvailableData".tr),
      ),)
          : widget;
  }
}

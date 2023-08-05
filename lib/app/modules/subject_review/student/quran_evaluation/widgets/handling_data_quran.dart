import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/class/status_request.dart';
import '../../../../../core/constants/border_radius.dart';

class HandlingDataViewQuran extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataViewQuran({Key? key, required this.statusRequest, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      statusRequest == StatusRequest.loading?
      Center(child: Platform.isAndroid?const CircularProgressIndicator():
      const CupertinoActivityIndicator()
        ,):
      statusRequest == StatusRequest.offlineFailure?
      const Center(child: Icon(Icons.wifi_off,size: 90,),):
      statusRequest == StatusRequest.serverFailure?
      const Center(child:  Padding(
        padding: EdgeInsets.all(30.0),
        child: Text("Server Failure"),
      ),):
      statusRequest == StatusRequest.failure?
      Center(child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardsRadius)),
            child: Center(child: Text("noAvailableData".tr))),
      ),)
          : widget;
  }
}
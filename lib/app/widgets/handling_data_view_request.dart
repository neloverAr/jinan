
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school/app/core/class/status_request.dart';

class HandlingDataViewRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataViewRequest({Key? key, required this.statusRequest, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      statusRequest == StatusRequest.loading?
      Center(child: Platform.isAndroid?const CircularProgressIndicator():
      const CupertinoActivityIndicator()
        ,):
      statusRequest == StatusRequest.offlineFailure?
      const Center(child: Icon(Icons.wifi_off,size: 40,),):
      statusRequest == StatusRequest.serverFailure?
      const Center(child: Text("Server Failure"),):
     widget;
  }
}

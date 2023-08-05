
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
    Center(child: Platform.isAndroid?const CircularProgressIndicator():
    const CupertinoActivityIndicator());
}

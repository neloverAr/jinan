import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed("/onBoarding-screen");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
         image: DecorationImage(
           image: AssetImage(
             'assets/images/img.png',
           ),repeat: ImageRepeat.repeat,
         )
        ),
       child:Center(
           child:Image.asset(
             'assets/images/logo.png',
             height: 109,
             width: 176,
           ),
       ),
      ),
    );
  }
}

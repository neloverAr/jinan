
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/modules/Auth/login/view.dart';
import '../core/utils/keys.dart';
import '../data/services/storage/services.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final count = 3;
  int value = 0;
  PageController _pageController = PageController();
  StorageService storageService = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final radius = 79.0;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
        Container(
        height:Get.height*0.45,
          decoration: BoxDecoration(
            color: red,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(radius),
                bottomLeft: Radius.circular(radius)),
          ),),
            Container(
              height:Get.height*0.45 - radius,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/img.png',
                    ),repeat: ImageRepeat.repeat,
                  )
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 15.0.wp,left: 10.0.wp,right: 10.0.wp),
                child: Align(
                  alignment: storageService.read(langKey)=="ar"?Alignment.topLeft:Alignment.topRight,
                  child: TextButton(
                    child: Text("skip".tr,style: const TextStyle(
                      color: Colors.white,
                    ),),
                    onPressed: (){
                      storageService.write("step", "1");
                      Get.off(() => LoginScreen());
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding:EdgeInsets.only(top: Get.height*.45 - radius),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height:350,
                    //width: double.infinity,
                    child: PageView(
                      //reverse: true,
                      controller: _pageController,
                      onPageChanged: (index){
                        setState(() {
                          value=index;
                        });
                      },
                    children:[
                      OnBoardingWidget(s1: "onBoarding1Text".tr,image: "assets/images/onboarding1.png",),
                      OnBoardingWidget(s1: "onBoarding2Text".tr,image: "assets/images/onboarding2.png",),
                      OnBoardingWidget(s1: "onBoarding3Text".tr,image: "assets/images/onboarding3.png",),
                      ]
                    ),
                  ),
                  //const SizedBox(height: 0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NavigationPoint(pageController:_pageController,value:value,itemCount: 0,),
                      NavigationPoint(pageController:_pageController,value:value,itemCount: 1,),
                      NavigationPoint(pageController:_pageController,value:value,itemCount: 2,),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26.0),
              child: Align(
                  //top: Get.height - 130.0,
                alignment: Alignment.bottomCenter,
                  child: Image.asset("assets/images/img.png",height: 158,width: double.infinity,fit: BoxFit.fill,)),
            ),
          ],//422
        ),
      ),
    );
  }
}

class NavigationPoint extends StatelessWidget {
  const NavigationPoint({
    required this.itemCount,
    required this.value,
    required this.pageController,
    Key? key,
  }) : super(key: key);

  final int itemCount;
  final int value;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: (){
      pageController.animateToPage(
        itemCount,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      },
          child: Container(
            width: 10,
            height: 10,
            //margin:const EdgeInsets.all(100.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border:Border.all(
                color: Colors.transparent,
              ),
              color:value==itemCount?red:Color(0xFFBEBEBE).withOpacity(0.2),
            ),
          ),
        ),
        const SizedBox(width: 11,),
      ],
    );
  }
}

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    Key? key,
    required this.s1,
    required this.image,
  }) : super(key: key);

  final String s1;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(image,height: 170,width: 166,),
        // FittedBox(
        //   child:
        //   fit: BoxFit.fitWidth,
        // ),
        SizedBox(height: 100.0,),
        SizedBox(
          width:300,
          //height: 100,
          child: Align(
            alignment:Alignment.center,
            child: Text(s1,textAlign: TextAlign.center,
              maxLines: 2,overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20.0,),)

            // FittedBox(
            // fit: BoxFit.fitWidth,
            // child: )
          ),
        ),
      ],
    );
  }
}

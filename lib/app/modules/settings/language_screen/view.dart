
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/utils/keys.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/localization/locale_controller.dart';
import 'package:school/app/modules/splash_screen.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';
import '../../../core/constants/border_radius.dart';
import '../../../core/constants/height.dart';
import '../../../core/constants/padding.dart';
import '../../../data/services/storage/services.dart';

class LanguageScreen extends StatelessWidget {
   LanguageScreen({Key? key}) : super(key: key);
   LocaleController localeController = Get.find();
   StorageService storageService = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children:  [
           TopWidget(type: "fixed", containedWidget: TopWidgetTitle(
              text: "appLanguage".tr, type: "withBackArrow")),
          Positioned(
              top: upperWidgetHeight - upperWidgetRadius+5,
              left: mainPadding,
              right: mainPadding,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(cardsRadius),
                  color: Colors.white
                ),
                height: 18.0.hp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LanguageWidget(
                      selected:storageService.read(langKey)=="ar"?true:false,
                      onTap: (){localeController.changeLanguage("ar");},
                      text: 'langArabic',
                      langKey: storageService.read(langKey),
                      firstChild: true,
                    ),
                    //const CustomDivider(),
                    LanguageWidget(
                      selected:storageService.read(langKey)=="en"?true:false,
                      onTap: (){localeController.changeLanguage("en");},
                      text: 'langEnglish',
                      langKey: storageService.read(langKey),
                      firstChild: false,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class LanguageWidget extends StatelessWidget {
   const LanguageWidget({
    super.key,
    required this.onTap,
    required this.text,
    required this.selected,
     required this.langKey,
     required this.firstChild,
  });

  final Function() onTap;
  final String text;
  final bool selected;
  final String langKey;
  final bool firstChild;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 50,
        alignment: langKey=="ar"?Alignment.centerRight:Alignment.centerLeft,
      decoration:  BoxDecoration(
        border: Border(
          bottom: BorderSide(
             color: firstChild?const Color(0xFFF6F6F6):Colors.transparent
          )
        )
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20),
          minimumSize: const Size(double.infinity,double.infinity),
          padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 0),
        ),
        onPressed: () {
          if(!selected){
            onTap();
          Get.offAll(const SplashScreen());
          }
        },
        child: Row(
          children: [
            if(selected)
            const SizedBox(height:25,child: VerticalDivider(width: 3,thickness:3,color: red,)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(text.tr,style:
              TextStyle(
                color: selected?red:Colors.black,
                fontSize: 12.0.sp,
              fontWeight: selected?FontWeight.bold:FontWeight.w300,
              fontFamily:langKey=="ar"?"ExpoArabic":"Roboto"),),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

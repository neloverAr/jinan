import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school/app/localization/translation.dart';
import 'package:school/app/routes/pages_routes.dart';
import 'app/core/utils/extensions.dart';
import 'app/core/utils/keys.dart';
import 'app/localization/locale_controller.dart';
import 'package:school/app/data/services/storage/services.dart';
import 'package:flutter/services.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  //NotificationController notificationController = Get.put(NotificationController());
  //notificationController.calculateUnReadController();
  print("Handling a background message: ${message.messageId}");
}


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

void main() async{
  debugPaintSizeEnabled = false;
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await GetStorage.init();
  await initialServices();

  await FirebaseMessaging.instance
      .setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    StorageService storageService = Get.find();
    LocaleController localeController = Get.put(LocaleController());
    //Get.put(NotificationController());
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: storageService.read(langKey)=="ar"?"ExpoArabic":"Roboto",
        textTheme:  TextTheme(
          headline1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0.sp,
            color: Colors.black
          ),
        )
      ),
      translations: MyTranslation(),
      getPages: routes,
      title: 'Flutter Demo',
      localizationsDelegates: const[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
        supportedLocales:const [
          Locale('ar', 'AE'),
          Locale('en', ''),
        ],
        locale: localeController.language,
      //home: const SplashScreen(),
    );
  }
}

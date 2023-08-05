import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:school/app/modules/chat/chat_messages/controller.dart';
import 'package:school/app/modules/home/student/home_controller.dart';
import 'package:school/app/modules/home/teacher/controller.dart';
import 'package:school/app/modules/notifications/controller.dart';
import 'package:school/app/modules/subjects/student/controller.dart';
import 'package:school/app/modules/table/controller.dart';
import '../modules/chat/controller.dart';
import '../modules/settings/student/controller.dart';
import '../notifications/local_notification_services.dart';

requestPermissionNotification() async{
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmconfig(){
  FirebaseMessaging.onMessage.listen((message) async {
    print("=============Notification=============");
    print(message.notification!.title);
    print(message.notification!.body);
    refreshPageNotification(message.data);
    NotificationController notificationController = Get.find();
    notificationController.getData();
    notificationController.calculateUnReadController();

    final localNotificationService = LocalNotificationServices();
    await localNotificationService.setup();

    RemoteNotification notification = message.notification!;

    localNotificationService.showNotification(id: notification.hashCode,
      title: notification.title!, body: notification.body!);

    // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
    // const AndroidNotificationChannel channel = AndroidNotificationChannel(
    //     'high_importance_channel', // id
    //     'High Importance Notifications', // title
    //     //description: 'This channel is used for important notifications.', // description
    //     importance: Importance.high,
    //     playSound: true);
  //
  //   if (notification != null && android != null) {
  //     flutterLocalNotificationsPlugin.show(
  //       notification.hashCode,
  //       notification.title,
  //       notification.body,
  //         NotificationDetails(
  //             android: AndroidNotificationDetails(
  //               channel.id,
  //               channel.name,
  //               //channel.description,
  //               //color: red,
  //               playSound: true,
  //               icon: '@mipmap/ic_launcher'
  //             )
  //         )
  //     );// AndroidNotificationDetails
  // }
  });

  //////

  // Future<void> setup() async {
  //   const androidInitializationSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
  //   const iosInitializationSetting = DarwinInitializationSettings();
  //   const initSettings = InitializationSettings(android: androidSetting, iOS: iosSetting);
  //   await flutterLocalNotificationsPlugin.initialize(initSettings);
  // }
}

 refreshPageNotification(data) {
   print("======================================= page id");
  print(data["pageid"]);
   print("======================================= page name");
  print(data["pagename"]);
   print("======================================= page current route");
   print(Get.currentRoute);
   if(Get.currentRoute=="/NotificationScreen"){
     NotificationController notificationController = Get.find();
     notificationController.refreshData();
   }else if(Get.currentRoute=="/home-screen" ){
     HomeController homeController = Get.find();
     homeController.refreshData();
   }else if(Get.currentRoute=="/TeacherHomeScreen" ){
     HomeTeacherController homeTeacherController = Get.find();
     homeTeacherController.refreshData();
   }else if(Get.currentRoute =="/student-subjects-screen"){
     StudentSubjectController studentSubjectController = Get.find();
     studentSubjectController.refreshData();
   }else if(Get.currentRoute=="/chat-screen"){
     ChatController chatController = Get.find();
     chatController.refreshData();
   }else if(Get.currentRoute=="/table-screen"){
     TableController tableController = Get.find();
     tableController.refreshData();
   }else if(Get.currentRoute=="/settings-screen"){
     SettingsController settingsController = Get.find();
     settingsController.refreshData();
   }else if(Get.currentRoute=="/chat-messages-screen"){
     ChatMessagesController chatMessagesController = Get.find();
     chatMessagesController.getData(Get.arguments["chatID"]);
   }
}


import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationServices {

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> setup() async {
    const androidInitializationSetting = AndroidInitializationSettings(
        '@mipmap/ic_launcher');

    const iosInitializationSetting = DarwinInitializationSettings();

    // iosInitializationSettings = DarwinInitializationSettings(
    //     // requestAlertPermission: true,
    //     // requestBadgePermission: true,
    //     // requestSoundPermission: true,
    //     // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    // );
    const initSettings = InitializationSettings(android: androidInitializationSetting,
        iOS: iosInitializationSetting);
    await _localNotificationService.initialize(initSettings);

  }

  Future<NotificationDetails> _notificationDetails() async{
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        channelDescription: 'This channel is used for important notifications.', // description
        importance: Importance.high,
        playSound: true);

    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails();

    return const NotificationDetails(android:androidNotificationDetails,
        iOS: darwinNotificationDetails );
  }

  Future<void> showNotification({required int id,required String title,
    required String body}) async {
    final details = await _notificationDetails();
    await _localNotificationService.show(id,title,body,details);
}

  void onDidReceiveLocalNotification(int id, String? title, String? body,
      String? payload) {
    print('id $id');
  }

}
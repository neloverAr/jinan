import UIKit
import Flutter
import Firebase
import FirebaseCore
import FirebaseMessaging
import UserNotifications

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)

    UNUserNotificationCenter.current()
      .requestAuthorization(
        options: [.alert, .sound, .badge]) { [weak self] granted, _ in
        print("Permission granted: \(granted)")
        guard granted else { return }
        self?.getNotificationSettings()
      }

      if #available(iOS 10.0, *) {
             UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
           }
      
    return super.application(application, didFinishLaunchingWithOptions:
    launchOptions)

       
    }


    func getNotificationSettings() {
      UNUserNotificationCenter.current().getNotificationSettings { settings in
        print("Notification settings: \(settings)")
        guard settings.authorizationStatus == .authorized else { return }
        DispatchQueue.main.async {
          UIApplication.shared.registerForRemoteNotifications()
        }

      }
    }


    func registerForPushNotifications() {
      //1
      UNUserNotificationCenter.current()
        //2
        .requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
          //3
          print("Permission granted: \(granted)")
        }
    }

    override func application(
      _ application: UIApplication,
      didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
      let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
      let token = tokenParts.joined()
      print("Device Token: \(token)")
    }

    override func application(
      _ application: UIApplication,
      didFailToRegisterForRemoteNotificationsWithError error: Error
    ) {
      print("Failed to register: \(error)")
    }




}

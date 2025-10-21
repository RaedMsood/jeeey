import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:jeeey/firebase_options.dart';

import '../auth/auth.dart';
import 'notification_service.dart';

class PushNotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  static PushNotificationService? _instance;

  factory PushNotificationService() {
    _instance ??= PushNotificationService._();

    return _instance!;
  }

  PushNotificationService._();

  static Future<void> init() async {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
    }
    await PushNotificationService()._init();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _init() async {
    await setupInteractedMessage();
  }

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    String? fcmToken = await getToken();

    if (fcmToken != null) {
      Auth().updateFCMTokenIfNeeded(fcmToken);
    }

    // this update refresh token FCM
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) async {
      await Auth().updateFCMTokenIfNeeded(fcmToken);
    });

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      sound: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
    );

    if (initialMessage != null) {}
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('User granted provisional permission');
    } else {
      log('User declined or has not accepted permission');
    }

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    await registerNotificationListeners();
  }

  Future<String?> getToken() async {
    try {
      return await FirebaseMessaging.instance.getToken();
    } catch (ex) {
      return null;
    }
  }

  registerNotificationListeners() async {
    // this listen Notification message [notification or data]
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log("${message.notification!.title}", name: "RemoteMessage");
      // WingsNotification().createNotificationChat(message.data);
    });
  }

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call initializeApp before using other Firebase services.
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
    }
    // await WingsNotification.init();
    // await WingsNotification().createNotificationChat(message.data);
  }
}

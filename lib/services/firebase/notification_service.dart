// import 'dart:math';
//
// import 'package:awesome_notifications/awesome_notifications.dart' as awesome;
//
// import '../../core/theme/app_colors.dart';
// import '../../features/notifications/data/model/notification_model.dart';
//
// class WingsNotification {
//   static WingsNotification? _instance;
//
//   factory WingsNotification() {
//     _instance ??= WingsNotification._();
//
//     return _instance!;
//   }
//
//   WingsNotification._();
//
//   static Future<void> init() async {
//     _instance = WingsNotification();
//
//     await WingsNotification()._init();
//   }
//
//   Future<void> _init() async {
//     awesome.AwesomeNotifications().initialize(
//       // set the icon to null if you want to use the default app icon
//       // 'resource://drawable/ic_launcher',
//       'resource://drawable/notification_icon',
//       // null,
//       [
//         awesome.NotificationChannel(
//           channelKey: 'high_importance_channel',
//           channelName: 'High Importance Notifications',
//           channelDescription:
//               'This channel is used for important notifications',
//           importance: awesome.NotificationImportance.Max,
//           playSound: true,
//           criticalAlerts: true,
//           defaultColor: AppColors.primaryColor,
//           ledColor: AppColors.greySwatch.shade600,
//           channelShowBadge: true,
//           onlyAlertOnce: true,
//           groupKey: "1",
//           icon: 'resource://drawable/notification_icon',
//         ),
//       ],
//
//       debug: true,
//     );
//   }
//
//   static Future<void> clear() async {
//     awesome.AwesomeNotifications().dispose();
//     awesome.AwesomeNotifications().cancelAll();
//   }
//
//   /// Use this method to detect when a new notification or a schedule is created
//
//   bool listening = false;
//
//   Future<void> createNotificationChat(Map<String, dynamic> message) async {
//     final data = NotificationModel.fromJson(message);
//
//     await awesome.AwesomeNotifications().createNotification(
//       content: awesome.NotificationContent(
//         id: createUniqueID(),
//         // -1 is replaced by a random number
//         channelKey: 'high_importance_channel',
//
//         criticalAlert: true,
//         title: data.title,
//         body: data.content,
//         groupKey: "1",
//         displayOnBackground: true,
//         displayOnForeground: true,
//         wakeUpScreen: true,
//         notificationLayout: awesome.NotificationLayout.Default,
//         payload: data.toShowNotification(),
//       ),
//     );
//
//     _onEventReceived(data);
//   }
//
//   int createUniqueID({int maxValue = 9999}) {
//     Random random = Random();
//     return random.nextInt(maxValue);
//   }
//
// void _onEventReceived(NotificationModel model) {}
// }

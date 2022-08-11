// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// FirebaseMessaging messaging = FirebaseMessaging.instance;
// FlutterLocalNotificationsPlugin? fltNotification;
//
// class Demo extends StatefulWidget {
//   @override
//   _DemoState createState() => _DemoState();
// }
// class _DemoState extends State<Demo> {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   FlutterLocalNotificationsPlugin? fltNotification;
//
//   void pushFCMtoken() async {
//     String? token = await messaging.getToken();
//     print(token);
// //you will get token here in the console
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     pushFCMtoken();
//     initMessaging();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(child: Text("Flutter Push Notifiction"),),);
//   }
//
//
//   void initMessaging() {
//
//     var androiInit = AndroidInitializationSettings('@mipmap/ic_launcher'); //for logo
//     var iosInit = IOSInitializationSettings();
//     var initSetting = InitializationSettings(android: androiInit, iOS: iosInit);
//     fltNotification = FlutterLocalNotificationsPlugin();
//     fltNotification?.initialize(initSetting);
//     var androidDetails = AndroidNotificationDetails('1', 'channelName');
//     var iosDetails = IOSNotificationDetails();
//     var generalNotificationDetails =
//     NotificationDetails(android: androidDetails, iOS: iosDetails);
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null) {
//         fltNotification?.show(
//             notification.hashCode, notification.title, notification.
//         body, generalNotificationDetails);
//       }
//     });
//   }
// }
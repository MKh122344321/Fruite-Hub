// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print("Handling background message: ${message.messageId}");
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final FirebaseMessaging _messaging = FirebaseMessaging.instance;

//   @override
//   void initState() {
//     super.initState();
//     requestPermission();
//     listenToMessages();
//   }

//   void requestPermission() async {
//     NotificationSettings settings = await _messaging.requestPermission();
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print('User granted permission');
//     } else {
//       print('User declined or has not accepted permission');
//     }
//   }

//   void listenToMessages() {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Got a message while in the foreground!');
//       print('Message data: ${message.data}');
//       if (message.notification != null) {
//         print('Message also contained a notification: ${message.notification}');
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Push Notification Demo')),
//         body: Center(child: Text('Listening for notifications...')),
//       ),
//     );
//   }
// }

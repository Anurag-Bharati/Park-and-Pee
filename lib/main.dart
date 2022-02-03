// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parkandpee/aboutus.dart';
import 'package:parkandpee/account.dart';

import 'package:parkandpee/account_change_phone_pass.dart';

import 'package:parkandpee/login.dart';

import 'package:parkandpee/navbar.dart';
import 'package:parkandpee/property.dart';
import 'package:parkandpee/register.dart';
import 'package:parkandpee/service_owner/so_navbar.dart';

import 'package:parkandpee/verification.dart';
import 'package:parkandpee/forgetpassword.dart';
import 'package:parkandpee/newpassword.dart';
import 'package:parkandpee/account_edit.dart';
import 'admin.dart';

///Receive message when app is in background solution for on message
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Park And Pee',
      debugShowCheckedModeBanner: false,
      home: const MyLogin(),

      routes: {
        'register': (context) => const MyRegister(),
        'login': (context) => const MyLogin(),
        'verification': (context) => const MyVerification(""),
        'navbar': (context) => const Mynavbar(),
        'aboutus': (context) => const Aboutus(),
        'forgetpassword': (context) => const MyForgetPassword(),
        'newpassword': (context) => const MyNewPassword(),
        'account': (context) => const MyAccountPage(),
        'account_edit': (context) => const MyAccountPageEdit(),
        'admin': (context) => const Myadmin(),
        'property': (context) => const MyPropertyPage(),
        'account_change_phone_pass': (context) => const MyAccountPageChange(),
        'so_navbar': (context) => const MySoNavbar()
      },
    );
  }
}

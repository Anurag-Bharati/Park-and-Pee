import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parkandpee/aboutus.dart';
import 'package:parkandpee/account.dart';
import 'package:parkandpee/account_change_phone_pass.dart';
import 'package:parkandpee/account_verification.dart';
import 'package:parkandpee/login.dart';
import 'package:parkandpee/navbar.dart';
import 'package:parkandpee/property.dart';
import 'package:parkandpee/register.dart';
import 'package:parkandpee/service_owner/so_navbar.dart';
import 'package:parkandpee/verification.dart';
import 'package:parkandpee/forgetpassword.dart';
import 'package:parkandpee/newpassword.dart';
import 'package:parkandpee/account_edit.dart';
import 'account_change_phone_pass.dart';
import 'admin.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // theme: ThemeData(fontFamily: 'Poppins-Bold.ttf'),
    // home: const MyLogin(),
    // home:  const Mynavbar(),
    // home: const MyAccountPage(),
    // home: const MyVerification()
    // home: const Myadmin(),

    // home: const MyAccountPageChange(),

    home: const MySoNavbar(),

    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => const MyLogin(),
      'verification': (context) => const MyVerification(" "),
      'navbar': (context) => const Mynavbar(),
      'aboutus': (context) => const Aboutus(),
      'forgetpassword': (context) => const MyForgetPassword(),
      'newpassword': (context) => const MyNewPassword(),
      'account': (context) => const MyAccountPage(),
      'account_edit': (context) => const MyAccountPageEdit(),
      'admin': (context) => const Myadmin(),
      'property': (context) => const MyProperyPage(),
      'account_change_phone_pass': (context) => const MyAccountPageChange()
      'so_navbar':(context) => const MySoNavbar()

      //  'verification':(context)=> Verification(),
    },
  ));
}

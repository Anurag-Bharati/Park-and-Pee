import 'package:flutter/material.dart';
import 'package:parkandpee/aboutus.dart';
import 'package:parkandpee/account.dart';
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

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // theme: ThemeData(fontFamily: 'Poppins-Bold.ttf'),
    // home: const MyLogin(),
    // home: const MyLogin(),
    // home: const MyVerification()
    // home: const Myadmin(),
    home: const Mynavbar(),
    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => const MyLogin(),
      'verification': (context) => const MyVerification(),
      'navbar': (context) => const Mynavbar(),
      'aboutus': (context) => const Aboutus(),
      'forgetpassword': (context) => const MyForgetPassword(),
      'newpassword': (context) => const MyNewPassword(),
      'account': (context) => const MyAccountPage(),
      'account_edit': (context) => const MyAccountPageEdit(),
      'admin': (context) => const Myadmin(),
      'property': (context) => const MyProperyPage(),
      'so_navbar':(context) => const MySoNavbar()

      //  'verification':(context)=> Verification(),
    },
  ));
}

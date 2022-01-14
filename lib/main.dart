import 'package:flutter/material.dart';
import 'package:parkandpee/aboutus.dart';
import 'package:parkandpee/account.dart';
import 'package:parkandpee/login.dart';
import 'package:parkandpee/navbar.dart';
import 'package:parkandpee/register.dart';
import 'package:parkandpee/verification.dart';
import 'package:parkandpee/forgetpassword.dart';
import 'package:parkandpee/newpassword.dart';
import 'account_edit.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Poppins-Bold.ttf'),
    // home: const MyLogin(),
    home: const MyLogin(),
    // home: const MyVerification()
    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => const MyLogin(),
      'verification': (context) => const MyVerification(),
      'navbar': (context) => const Mynavbar(),
      'aboutus': (context) => const Aboutus(),
      'forgetpassword': (context) => const MyForgetPassword(),
      'newpassword': (context) => const MyNewPassword(),
      'account': (context) => const MyAccountPage(),
      'account_edit': (context) => const MyAccountPageEdit()

      //  'verification':(context)=> Verification(),
    },
  ));
}


import 'package:flutter/material.dart';
import 'package:parkandpee/aboutus.dart';
import 'package:parkandpee/home_page.dart';
import 'package:parkandpee/login.dart';
import 'package:parkandpee/navbar.dart';
import 'package:parkandpee/register.dart';
import 'package:parkandpee/verification.dart';
import 'package:parkandpee/forgetpassword.dart';
import 'package:parkandpee/newpassword.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Poppins-Bold.ttf'),
    // home: const MyLogin(),
    // home: const MyHomePage(),
    home: const MyLogin(),
    // home: const MyVerification()
    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => const MyLogin(),
      'verification': (context) => const MyVerification(),
      'homepage': (context) => const MyHomePage(),
      'navbar': (context) => const Mynavbar(),
      'aboutus':(context) => const Aboutus(),
      'forgetpassword':(context) => const MyForgetPassword(),
      'newpassword':(context) => const MyNewPassword()

      //  'verification':(context)=> Verification(),
    },
  ));
}

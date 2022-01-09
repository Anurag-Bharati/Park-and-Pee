import 'package:flutter/material.dart';
import 'package:parkandpee/HomePage.dart';
import 'package:parkandpee/login.dart';
import 'package:parkandpee/register.dart';
import 'package:parkandpee/verification.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Poppins-Bold.ttf'),
    home: const MyLogin(),
    // home: const MyHomePage(),
    // home: const MyVerification()
    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) =>    const MyLogin(),
      'verification': (context) =>    const MyVerification(),
      'homepage': (context) =>    const MyHomePage(),

    //  'verification':(context)=> Verification(),
    },
  ));
}                                   

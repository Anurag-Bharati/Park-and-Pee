import 'package:flutter/material.dart';
import 'package:parkandpee/aboutus.dart';
import 'package:parkandpee/account.dart';
import 'package:parkandpee/account_change_phone_pass.dart';
import 'package:parkandpee/add_service_details_park.dart';
import 'package:parkandpee/add_service_details_pee.dart';
import 'package:parkandpee/add_service_photo.dart';
import 'package:parkandpee/add_service_success.dart';
import 'package:parkandpee/login.dart';
import 'package:parkandpee/mapview.dart';
import 'package:parkandpee/navbar.dart';
import 'package:parkandpee/property.dart';
import 'package:parkandpee/register.dart';
import 'package:parkandpee/service_location_learn_more.dart';
import 'package:parkandpee/verification.dart';
import 'package:parkandpee/forgetpassword.dart';
import 'package:parkandpee/newpassword.dart';
import 'package:parkandpee/account_edit.dart';
import 'account_change_phone_pass.dart';
import 'admin.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // theme: ThemeData(fontFamily: 'Poppins-Bold.ttf'),
    // home: const MyLogin(),
    // home: const MyLogin(),
    // home: const MyVerification()
    // home: const Myadmin(),
    home: const MapView(),
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
      'property': (context) => const MyProperyPage()
      //  'verification':(context)=> Verification(),
    },
  ));
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class MySettingPage extends StatefulWidget {
  const MySettingPage({Key? key}) : super(key: key);

  @override
  _MySettingPagestate createState() => _MySettingPagestate();
}

class _MySettingPagestate extends State<MySettingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/homebackground.png'), fit: BoxFit.cover),
      ),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SafeArea(child: Text("Setting")),
      ),
    );
  }
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class MyStatementPage extends StatefulWidget {
  const MyStatementPage({Key? key}) : super(key: key);

  @override
  _MyStatementPagestate createState() => _MyStatementPagestate();
}

class _MyStatementPagestate extends State<MyStatementPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/insidebackground.png'), fit: BoxFit.fill),
      ),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SafeArea(child: Text("Statement")),
      ),
    );
  }
}

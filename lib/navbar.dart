import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:parkandpee/account.dart';
import 'package:parkandpee/home_page.dart';
import 'package:parkandpee/property.dart';
import 'package:parkandpee/statement.dart';

import 'Setting.dart';

class Mynavbar extends StatefulWidget {
  const Mynavbar({Key? key}) : super(key: key);

  @override
  _Mynavbarstate createState() => _Mynavbarstate();
}

class _Mynavbarstate extends State<Mynavbar> {
  // final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int selectedIndex = 0;
  final screen = [
    const MyHomePage(),
    const MyStatementPage(),
    const MyAccountPage(),
    const MyProperyPage(),
    const MySettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/homebackground.png'),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          top: false,
          child: Scaffold(
            extendBody: true,
            bottomNavigationBar: CurvedNavigationBar(
              // key: navigationKey,
              backgroundColor: Colors.transparent,
              color: const Color.fromRGBO(147, 127, 238, 1.0),
              buttonBackgroundColor: const Color.fromRGBO(84, 230, 215, 1.0),
              height: 50,
              items: const <Widget>[
                Icon(
                  Icons.home,
                  size: 25,
                  color: Colors.white,
                ),
                Icon(
                  Icons.receipt_rounded,
                  size: 25,
                  color: Colors.white,
                ),
                Icon(
                  Icons.account_circle,
                  size: 25,
                  color: Colors.white,
                ),
                Icon(
                  Icons.real_estate_agent,
                  size: 25,
                  color: Colors.white,
                ),
                Icon(
                  Icons.settings,
                  size: 25,
                  color: Colors.white,
                ),
              ],
              animationDuration: const Duration(milliseconds: 300),
              onTap: (index) {
                debugPrint("Current Index is $index");
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            body: screen[selectedIndex],
          ),
        ));
  }
}

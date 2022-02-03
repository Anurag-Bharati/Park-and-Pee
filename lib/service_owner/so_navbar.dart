import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:parkandpee/service_owner/so_account.dart';
import 'package:parkandpee/service_owner/so_dashboard.dart';
import 'package:parkandpee/service_owner/so_property.dart';
import 'package:parkandpee/service_owner/so_setting.dart';
import 'package:parkandpee/service_owner/so_statement.dart';


class MySoNavbar extends StatefulWidget {
  const MySoNavbar({Key? key}) : super(key: key);

  @override
  _MySoNavbarstate createState() => _MySoNavbarstate();
}

class _MySoNavbarstate extends State<MySoNavbar> {
  // final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int selectedIndex = 0;
  final screen = [
    const MySoDashboard(),
    const MySoStatement(),
    const MySoAccountPage(),
    const MySoProperty(),
    const MySoSetting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/backwhite.png'),
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

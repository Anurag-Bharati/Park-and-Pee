import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:parkandpee/controller/profile/account.dart';
import 'package:parkandpee/controller/home/home_page.dart';
import 'package:parkandpee/controller/my_service/property.dart';
import 'package:parkandpee/controller/my_service/statement.dart';
import 'package:parkandpee/controller/settings/Setting.dart';
import 'package:parkandpee/model/model_core.dart';
import 'package:parkandpee/service_owner/so_dashboard_concept.dart';

class Mynavbar extends StatefulWidget {
  final User user;
  final int initialMenu;
  const Mynavbar({
    Key? key,
    required this.user,
    required this.initialMenu,
  }) : super(key: key);

  @override
  _Mynavbarstate createState() => _Mynavbarstate();
}

class _Mynavbarstate extends State<Mynavbar> {
  // final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int selectedIndex = 0;
  List<Widget> screen = [];

  @override
  void initState() {
    super.initState();
    screen.addAll([
      MyHomePage(
        user: widget.user,
      ),
      const MyStatementPage(),
      const MyAccountPage(),
      MyPropertyPage(user: widget.user),
      const MySettingPage(),
      SoDashBoard(
        user: widget.user,
      ),
    ]);
    selectedIndex = widget.initialMenu;
  }

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
                  if (index == 3 && widget.user.is_so as bool) {
                    selectedIndex = 5;
                  } else {
                    selectedIndex = index;
                  }
                });
              },
            ),
            body: screen[selectedIndex],
          ),
        ));
  }
}

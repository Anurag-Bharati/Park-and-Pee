// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePagestate createState() => _MyHomePagestate();
}

class _MyHomePagestate extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/homebackground.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(

        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(
              children: [
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          MdiIcons.menu,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 245,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Navigator,
                        child: const Icon(
                          Icons.notifications_none_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 150,
                ),
                Container(
                  // padding: const EdgeInsets.all(28),
                  padding: const EdgeInsets.only(
                      top: 50, left: 28, right: 28, bottom: 40),
                  // margin: const EdgeInsets.only(top:50),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.black12)),
                  child: Column(
                    children: [
                      const Text(
                        "Choose Services",
                        style: TextStyle(
                            fontFamily: "fonts/Poppins-ExtraLight.ttf",
                            fontSize: 25,
                            fontWeight: FontWeight.w200),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                          //  padding: EdgeInsets.only(left:50),
                          height: 120,
                          width: 315,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purpleAccent[700],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            onPressed: () {},
                            child: InkWell(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Ink.image(
                                  image: const AssetImage(
                                    'assets/parking.png',
                                  ),
                                  height: 50,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                const Text('Parking',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily:
                                            "fonts/Poppins-Regular.ttf")),
                              ],
                            )),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          //  padding: EdgeInsets.only(left:50),
                          height: 120,
                          width: 315,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromRGBO(48, 220, 225, 1.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            child: InkWell(
                                splashColor: Colors.purple,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Ink.image(
                                      image: const AssetImage(
                                        'assets/toiletseat.png',
                                      ),
                                      height: 50,
                                      fit: BoxFit.contain,
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    const Text('Toilet',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily:
                                                "fonts/Poppins-Regular.ttf")),
                                  ],
                                )),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

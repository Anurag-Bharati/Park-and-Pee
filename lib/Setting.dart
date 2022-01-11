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
      child:SafeArea(top: false,
      
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
                          Icons.arrow_back,
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
                        "Settings",
                        style: TextStyle(
                            fontFamily: "fonts/Poppins-light.ttf",
                            fontSize: 25,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        //  padding: EdgeInsets.only(left:50),
                        height: 50,
                        width: 315,
                        child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purpleAccent[700],
                              padding: const EdgeInsets.only(right: 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            icon: const Icon(
                              Icons.notifications_none,
                              size: 25,
                            ),
                            label: const Text("Notification",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "fonts/Poppins-Medium.ttf"))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        //  padding: EdgeInsets.only(left:50),
                        height: 50,
                        width: 315,
                        child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(context, 'aboutus');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purpleAccent[700],
                              padding: const EdgeInsets.only(right: 70),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            icon: const Icon(
                              MdiIcons.chatQuestion,
                              size: 25,
                            ),
                            label: const Text("About Us",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "fonts/Poppins-Medium.ttf"))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        //  padding: EdgeInsets.only(left:50),
                        height: 50,
                        width: 315,
                        child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purpleAccent[700],
                              padding: const EdgeInsets.only(right: 115),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            icon: const Icon(
                              Icons.question_answer,
                              size: 25,
                            ),
                            label: const Text("FAQ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "fonts/Poppins-Medium.ttf"))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: 315,
                        child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purpleAccent[700],
                              padding: const EdgeInsets.only(right: 85),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            icon: const Icon(
                              Icons.logout,
                              size: 25,
                            ),
                            label: const Text("Log Out",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "fonts/Poppins-Medium.ttf"))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("App Version \n     0.0.01")
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),)
    );
  }
}

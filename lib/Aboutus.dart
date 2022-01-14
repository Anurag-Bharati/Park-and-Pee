// ignore_for_file: file_names

import 'package:flutter/material.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class Aboutus extends StatefulWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  _Aboutusstate createState() => _Aboutusstate();
}

class _Aboutusstate extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/homebackground.png'), fit: BoxFit.fill),
        ),
        child: SafeArea(
          top: true,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
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
                      ],
                    ),
                    const SizedBox(
                      height: 50,
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
                        children: const [
                          Text(
                            "About Us",
                            style: TextStyle(
                                fontFamily: "fonts/Poppins-light.ttf",
                                fontSize: 25,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                              "Park and Pee is a service provider system. It serves two major solution to the daily occuring problems that are parking issue and emergency toilet problem. As it has to main solution to the problems they are catagorised into Parking and Toilet. Parking offers you the most pleasant feature of parking your vehicles such as Car and Bike, you can find empty spaces for your automobile to park in a easy way. In a same way Toilet provides you the nearest location of the restrooms where you can feel fresh.",
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.justify),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

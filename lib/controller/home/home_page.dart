// ignore_for_file: file_names, deprecated_member_use

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkandpee/controller/parking.dart';
import 'package:parkandpee/model/model_core.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class MyHomePage extends StatefulWidget {
  final User user;
  const MyHomePage({Key? key, required this.user}) : super(key: key);
  @override
  _MyHomePagestate createState() => _MyHomePagestate();
}

class _MyHomePagestate extends State<MyHomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late LatLng myCoordinates;
  SnackBar showSnackBar(String message, context, Color? color, int duration) {
    _scaffoldKey.currentState!.removeCurrentSnackBar();
    final snackbar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: duration),
        backgroundColor: color,
        content: Text(
          message,
          style: const TextStyle(
              fontFamily: 'Poppins', fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ));

    return snackbar;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bodybackground.png'), fit: BoxFit.fill),
      ),
      child: SafeArea(
        top: false,
        child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Padding(
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
                    IconButton(
                      padding: EdgeInsets.only(
                        //   // top: deviceHeight(context) * 0.4,
                        left: deviceWidth(context) * 0.65,
                        // right: deviceWidth(context) *0.6,
                        //   // bottom: deviceHeight(context) * 0.0,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'login');
                      },
                      icon: const Icon(Icons.notifications_none),
                      iconSize: 40,
                      color: Colors.white,
                    )
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
                    children: [
                      const Text(
                        "Choose Services",
                        style: TextStyle(
                            fontFamily: "fonts/Poppins-Light.ttf",
                            fontSize: 25,
                            fontWeight: FontWeight.w300),
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
                            onPressed: () {
                              _scaffoldKey.currentState!.showSnackBar(
                                  showSnackBar(
                                      "Now compiling data based on your location",
                                      context,
                                      Colors.green[400],
                                      2));
                              EasyDebounce.debounce('parking-debouncer',
                                  const Duration(milliseconds: 1000), () {
                                getCurrentLocation("parking");
                              });
                            },
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
                          onPressed: () {
                            _scaffoldKey.currentState!.showSnackBar(
                                showSnackBar(
                                    "Now compiling data based on your location",
                                    context,
                                    Colors.green[400],
                                    2));
                            EasyDebounce.debounce('parking-debouncer',
                                const Duration(milliseconds: 1000), () {
                              getCurrentLocation("peeing");
                            });
                          },
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
                            ),
                          ),
                        ),
                      ),
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

  getCurrentLocation(String type) async {
    await Geolocator.isLocationServiceEnabled();
    await Geolocator.requestPermission();
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      myCoordinates = LatLng(value.latitude, value.longitude);
    });
    // ignore: unnecessary_null_comparison
    if (myCoordinates == null) {
      _scaffoldKey.currentState!.showSnackBar(showSnackBar(
          "Sorry, Cannot fetch your location. Redirect purged",
          context,
          Colors.red[400],
          2));
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ParkingServices(
          user: widget.user,
          coordinates: myCoordinates,
          type: type,
        ),
      ),
    );
  }
}

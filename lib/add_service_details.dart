// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Model/progress_step_widget.dart';

class AddServiceDetails extends StatefulWidget {
  const AddServiceDetails({Key? key}) : super(key: key);
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<AddServiceDetails> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late TextEditingController textController1;
  late TextEditingController textController2;

  bool _amenity1 = false;
  bool _amenity2 = false;
  bool _amenity3 = false;
  bool _amenity4 = false;
  bool _amenity5 = false;
  bool _amenity6 = false;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  // Option 2

  // For Custom Initial Location and its Icon
  late BitmapDescriptor mapMarker;

  // Initials for stepping sequence
  static const stepIcons = [Icons.location_on, Icons.file_copy, Icons.verified];

  SnackBar showSnackBar(String message, context, Color? color, int duration) {
    final snackbar = SnackBar(
        duration: const Duration(seconds: 1),
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFE242f3e), // Colors.transparent
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  transform: Matrix4.diagonal3Values(1.2, 1.2, 0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset(
                    'assets/cover_park.jpg',
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 1,
                    fit: BoxFit.cover,
                    color: const Color(0xFF937FEE),
                    colorBlendMode: BlendMode.softLight,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 30,
                        color: Color(0xB3000000),
                        spreadRadius: 0,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: const Text(
                              'ADD A SERVICE',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          StepProgressView(
                            icons: stepIcons,
                            curStep: 2,
                            width: MediaQuery.of(context).size.width,
                            color: const Color(0xff58B6EC),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 20,
                            decoration: const BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Hello World',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'fonts/Poppins-light.ttf',
                                        fontSize: 25,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 10, 0),
                                      child: Container(
                                        width: 150,
                                        decoration: const BoxDecoration(),
                                        child: TextFormField(
                                          controller: textController1,
                                          obscureText: false,
                                          decoration: const InputDecoration(
                                            hintText: '[Some hint text...]',
                                            hintStyle: TextStyle(
                                              fontFamily:
                                                  'fonts/Poppins-light.ttf',
                                              fontSize: 25,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: const TextStyle(
                                            fontFamily:
                                                'fonts/Poppins-light.ttf',
                                            fontSize: 25,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Hello World',
                                      style: TextStyle(
                                        fontFamily: 'fonts/Poppins-light.ttf',
                                        fontSize: 25,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(10, 0, 0, 0),
                                        child: TextFormField(
                                          controller: textController2,
                                          obscureText: false,
                                          decoration: const InputDecoration(
                                            hintText: '[Some hint text...]',
                                            hintStyle: TextStyle(
                                              fontFamily:
                                                  'fonts/Poppins-light.ttf',
                                              fontSize: 25,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: const TextStyle(
                                            fontFamily:
                                                'fonts/Poppins-light.ttf',
                                            fontSize: 25,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: Text(
                              'Select Service Type',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: _amenity1
                                          ? Colors.green[400]
                                          : Colors.red[400],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(Icons.ac_unit),
                                      // 2
                                      color: _amenity1
                                          ? Colors.white
                                          : Colors.white,
                                      // 3
                                      onPressed: () => {
                                        setState(() {
                                          _amenity1 = !_amenity1;
                                          _scaffoldKey.currentState
                                              ?.hideCurrentSnackBar();

                                          _scaffoldKey.currentState
                                              ?.showSnackBar(showSnackBar(
                                                  _amenity1 == true
                                                      ? "Amenity - Shade has been enabled"
                                                      : "Amenity - Shade has been disabled",
                                                  context,
                                                  _amenity1 == true
                                                      ? Colors.green[400]
                                                      : Colors.red[400],
                                                  2));
                                        })
                                      },
                                    )),
                                Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: _amenity2
                                          ? Colors.green[400]
                                          : Colors.red[400],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(Icons.fence),
                                      // 2
                                      color: _amenity2
                                          ? Colors.white
                                          : Colors.white,
                                      // 3
                                      onPressed: () => {
                                        setState(() {
                                          _amenity2 = !_amenity2;
                                          _scaffoldKey.currentState
                                              ?.hideCurrentSnackBar();

                                          _scaffoldKey.currentState
                                              ?.showSnackBar(showSnackBar(
                                                  _amenity2 == true
                                                      ? "Amenity - Wall has been enabled"
                                                      : "Amenity - Wall has been disabled",
                                                  context,
                                                  _amenity2 == true
                                                      ? Colors.green[400]
                                                      : Colors.red[400],
                                                  2));
                                        })
                                      },
                                    )),
                                Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: _amenity3
                                          ? Colors.green[400]
                                          : Colors.red[400],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(Icons.camera_enhance),
                                      // 2
                                      color: _amenity3
                                          ? Colors.white
                                          : Colors.white,
                                      // 3
                                      onPressed: () => {
                                        setState(() {
                                          _amenity3 = !_amenity3;
                                          _scaffoldKey.currentState
                                              ?.hideCurrentSnackBar();

                                          _scaffoldKey.currentState
                                              ?.showSnackBar(showSnackBar(
                                                  _amenity3 == true
                                                      ? "Amenity - CCTV has been enabled"
                                                      : "Amenity - CCTV has been disabled",
                                                  context,
                                                  _amenity3 == true
                                                      ? Colors.green[400]
                                                      : Colors.red[400],
                                                  2));
                                        })
                                      },
                                    )),
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: _amenity4
                                        ? Colors.green[400]
                                        : Colors.red[400],
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: IconButton(
                                      icon: const Icon(Icons.security),
                                      // 2
                                      color: _amenity4
                                          ? Colors.white
                                          : Colors.white,
                                      // 3
                                      onPressed: () => {
                                            setState(
                                              () {
                                                _amenity4 = !_amenity4;
                                                _scaffoldKey.currentState
                                                    ?.hideCurrentSnackBar();

                                                _scaffoldKey.currentState
                                                    ?.showSnackBar(showSnackBar(
                                                        _amenity4 == true
                                                            ? "Amenity - Security has been enabled"
                                                            : "Amenity - Security has been disabled",
                                                        context,
                                                        _amenity4 == true
                                                            ? Colors.green[400]
                                                            : Colors.red[400],
                                                        2));
                                              },
                                            ),
                                          }),
                                ),
                                Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: _amenity5
                                          ? Colors.green[400]
                                          : Colors.red[400],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(Icons.local_taxi),
                                      // 2
                                      color: _amenity5
                                          ? Colors.white
                                          : Colors.white,
                                      // 3
                                      onPressed: () => {
                                        setState(() {
                                          _amenity5 = !_amenity5;
                                          _scaffoldKey.currentState
                                              ?.hideCurrentSnackBar();

                                          _scaffoldKey.currentState
                                              ?.showSnackBar(showSnackBar(
                                                  _amenity5 == true
                                                      ? "Amenity - Car has been enabled"
                                                      : "Amenity - Car has been disabled",
                                                  context,
                                                  _amenity5 == true
                                                      ? Colors.green[400]
                                                      : Colors.red[400],
                                                  2));
                                        })
                                      },
                                    )),
                                Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: _amenity6
                                          ? Colors.green[400]
                                          : Colors.red[400],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(Icons.motorcycle),
                                      // 2
                                      color: _amenity6
                                          ? Colors.white
                                          : Colors.white,
                                      // 3
                                      onPressed: () => {
                                        setState(() {
                                          _amenity6 = !_amenity6;
                                          _scaffoldKey.currentState
                                              ?.hideCurrentSnackBar();

                                          _scaffoldKey.currentState
                                              ?.showSnackBar(showSnackBar(
                                                  _amenity6 == true
                                                      ? "Amenity - Bike has been enabled"
                                                      : "Amenity - Bike has been disabled",
                                                  context,
                                                  _amenity6 == true
                                                      ? Colors.green[400]
                                                      : Colors.red[400],
                                                  2));
                                        })
                                      },
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: Text(
                                    'Tip: You can drag the map to make the location more precise',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 25, 0, 0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFD62F2F),
                                      borderRadius: BorderRadius.circular(5),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

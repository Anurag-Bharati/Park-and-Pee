// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:parkandpee/model/service_main.dart';

import '../../model/model_core.dart';
import '../../Model/widgets/progress_step_widget.dart';

class AddServiceSuccess extends StatefulWidget {
  final ServiceMain service;
  final User user;
  const AddServiceSuccess({Key? key, required this.service, required this.user})
      : super(key: key);
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<AddServiceSuccess> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  // Initials for stepping sequence
  static const stepIcons = [Icons.location_on, Icons.file_copy, Icons.verified];

  SnackBar showSnackBar(String message, context, Color? color, int duration) {
    final snackbar = SnackBar(
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
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  transform: Matrix4.diagonal3Values(1.2, 1.2, 0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: Image.asset(
                    widget.service.serviceType == "Parking"
                        ? 'assets/cover_park.jpg'
                        : 'assets/cover_pee.jpg',
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
                    color: Color(0xFFFFFFFF),
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
                              color: Color(0xFFFFFFFF),
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
                            curStep: 4,
                            width: MediaQuery.of(context).size.width,
                            color: const Color(0xFF66BB6A),
                          ),
                          const SizedBox(height: 25),
                          LottieBuilder.asset(
                            'assets/json/success.json',
                            height: 150,
                            width: 150,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'SUCCESS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'fonts/Poppins-light.ttf',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 10, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Your service has been successfully registered.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'fonts/Poppins-light.ttf',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 25, 0, 0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    child: ElevatedButton(
                                      child: const Text("OKEY"),
                                      onPressed: () {
                                        // TODO

                                        _scaffoldKey.currentState
                                            ?.removeCurrentSnackBar();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green[400],
                                        textStyle: const TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 10,
                                          fontSize: 20,
                                        ),
                                        side: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
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

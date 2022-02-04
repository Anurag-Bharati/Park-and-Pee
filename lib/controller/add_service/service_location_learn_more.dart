// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MapViewLearnMore extends StatefulWidget {
  const MapViewLearnMore({Key? key}) : super(key: key);
  double deviceHeight(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return height;
  }

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapViewLearnMore> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
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
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: Center(
            child: Stepper(
              steps: _steps(),
              currentStep: _currentStep,
              onStepTapped: (step) {
                setState(() {
                  _currentStep = step;
                });
              },
              onStepContinue: () {
                setState(() {
                  if (_currentStep < _steps().length - 1) {
                    _currentStep = _currentStep + 1;
                  } else {
                    //Logic to check if everything is completed
                    print('Completed, check fields.');
                  }
                });
              },
              onStepCancel: () {
                setState(
                  () {
                    if (_currentStep > 0) {
                      _currentStep = _currentStep - 1;
                    } else {
                      _currentStep = 0;
                    }
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  List<Step> _steps() {
    List<Step> _steps = [
      Step(
        title: const Text("Open Google Maps"),
        content: Stack(children: [
          SizedBox(
              height: 300,
              width: 300 + 180,
              child: Lottie.asset("assets/json/girl-tapping-phone.json")),
          Container(
              margin: const EdgeInsets.only(left: 300),
              height: 70,
              width: 70,
              child: Lottie.asset("assets/json/gmaps.json")),
        ]),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: const Text("Search Your Location"),
        content: Stack(children: [
          SizedBox(
              height: 290,
              width: 318,
              child: Lottie.asset("assets/json/loc-search.json")),
        ]),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: const Text("Press And Hold"),
        content: Stack(children: [
          SizedBox(
              height: 270,
              width: 140,
              child: Lottie.asset("assets/json/press.json")),
        ]),
        isActive: _currentStep >= 2,
      ),
      Step(
        title: const Text("Copy The Co-ordinates"),
        content: const Text(""),
        isActive: _currentStep >= 3,
      )
    ];
    return _steps;
  }
}

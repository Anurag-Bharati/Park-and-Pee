// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkandpee/Model/service.dart';
import 'package:parkandpee/add_service_photo.dart';
import 'package:parkandpee/user.dart';

import 'Model/progress_step_widget.dart';

class AddServiceDetails extends StatefulWidget {
  final Service service;
  final User user;
  const AddServiceDetails({Key? key, required this.service, required this.user})
      : super(key: key);

  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<AddServiceDetails> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late TextEditingController textController1;

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
  }

  // Option 2

  // For Custom Initial Location and its Icon
  late BitmapDescriptor mapMarker;

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

  String? dropDownValue;
  final List<String> itemList = ['Hotel', 'Restaurant', 'Home', 'Other'];

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
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  transform: Matrix4.diagonal3Values(1.2, 1.2, 0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.28,
                  // TOD  FadeInImage.memoryNetwork(

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
                            curStep: 2,
                            width: MediaQuery.of(context).size.width,
                            color: const Color(0xff58B6EC),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 20,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          const Text(
                            'Add Service Details',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'fonts/Poppins-light.ttf',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 15, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Service Name',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'fonts/Poppins-light.ttf',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 10, 0),
                                      child: SizedBox(
                                        height: 50,
                                        width: 150,
                                        child: TextFormField(
                                          controller: textController1,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText: 'Name',
                                            hintStyle: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily:
                                                  'fonts/Poppins-light.ttf',
                                              fontSize: 15,
                                              color: Color(0xFFA0A0A0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xFFA0A0A0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.green,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            filled: true,
                                            fillColor: const Color(0xFFEFEFEF),
                                            prefixIcon:
                                                const Icon(Icons.text_fields),
                                            suffixIcon: textController1
                                                    .text.isNotEmpty
                                                ? InkWell(
                                                    onTap: () => setState(
                                                      () => textController1
                                                          .clear(),
                                                    ),
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Colors.red[400],
                                                      size: 20,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily:
                                                'fonts/Poppins-light.ttf',
                                            fontSize: 15,
                                          ),
                                          textAlign: TextAlign.start,
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
                                      'Location Type',
                                      style: TextStyle(
                                        fontFamily: 'fonts/Poppins-light.ttf',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(10, 10, 0, 0),
                                        child: SizedBox(
                                          height: 50,
                                          width: 170,
                                          child: DropdownButtonFormField(
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down,
                                            ),
                                            iconSize: 25,
                                            iconEnabledColor: Colors.green,

                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFA0A0A0),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.green,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                filled: true,
                                                isDense: true,
                                                hintStyle: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xFFA0A0A0)),
                                                hintText: "Type",
                                                fillColor:
                                                    const Color(0xFFEFEFEF)),
                                            value: dropDownValue,
                                            // ignore: non_constant_identifier_names
                                            onChanged: (String? Value) {
                                              setState(() {
                                                dropDownValue = Value;
                                              });
                                            },
                                            // ignore: non_constant_identifier_names
                                            items: itemList
                                                .map(
                                                  (items) => DropdownMenuItem(
                                                    value: items,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        items,
                                                        style: const TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Text(
                              'Select The Parking Amenities',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w300),
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
                                          : Colors.grey[400],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(Icons.water),
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
                                                      : Colors.orange[400],
                                                  1));
                                        })
                                      },
                                    )),
                                Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: _amenity2
                                          ? Colors.green[400]
                                          : Colors.grey[400],
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
                                                      : Colors.orange[400],
                                                  1));
                                        })
                                      },
                                    )),
                                Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: _amenity3
                                          ? Colors.green[400]
                                          : Colors.grey[400],
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
                                                      : Colors.orange[400],
                                                  1));
                                        })
                                      },
                                    )),
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: _amenity4
                                        ? Colors.green[400]
                                        : Colors.grey[400],
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
                                                            : Colors
                                                                .orange[400],
                                                        1));
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
                                          : Colors.grey[400],
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
                                                      : Colors.orange[400],
                                                  1));
                                        })
                                      },
                                    )),
                                Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: _amenity6
                                          ? Colors.green[400]
                                          : Colors.grey[400],
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
                                                      : Colors.orange[400],
                                                  1));
                                        })
                                      },
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFFFFF),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 0),
                                  child: Text(
                                    'Note: Grey means not available and Green means available',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    child: ElevatedButton(
                                      child: const Text("NEXT"),
                                      onPressed: () {
                                        _scaffoldKey.currentState
                                            ?.removeCurrentSnackBar();

                                        if (textController1.text.length < 3) {
                                          _scaffoldKey.currentState
                                              ?.showSnackBar(showSnackBar(
                                                  "The name must be at least 3 char long",
                                                  context,
                                                  Colors.red[400],
                                                  1));
                                        } else if (dropDownValue == null) {
                                          _scaffoldKey.currentState
                                              ?.showSnackBar(showSnackBar(
                                                  "Please select the type of the service location",
                                                  context,
                                                  Colors.red[400],
                                                  2));
                                        } else if (itemList
                                            .contains(dropDownValue)) {
                                          if (_amenity6 || _amenity5) {
                                            _scaffoldKey.currentState
                                                ?.showSnackBar(showSnackBar(
                                                    "All seems good so far!",
                                                    context,
                                                    Colors.green[400],
                                                    1));
                                            widget.service.name =
                                                textController1.text.toString();
                                            widget.service.locType =
                                                dropDownValue.toString();
                                            widget.service.setAmenity([
                                              _amenity1,
                                              _amenity2,
                                              _amenity3,
                                              _amenity4,
                                              _amenity5,
                                              _amenity6
                                            ]);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddServicePhoto(
                                                        service: widget.service,
                                                        user: widget.user,
                                                      )),
                                            );
                                          } else {
                                            _scaffoldKey.currentState
                                                ?.showSnackBar(showSnackBar(
                                                    "Please select bike or car or both amenity to proceed",
                                                    context,
                                                    Colors.red[400],
                                                    2));
                                          }
                                        } else {
                                          _scaffoldKey.currentState
                                              ?.showSnackBar(showSnackBar(
                                                  "Sorry! Something went wrong",
                                                  context,
                                                  Colors.red[400],
                                                  1));
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color(0xFF58B6EC),
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

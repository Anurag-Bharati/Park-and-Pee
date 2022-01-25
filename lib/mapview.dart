// ignore_for_file: deprecated_member_use
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkandpee/Model/ScrollBehavior.dart';
import 'package:parkandpee/aboutus.dart';
import 'package:parkandpee/add_service_details_park.dart';
import 'package:parkandpee/add_service_details_pee.dart';

import 'Model/map_util.dart';
import 'Model/progress_step_widget.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);
  double deviceHeight(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return height;
  }

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late TextEditingController textController1;

  late GoogleMapController _mapController;

  LatLng _currentLatLng = const LatLng(27.62, 85.32);
  late CameraPosition _newCameraPosition =
      CameraPosition(target: _currentLatLng, zoom: 15);
  bool _toggleHybrid = false;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();

    setCustomMarker();
    locateMe();
  }

  Future locateMe() async {
    final Position position = await Geolocator.getCurrentPosition();
    _currentLatLng = LatLng(position.latitude, position.longitude);
    return _currentLatLng;
  }

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
  // Option 2

  // For Custom Initial Location and its Icon
  final Set<Marker> _markers = {};
  late BitmapDescriptor mapMarker;

  String? dropDownValue;
  final List<String> itemList = ['Parking', 'Toilet'];

  // Initials for stepping sequence
  static const stepIcons = [Icons.location_on, Icons.file_copy, Icons.verified];
  final int _curStep = 1;

  @override
  void dispose() {
    _mapController.dispose();
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
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(children: [
                    Stack(children: [
                      Container(
                        width: double.infinity,
                        height: deviceHeight(context) > 1080 ? 800 : 520,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          child: GoogleMap(
                            gestureRecognizers: <
                                Factory<OneSequenceGestureRecognizer>>{
                              Factory<OneSequenceGestureRecognizer>(
                                () => EagerGestureRecognizer(),
                              ),
                            },
                            onTap: _getData,
                            onLongPress: _getData,
                            markers: _markers,
                            onMapCreated: (controller) => {
                              _mapController = controller,
                              _onMapCreated(),
                            },
                            zoomControlsEnabled: false,
                            initialCameraPosition: _newCameraPosition,
                            myLocationEnabled: true,
                            mapType:
                                _toggleHybrid ? MapType.hybrid : MapType.normal,
                          ),
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Color(0xB3000000),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          right: 11,
                          top: 80,
                        ),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.topRight,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 38,
                                height: 38,
                                child: FloatingActionButton(
                                  heroTag: "btn1",
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                  backgroundColor: const Color(0xCCEF5350),
                                  child: const Icon(
                                    Icons.location_searching,
                                    size: 20,
                                  ),
                                  onPressed: () => _mapController.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                        _newCameraPosition),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: 38,
                                height: 38,
                                child: FloatingActionButton(
                                    heroTag: "btn2",
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2)),
                                    backgroundColor: _toggleHybrid
                                        ? const Color(0xCC66BB6A)
                                        : const Color(0xCCFFA726),
                                    child: Icon(
                                      _toggleHybrid
                                          ? Icons.map
                                          : Icons.satellite,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _toggleHybrid = !_toggleHybrid;
                                        _toggleHybrid
                                            ? _scaffoldKey.currentState
                                                ?.showSnackBar(showSnackBar(
                                                    "Satellite Mode Enabled",
                                                    context,
                                                    Colors.green[400],
                                                    1))
                                            : _scaffoldKey.currentState
                                                ?.showSnackBar(showSnackBar(
                                                    "Satellite Mode Disabled",
                                                    context,
                                                    Colors.orange[400],
                                                    1));
                                      });
                                    }),
                              ),
                            ]),
                      )
                    ]),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(20),
                      child: SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 600,
                          decoration: const BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0,
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                30, 30, 30, 30),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  curStep: _curStep,
                                  width: MediaQuery.of(context).size.width,
                                  color: const Color(0xff58B6EC),
                                ),
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 60, 0, 0),
                                  child: Text(
                                    'Select The Service Location',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: textController1,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText:
                                                'Latitude and Longitude Value',
                                            hintStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily:
                                                  'fonts/Poppins-light.ttf',
                                              fontSize: 18,
                                              color: Colors.grey[600],
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
                                                color: Color(0xFFA0A0A0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            filled: false,
                                            isDense: true,
                                            fillColor: const Color(0xFFEFEFEF),
                                            prefixIcon: const Icon(
                                              Icons.location_on,
                                            ),
                                            suffixIcon:
                                                textController1.text.isNotEmpty
                                                    ? InkWell(
                                                        onTap: () => setState(
                                                          () => textController1
                                                              .clear(),
                                                        ),
                                                        child: const Icon(
                                                          Icons.clear,
                                                          color: Colors.grey,
                                                          size: 25,
                                                        ),
                                                      )
                                                    : null,
                                          ),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily:
                                                'fonts/Poppins-light.ttf',
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 20),
                                        width: 60,
                                        child: ElevatedButton(
                                          child: const Text("GO"),
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: const Color(0xFF58EC7B),
                                            textStyle: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 18,
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
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'How does it work? ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    TextButton(
                                      child: Text(
                                        "Click here to learn more",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.red[400],
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      // ignore: todo
                                      onPressed: null, //TODO
                                      style: TextButton.styleFrom(
                                          padding: const EdgeInsets.all(5)),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 0),
                                  child: Text(
                                    'Select The Service Type',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  width: double.infinity,
                                  decoration: const BoxDecoration(),
                                  child: SizedBox(
                                    height: 50,
                                    width: 170,
                                    child: DropdownButtonFormField(
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                      ),
                                      iconSize: 25,
                                      iconEnabledColor: Colors.grey,

                                      decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.settings,
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
                                              color: Colors.grey,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          filled: true,
                                          isDense: true,
                                          hintStyle: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey[600]),
                                          hintText: "Type",
                                          fillColor: const Color(0xFFEFEFEF)),
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
                                                alignment: Alignment.center,
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
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Text(
                                          'Tip: You can drag the map to make the location more precise',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 20, 0, 0),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 60,
                                          child: ElevatedButton(
                                            child: const Text("NEXT"),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        dropDownValue ==
                                                                "Parking"
                                                            ? const AddServiceDetails()
                                                            : const AddServiceDetailsPee()),
                                              );
                                              print('Button pressed ...');
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
                                              shape:
                                                  const RoundedRectangleBorder(
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
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _getData(LatLng pos) async {
    setState(() {
      _newCameraPosition = CameraPosition(target: pos, zoom: 17);
      _markers.add(
        Marker(icon: mapMarker, markerId: const MarkerId("one"), position: pos),
      );
    });
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/mapmarker.png');
  }

  void _onMapCreated() {
    setState(() {
      _mapController.setMapStyle(Utils.mapStyle);
    });
  }
}

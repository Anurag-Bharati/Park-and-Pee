// ignore_for_file: deprecated_member_use
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkandpee/model/model_core.dart' show User;
import 'package:parkandpee/model/service_main.dart';

import 'package:parkandpee/controller/add_service/add_service_details_park.dart';
import 'package:parkandpee/controller/add_service/add_service_details_pee.dart';
import 'package:parkandpee/controller/add_service/service_location_learn_more.dart';

import '../../Model/map_util.dart';
import '../../Model/widgets/progress_step_widget.dart';
import '../../Model/widgets/scroll_behavior.dart';

class MapView extends StatefulWidget {
  final User user;
  const MapView({Key? key, required this.user}) : super(key: key);

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
  final ServiceMain _service = ServiceMain();

  String _text = "NOT SELECTED";
  bool _textSelected = false;

  late GoogleMapController _mapController;

  LatLng _currentLatLng = const LatLng(27.62, 85.32);
  late LatLng? _selectedLocation;

  late CameraPosition _newCameraPosition =
      CameraPosition(target: _currentLatLng, zoom: 15);
  bool _toggleHybrid = false;

  Set<Polygon> polygonSet = {
    const Polygon(
        polygonId: PolygonId('1'),
        points: [
          LatLng(27.63, 85.32),
          LatLng(27.63, 85.32),
        ],
        fillColor: Colors.transparent,
        strokeColor: Colors.transparent)
  };

  double rotate = 0.0;
  @override
  void initState() {
    super.initState();
    setCustomMarker();
    getCurrentLocation();
    widget.user.userId = 1;
  }

  void getCurrentLocation() async {
    await Geolocator.isLocationServiceEnabled();
    await Geolocator.requestPermission();
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _currentLatLng = LatLng(value.latitude, value.longitude);
      _mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: _currentLatLng,
          zoom: 17.0,
        ),
      ));
      _getData(_currentLatLng);
    });
  }

  double rotateCam(double deg) {
    rotate += deg;
    if (rotate > 360) {
      rotate = 10;
    }
    return rotate;
  }

  void _resetCam() {
    setState(() {
      _newCameraPosition =
          CameraPosition(target: _currentLatLng, zoom: 17, bearing: 0, tilt: 0);
      _mapController
          .animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
    });
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

  double? size() {
    if (MediaQuery.of(context).size.height > 1000 &&
        MediaQuery.of(context).size.width > 500) {
      return 800;
    } else {
      return 520;
    }
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
                        height: size(),
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
                            onLongPress: _setData,
                            polygons: polygonSet,
                            markers: _markers,
                            onMapCreated: (controller) => {
                              _mapController = controller,
                              _onMapCreated(),
                            },
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                            zoomControlsEnabled: false,
                            initialCameraPosition: _newCameraPosition,
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
                          right: 12,
                          top: 60,
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
                              height: 10,
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
                                    _toggleHybrid ? Icons.map : Icons.satellite,
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
                          ],
                        ),
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
                                  key: const Key("_scroll"),
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
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 60, 0, 0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'The point has been set to',
                                      style: TextStyle(
                                        fontFamily: 'fonts/Poppins-light.ttf',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 24,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  alignment: Alignment.center,
                                  child: Text(
                                    _text,
                                    style: TextStyle(
                                      color: _textSelected
                                          ? Colors.green[400]
                                          : Colors.red[400],
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'fonts/Poppins-light.ttf',
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 0),
                                  child: Text(
                                    'Select The Service Type',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'fonts/Poppins-light.ttf',
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
                                      key: const Key("_dropDown"),
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
                                          _service.serviceType = Value;
                                          print(_service.serviceType);
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const MapViewLearnMore()),
                                              );
                                            },
                                            style: TextButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.all(5)),
                                          ),
                                        ],
                                      ),
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
                                            key: const Key("_elevatedBtn"),
                                            child: const Text("NEXT"),
                                            onPressed: () {
                                              // ignore: todo
                                              //FIX_THIS Handle Error here : LateInitializationError: Field '_selectedLocation@110010513' has not been initialized.

                                              if (_selectedLocation == null) {
                                                _scaffoldKey.currentState
                                                    ?.showSnackBar(showSnackBar(
                                                        "Please add the service point by long pressing the exact place on the map",
                                                        context,
                                                        Colors.red[400],
                                                        3));
                                              } else if (dropDownValue ==
                                                  null) {
                                                _scaffoldKey.currentState
                                                    ?.showSnackBar(showSnackBar(
                                                        "Please select a service to proceed",
                                                        context,
                                                        Colors.red[400],
                                                        1));
                                              } else {
                                                _service.latitude =
                                                    _selectedLocation!.latitude;
                                                _service.longitude =
                                                    _selectedLocation!
                                                        .longitude;

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        dropDownValue ==
                                                                "Parking"
                                                            ? AddServiceDetails(
                                                                service:
                                                                    _service,
                                                                user:
                                                                    widget.user,
                                                              )
                                                            : AddServiceDetailsPee(
                                                                service:
                                                                    _service,
                                                                user: widget
                                                                    .user),
                                                  ),
                                                );
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

  void _setData(LatLng pos) {
    if (((pos.latitude - _currentLatLng.latitude).abs() <=
            (0.00001 / 1.11) * 150) &&
        (pos.longitude - _currentLatLng.longitude).abs() <=
            (0.00001 / 1.11) * 150) {
      setState(() {
        _textSelected = true;
        _text =
            "${double.parse((pos.latitude).toStringAsFixed(5))}...° N, ${double.parse((pos.longitude).toStringAsFixed(5))}...° E";

        _selectedLocation = pos;
        _newCameraPosition = CameraPosition(
            target: pos, zoom: 18, bearing: rotateCam(10), tilt: 30);
        _markers.clear();
        _markers.add(
          Marker(
              icon: mapMarker, markerId: const MarkerId("one"), position: pos),
        );
        _mapController
            .animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));

        _scaffoldKey.currentState?.showSnackBar(showSnackBar(
            "Point selected at ${pos.latitude}° N, ${pos.longitude}° E",
            context,
            Colors.green[400],
            2));
      });
    } else {
      _selectedLocation = null;
      setState(() {
        _text = "NOT SELECTED";
        _textSelected = false;
        _markers.clear();
        _resetCam();
        _scaffoldKey.currentState?.showSnackBar(showSnackBar(
            "Cannot add point inside the restricted area",
            context,
            Colors.red[400],
            1));
      });
    }
  }

  void _getData(LatLng pos) {
    setState(() {
      _markers.add(
        Marker(icon: mapMarker, markerId: const MarkerId("one"), position: pos),
      );
      polygonSet.clear();
      polygonSet = {
        Polygon(
            polygonId: const PolygonId('1'),
            points: [
              LatLng(pos.latitude + (0.00001 / 1.11) * 150,
                  pos.longitude + (0.00001 / 1.11) * 150),
              LatLng(pos.latitude - (0.00001 / 1.11) * 150,
                  pos.longitude + (0.00001 / 1.11) * 150),
              LatLng(pos.latitude - (0.00001 / 1.11) * 150,
                  pos.longitude - (0.00001 / 1.11) * 150),
              LatLng(pos.latitude + (0.00001 / 1.11) * 150,
                  pos.longitude - (0.00001 / 1.11) * 150),
            ],
            strokeWidth: 5,
            fillColor: const Color(0x4466BB6A),
            strokeColor: Colors.white30)
      };
      _newCameraPosition = CameraPosition(target: pos, zoom: 17);
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

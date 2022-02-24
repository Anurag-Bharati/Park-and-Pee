// ignore_for_file: deprecated_member_use, non_constant_identifier_names, avoid_init_to_null
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkandpee/model/api.dart';
import 'package:parkandpee/model/model_core.dart';
import 'package:parkandpee/model/service_factory.dart';
import 'package:parkandpee/model/service_main.dart';

import '../../Model/map_util.dart';
import '../../Model/widgets/scroll_behavior.dart';
import 'package:http/http.dart' as http;

class UserMapView extends StatefulWidget {
  final Content service;
  const UserMapView({Key? key, required this.service}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<UserMapView> {
  User? service_owner = User(
      userId: 0,
      services: [],
      name: "Anonymous",
      number: "12345",
      legalName: "Unknown",
      businessNumber: "12345");
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late GoogleMapController _mapController;

  late CameraPosition _newCameraPosition;

  late final LatLng serviceCoordinates;
  late final BitmapDescriptor marker;
  late final List<bool> amenity;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    getUser(widget.service.serviceOwner);
    amenity = ServiceMain.decodeStringToList(widget.service.amenities)!;
    super.initState();
    serviceCoordinates =
        LatLng(widget.service.latitude, widget.service.longitude);
    _newCameraPosition = CameraPosition(target: serviceCoordinates, zoom: 20);

    setCustomMarker();
  }

  getUser(int id) async {
    Uri uri = Uri.parse(API.getUrl("user/$id"));
    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 3));
      if (response.statusCode == 200) {
        service_owner = User.fromMap(json.decode(response.body));
        setState(() {});
      }
    } catch (_) {
      print("------USER NOT FOUND-----");
    }
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
  late BitmapDescriptor mapMarker;

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
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50)),
                                child: Image.network(
                                  API.protocol +
                                      API.base +
                                      API.port +
                                      widget.service.coverPicPath,
                                  filterQuality: FilterQuality.medium,
                                  height: 256,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                              Container(
                                transform:
                                    Matrix4.translationValues(0.0, 80.0, 0.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 20,
                                    )),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  child: Image.network(
                                    API.protocol +
                                        API.base +
                                        API.port +
                                        widget.service.mainPicPath,
                                    filterQuality: FilterQuality.medium,
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          widget.service.name.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 30,
                              color: Colors.black87,
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          service_owner != null
                              ? service_owner!.legalName!.toUpperCase()
                              : "UNKNOWN",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.all(20),
                          child: SingleChildScrollView(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 700,
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
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30, 30, 30, 30),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Servies Amenities",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w800),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 20),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: amenity[0]
                                                    ? Colors.green[400]
                                                    : Colors.grey[400],
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: IconButton(
                                                icon: const Icon(Icons.male),
                                                // 2
                                                color: amenity[0]
                                                    ? Colors.white
                                                    : Colors.white,
                                                // 3
                                                onPressed: () => {
                                                  setState(
                                                    () {
                                                      _scaffoldKey.currentState
                                                          ?.hideCurrentSnackBar();

                                                      _scaffoldKey.currentState
                                                          ?.showSnackBar(
                                                        showSnackBar(
                                                            amenity[0] == true
                                                                ? "Amenity - Male washroom is available"
                                                                : "Amenity - Male washroom is not available",
                                                            context,
                                                            amenity[0] == true
                                                                ? Colors
                                                                    .green[400]
                                                                : Colors.orange[
                                                                    400],
                                                            1),
                                                      );
                                                    },
                                                  ),
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: amenity[1]
                                                    ? Colors.green[400]
                                                    : Colors.grey[400],
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: IconButton(
                                                icon: const Icon(Icons.female),
                                                // 2
                                                color: amenity[1]
                                                    ? Colors.white
                                                    : Colors.white,
                                                // 3
                                                onPressed: () => {
                                                  setState(
                                                    () {
                                                      _scaffoldKey.currentState
                                                          ?.hideCurrentSnackBar();

                                                      _scaffoldKey.currentState
                                                          ?.showSnackBar(
                                                        showSnackBar(
                                                            amenity[1] == true
                                                                ? "Amenity - Female washroom is available"
                                                                : "Amenity - Female washroom is not available",
                                                            context,
                                                            amenity[1] == true
                                                                ? Colors
                                                                    .green[400]
                                                                : Colors.orange[
                                                                    400],
                                                            1),
                                                      );
                                                    },
                                                  ),
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: amenity[2]
                                                    ? Colors.green[400]
                                                    : Colors.grey[400],
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: IconButton(
                                                icon: const Icon(
                                                    Icons.child_care),
                                                // 2
                                                color: amenity[2]
                                                    ? Colors.white
                                                    : Colors.white,
                                                // 3
                                                onPressed: () => {
                                                  setState(
                                                    () {
                                                      _scaffoldKey.currentState
                                                          ?.hideCurrentSnackBar();

                                                      _scaffoldKey.currentState
                                                          ?.showSnackBar(
                                                        showSnackBar(
                                                            amenity[2] == true
                                                                ? "Amenity - Baby service is available"
                                                                : "Amenity - Baby service is not available",
                                                            context,
                                                            amenity[2] == true
                                                                ? Colors
                                                                    .green[400]
                                                                : Colors.orange[
                                                                    400],
                                                            1),
                                                      );
                                                    },
                                                  ),
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: amenity[3]
                                                    ? Colors.green[400]
                                                    : Colors.grey[400],
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: IconButton(
                                                icon: const Icon(Icons.shower),
                                                // 2
                                                color: amenity[3]
                                                    ? Colors.white
                                                    : Colors.white,
                                                // 3
                                                onPressed: () => {
                                                  setState(
                                                    () {
                                                      _scaffoldKey.currentState
                                                          ?.hideCurrentSnackBar();

                                                      _scaffoldKey.currentState
                                                          ?.showSnackBar(
                                                        showSnackBar(
                                                            amenity[3] == true
                                                                ? "Amenity - Shower is available"
                                                                : "Amenity - Shower is not available",
                                                            context,
                                                            amenity[3] == true
                                                                ? Colors
                                                                    .green[400]
                                                                : Colors.orange[
                                                                    400],
                                                            1),
                                                      );
                                                    },
                                                  ),
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: amenity[4]
                                                    ? Colors.green[400]
                                                    : Colors.grey[400],
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: IconButton(
                                                icon: const Icon(Icons.wash),
                                                // 2
                                                color: amenity[4]
                                                    ? Colors.white
                                                    : Colors.white,
                                                // 3
                                                onPressed: () => {
                                                  setState(
                                                    () {
                                                      _scaffoldKey.currentState
                                                          ?.hideCurrentSnackBar();

                                                      _scaffoldKey.currentState
                                                          ?.showSnackBar(
                                                        showSnackBar(
                                                            amenity[4] == true
                                                                ? "Amenity - Handwash is available"
                                                                : "Amenity - Handwash is not available",
                                                            context,
                                                            amenity[4] == true
                                                                ? Colors
                                                                    .green[400]
                                                                : Colors.orange[
                                                                    400],
                                                            1),
                                                      );
                                                    },
                                                  )
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: amenity[5]
                                                    ? Colors.green[400]
                                                    : Colors.grey[400],
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: IconButton(
                                                icon: const Icon(
                                                    Icons.cleaning_services),
                                                // 2
                                                color: amenity[5]
                                                    ? Colors.white
                                                    : Colors.white,
                                                // 3
                                                onPressed: () => {
                                                  setState(
                                                    () {
                                                      _scaffoldKey.currentState
                                                          ?.hideCurrentSnackBar();

                                                      _scaffoldKey.currentState
                                                          ?.showSnackBar(
                                                        showSnackBar(
                                                            "Amenity - Grooming is available",
                                                            context,
                                                            amenity[0] == true
                                                                ? Colors
                                                                    .green[400]
                                                                : Colors.orange[
                                                                    400],
                                                            1),
                                                      );
                                                    },
                                                  )
                                                },
                                              ),
                                            ),
                                          ]),
                                    ),
                                    const Text(
                                      "Service Description",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w800),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${widget.service.name.toUpperCase()} is a ${widget.service.serviceType} service located inside ${widget.service.locationType.toString()} which is owned by ${service_owner!.legalName}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                          API.protocol +
                                              API.base +
                                              API.port +
                                              API.service +
                                              "widget.user.profilePic.toString()",
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover, errorBuilder:
                                              (context, Object exception,
                                                  StackTrace? stackTrace) {
                                        return Image.asset('assets/avatar.png',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover);
                                      }),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      service_owner!.name.toString(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w800),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      service_owner!.businessNumber.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w800),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 150,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        child: GoogleMap(
                                          gestureRecognizers: <
                                              Factory<
                                                  OneSequenceGestureRecognizer>>{
                                            Factory<
                                                OneSequenceGestureRecognizer>(
                                              () => EagerGestureRecognizer(),
                                            ),
                                          },
                                          markers: _markers,
                                          onMapCreated: (controller) => {
                                            _mapController = controller,
                                            _onMapcreated(),
                                          },
                                          initialCameraPosition:
                                              _newCameraPosition,
                                          liteModeEnabled: true,
                                        ),
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

  void setCustomMarker() async {
    marker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(),
        widget.service.serviceType == "Parking"
            ? 'assets/mapmarker.png'
            : 'assets/pee_marker.png');
  }

  void _onMapcreated() {
    Marker parkMarker = Marker(
      markerId: const MarkerId("1"),
      position: serviceCoordinates,
      icon: marker,
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
            showSnackBar(widget.service.name, context, Colors.green[400], 1));
      },
    );
    setState(() {
      _markers.add(parkMarker);
      _mapController.setMapStyle(Utils.mapStyle);
    });
  }
}

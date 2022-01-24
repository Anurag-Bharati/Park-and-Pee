import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkandpee/add_service_details_park.dart';
import 'package:parkandpee/add_service_details_pee.dart';

import 'Model/map_util.dart';
import 'Model/progress_step_widget.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late TextEditingController textController1;
  late TextEditingController textController2;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    setCustomMarker();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String _selected = "1";
    return Scaffold(
      key: scaffoldKey,
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
                Stack(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: GoogleMap(
                        gestureRecognizers: <
                            Factory<OneSequenceGestureRecognizer>>{
                          Factory<OneSequenceGestureRecognizer>(
                            () => EagerGestureRecognizer(),
                          ),
                        },
                        markers: _markers,
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: const CameraPosition(
                            target:
                                LatLng(27.706381548294303, 85.33003338878844),
                            zoom: 15),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 300, 0, 0),
                    child: SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.555,
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: Center(
                                  child: Text(
                                    'Select Location & Type',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: textController1,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Your Service Location Here',
                                        hintStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'fonts/Poppins-light.ttf',
                                          fontSize: 15,
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
                                        fillColor: const Color(0xFFEFEFEF),
                                        prefixIcon: const Icon(
                                          Icons.location_on,
                                        ),
                                        suffixIcon: textController1
                                                .text.isNotEmpty
                                            ? InkWell(
                                                onTap: () => setState(
                                                  () => textController1.clear(),
                                                ),
                                                child: const Icon(
                                                  Icons.clear,
                                                  color: Colors.grey,
                                                  size: 20,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'fonts/Poppins-light.ttf',
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                    child: SizedBox(
                                      width: 60,
                                      height: 50,
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
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 5, 0, 0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
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
                                                    color: Colors.grey,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                filled: true,
                                                isDense: true,
                                                hintStyle: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey[600]),
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
                                                .map((items) =>
                                                    DropdownMenuItem(
                                                        value: items,
                                                        child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              items,
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          15),
                                                            ))))
                                                .toList(),
                                          ))),
                                ),
                              ),
                              Container(
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
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 20, 0, 0),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: ElevatedButton(
                                          child: const Text("NEXT"),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      dropDownValue == "Parking"
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
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/mapmarker.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(Marker(
          icon: mapMarker,
          markerId: const MarkerId("one"),
          position: const LatLng(27.706381548294303, 85.33003338878844),
          infoWindow: const InfoWindow(
              title: 'Softwarica College', snippet: "An IT College")));
      controller.setMapStyle(Utils.mapStyle);
    });
  }
}

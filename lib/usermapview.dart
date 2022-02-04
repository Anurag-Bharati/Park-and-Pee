// ignore_for_file: unused_field, avoid_print

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkandpee/controller/settings/Aboutus.dart';
import 'package:parkandpee/Model/widgets/scroll_behavior.dart';

class UserMapview extends StatefulWidget {
  const UserMapview({Key? key}) : super(key: key);
  double deviceHeight(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return height;
  }

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  _UserMapviewState createState() => _UserMapviewState();
}

class _UserMapviewState extends State<UserMapview> {
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  late TextEditingController textController1;

  late GoogleMapController _mapController;

  LatLng _currentLatLng = const LatLng(27.689302498968424, 85.37620522883005);
  late final CameraPosition _newCameraPosition =
      CameraPosition(target: _currentLatLng, zoom: 15);

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    // setCustomMarker();
    locateMe();
  }

  Future locateMe() async {
    final Position position = await Geolocator.getCurrentPosition();
    _currentLatLng = LatLng(position.latitude, position.longitude);
    return _currentLatLng;
  }

  double? size() {
    print("${MediaQuery.of(context).size}}");
    if (deviceHeight(context) > 1000 && deviceWidth(context) > 500) {
      return 800;
    } else {
      return 520;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),

      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: size(),
                        child: GoogleMap(
                          initialCameraPosition:
                              CameraPosition(target: _currentLatLng, zoom: 15),
                        ),
                      ),
                      Container(
                        height: 200,
                        decoration: const BoxDecoration(
                            // borderRadius: Radius.circular(radius)),
                            ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      // body: const SafeArea(
      //   // child: GoogleMap(
      //   //   initialCameraPosition: CameraPosition(target: LocateMe(), zoom: 15),
      //   // ),
      // ),
    );
  }
}

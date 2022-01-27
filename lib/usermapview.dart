import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  late CameraPosition _newCameraPosition =
      CameraPosition(target: _currentLatLng, zoom: 15);
  bool _toogleHybrid = false;

  void initState() {
    super.initState();
    textController1 = TextEditingController();
    // setCustomMarker();
    LocateMe();
  }

  Future LocateMe() async {
    final Position position = await Geolocator.getCurrentPosition();
    _currentLatLng = LatLng(position.latitude, position.longitude);
    return _currentLatLng;
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
      // body: const SafeArea(
      //   // child: GoogleMap(
      //   //   initialCameraPosition: CameraPosition(target: LocateMe(), zoom: 15),
      //   // ),
      // ),
    );
  }
}

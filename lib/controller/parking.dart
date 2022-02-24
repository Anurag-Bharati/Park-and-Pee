// ignore_for_file: deprecated_member_use, must_be_immutable

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:parkandpee/model/api.dart';

import 'package:parkandpee/model/model_core.dart' show User;
import 'package:parkandpee/model/service_factory.dart';
import 'package:parkandpee/service_owner/usermapview.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_sliders/sliders.dart';
import "package:syncfusion_flutter_core/theme.dart";

class ParkingServices extends StatefulWidget {
  User user;
  final String type;
  final LatLng coordinates;
  ParkingServices(
      {Key? key,
      required this.user,
      required this.coordinates,
      required this.type})
      : super(key: key);
  void setUser(User user) {
    this.user = user;
  }

  double deviceHeight(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return height;
  }

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  _ParkingServicesState createState() => _ParkingServicesState();
}

class _ParkingServicesState extends State<ParkingServices> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late final RefreshController refreshController;

  int currentPage = 0;
  late int totalPages;
  int pageSize = 10;

  double distance = 100;
  bool notFound = false;

  List<Content> parkingServices = [];

  @override
  void initState() {
    refreshController = RefreshController(initialRefresh: true);

    super.initState();
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

  @override
  void dispose() {
    refreshController.dispose();
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
      appBar: AppBar(
        title: const Text("ARAMB | Services"),
        elevation: 3,
        backgroundColor: const Color(0xFE242f3e), // Colors.transparent
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(children: [
        Container(
          height: 200,
          width: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "EXPLORE",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            Text(
              "OUR " + widget.type.toUpperCase() + " SERVICES",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.yellow[400],
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Text(
              "NEAR YOU",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 5),
              textAlign: TextAlign.center,
            ),
          ]),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.type == "parking"
                  ? 'assets/cover_park.jpg'
                  : 'assets/cover_pee.jpg'),
              opacity: 0.5,
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            color: Colors.black,
          ),
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            child: Column(
              children: [
                const Text(
                  "FILTER DISTANCE",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
                SfSliderTheme(
                  data: SfSliderThemeData(
                    thumbStrokeWidth: 3,
                    thumbStrokeColor: Colors.green[200],
                    thumbRadius: 13,
                  ),
                  child: SfSlider(
                    value: distance,
                    onChanged: (newValue) {
                      _scaffoldKey.currentState?.removeCurrentSnackBar();
                      _scaffoldKey.currentState?.showSnackBar(showSnackBar(
                          "Now Searching Service Within " +
                              newValue.toString() +
                              " meters",
                          context,
                          Colors.green[400],
                          3));
                      distance = newValue;
                      setState(() {});
                      EasyDebounce.debounce("filter-debouncer",
                          const Duration(milliseconds: 1500), () async {
                        await getServices(isRefresh: true);
                      });
                    },
                    showDividers: true,
                    showLabels: true,
                    interval: 100,
                    min: 0,
                    max: 500,
                    enableTooltip: true,
                    stepSize: 50,
                    minorTicksPerInterval: 1,
                    tooltipShape: const SfPaddleTooltipShape(),
                    activeColor: Colors.green[400],
                    thumbIcon: Icon(
                      Icons.directions,
                      color: Colors.green[100],
                      size: 15,
                    ),
                  ),
                ),
              ],
            )),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 0),
              child: SizedOverflowBox(
                alignment: Alignment.center,
                size: Size(double.infinity, MediaQuery.of(context).size.height),
                child: SmartRefresher(
                  controller: refreshController,
                  enablePullUp: true,
                  onRefresh: () async {
                    final result = await getServices(isRefresh: true);
                    if (result == 1) {
                      refreshController.refreshCompleted();
                    } else if (result == -1) {
                      refreshController.refreshFailed();
                    }
                  },
                  onLoading: () async {
                    final result = await getServices();
                    if (result == 1) {
                      refreshController.loadComplete();
                    } else if (result == 0) {
                      refreshController.loadNoData();
                    } else {
                      refreshController.loadFailed();
                    }
                  },
                  child: !notFound
                      ? ListView.separated(
                          itemBuilder: (context, index) {
                            final service = parkingServices[index];
                            return ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  API.protocol +
                                      API.base +
                                      API.port +
                                      service.mainPicPath,
                                  cacheHeight: 256,
                                  cacheWidth: 256,
                                  filterQuality: FilterQuality.medium,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                              title: Text(
                                service.name.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(service.locationType.toString()),
                              trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Icon(Icons.directions_walk),
                                    ),
                                    Text(
                                      getTimeTake(
                                          service.latitude, service.longitude),
                                      style: TextStyle(
                                          color: Colors.green[400],
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Icon(Icons.local_taxi),
                                    ),
                                    Text(
                                      getTimeTakeCar(
                                          service.latitude, service.longitude),
                                      style: TextStyle(
                                          color: Colors.green[400],
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ]),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UserMapView(service: service),
                                  ),
                                );
                              },
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: parkingServices.length,
                        )
                      : Lottie.asset("assets/json/404.json"),
                ),
              )),
        ),
      ]),
    );
  }

  Future<int> getServices({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 0;
    }
    print(currentPage.toString() + " " + pageSize.toString());
    final Uri uri = Uri.parse(API.getUrl(
        "service/${widget.type}?myLat=${widget.coordinates.latitude}&myLng=${widget.coordinates.longitude}&pageNo=$currentPage&pagesize=$pageSize&distance=$distance"));
    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 3));
      if (response.statusCode == 200) {
        final result = ServicesPage.fromJson(json.decode(response.body));
        if (result.content.isEmpty &&
            (!result.last || result.totalPages == 0)) {
          notFound = true;
          setState(() {});
          _scaffoldKey.currentState?.showSnackBar(showSnackBar(
              "No results found!. Try to change the filters.",
              context,
              Colors.orange[400],
              3));
          setState(() {});
          return 1;
        }
        notFound = false;

        if (isRefresh) {
          parkingServices.clear();
          parkingServices = result.content;
          totalPages = result.totalPages;
          currentPage += 1;
          setState(() {});
          return 1;
        } else {
          parkingServices.addAll(result.content);
          print("ADDED");
          currentPage += 1;
          setState(() {});
          return 1;
        }
      } else {
        return -1;
      }
    } on SocketException catch (_) {
      _scaffoldKey.currentState?.showSnackBar(showSnackBar(
          "Internet connection required", context, Colors.red[400], 2));
    } on TimeoutException catch (_) {
      _scaffoldKey.currentState?.showSnackBar(showSnackBar(
          "Server isn't responding", context, Colors.orange[400], 2));
    } on Exception catch (_) {
      _scaffoldKey.currentState?.showSnackBar(showSnackBar(
          "Sorry, someting went wrong", context, Colors.red[400], 2));
    }
    notFound = true;
    setState(() {});
    return -1;
  }

  getTimeTake(double latitude, double longitude) {
    double dLat = (widget.coordinates.latitude - latitude).abs();
    double dLng = (widget.coordinates.longitude - longitude).abs();
    double oneMeterDegree = 0.000009009;
    double merge = dLat > dLng ? dLat : dLng;
    double meter = (1 / oneMeterDegree) * merge;
    return ((meter * 2.5) / 60).toStringAsPrecision(2) + "\nmin";
  }

  getTimeTakeCar(double latitude, double longitude) {
    double dLat = (widget.coordinates.latitude - latitude).abs();
    double dLng = (widget.coordinates.longitude - longitude).abs();
    double oneMeterDegree = 0.000009009;
    double merge = dLat > dLng ? dLat : dLng;
    double meter = (1 / oneMeterDegree) * merge;
    return ((meter * 0.09) / 60).toStringAsPrecision(2) + "\nmin";
  }
}

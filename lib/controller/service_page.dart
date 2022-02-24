// ignore_for_file: deprecated_member_use, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkandpee/model/api.dart';

import 'package:parkandpee/model/model_core.dart' show User;
import 'package:parkandpee/model/service_factory.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:http/http.dart' as http;

class ParkingServices extends StatefulWidget {
  User user;
  final LatLng coordinates;
  ParkingServices({Key? key, required this.user, required this.coordinates})
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
        title: const Text("ARAMB | Park & Pee"),
        elevation: 3,
        backgroundColor: const Color(0xFE242f3e), // Colors.transparent
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
        ),
        Expanded(
          child: SizedOverflowBox(
            size: Size(double.infinity, MediaQuery.of(context).size.height),
            child: SmartRefresher(
              controller: refreshController,
              enablePullUp: true,
              onRefresh: () async {
                final result = await getServices(isRefresh: true);
                if (result == 1) {
                  refreshController.refreshCompleted();
                } else {
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
              child: ListView.separated(
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
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(service.serviceType.toString()),
                    trailing: Text(
                      service.locationType.toString(),
                      style: const TextStyle(color: Colors.green),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: parkingServices.length,
              ),
            ),
          ),
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
        "service/all?myLat=${widget.coordinates.latitude}&myLng=${widget.coordinates.longitude}&pageNo=$currentPage&pagesize=$pageSize&distance=$distance"));

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final result = ServicesPage.fromJson(json.decode(response.body));
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
  }
}

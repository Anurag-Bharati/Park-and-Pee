// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:parkandpee/controller/add_service/mapview.dart';
import 'package:parkandpee/model/api.dart';

import 'package:parkandpee/model/model_core.dart' show User;
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../Model/widgets/scroll_behavior.dart';
import 'package:http/http.dart' as http;

class SoDashBoard extends StatefulWidget {
  User user;
  SoDashBoard({Key? key, required this.user}) : super(key: key);
  void setUser(User user) {
    this.user = user;
  }

  double deviceHeight(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return height;
  }

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  _SoDashBoardState createState() => _SoDashBoardState();
}

class _SoDashBoardState extends State<SoDashBoard> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  @override
  void initState() {
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
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    decoration: const BoxDecoration(
                      color: Color(0xBD8066F2),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                fit: BoxFit.cover, errorBuilder: (context,
                                    Object exception, StackTrace? stackTrace) {
                              return Image.asset('assets/avatar.png',
                                  width: 100, height: 100, fit: BoxFit.cover);
                            }),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Greetings',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.yellow[500]),
                              ),
                              Text(
                                widget.user.legalName
                                    .toString()
                                    .split(" ")[0]
                                    .toUpperCase(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white),
                              )
                            ],
                          )
                        ]),
                  ),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.all(20),
                      child: SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 600,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0,
                                color: Color(0xB3000000),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 30, 10, 30),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: const Color(0xBD8066F2),
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            spreadRadius: 8.0,
                                            blurRadius: 0.0,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'MY IDENTITY ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            widget.user.userId.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 40,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: const Color(0xBD8066F2),
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            spreadRadius: 8.0,
                                            blurRadius: 0.0,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'MY SERVICES',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            widget.user.services != null
                                                ? widget.user.services!.length
                                                    .toString()
                                                : '0',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 40,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 30, 0, 0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    child: ElevatedButton(
                                      key: const Key("_elevatedBtn"),
                                      child: const Text("CREATE A SERVICE"),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MapView(
                                              user: widget.user,
                                            ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green[400],
                                        textStyle: const TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
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
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 50),
                                  child: const Text(
                                    'MY SERVICES',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 200.0,
                                    child: SmartRefresher(
                                      controller: refreshController,
                                      onRefresh: () async {
                                        final result = await updateUserData(
                                            isRefresh: true);
                                        if (result) {
                                          refreshController.refreshCompleted();
                                        } else {
                                          refreshController.refreshFailed();
                                        }
                                      },
                                      onLoading: () async {
                                        final result = await updateUserData();
                                        if (result) {
                                          refreshController.loadComplete();
                                        } else {
                                          refreshController.loadFailed();
                                        }
                                      },
                                      child: ListView.separated(
                                        addAutomaticKeepAlives: false,
                                        itemBuilder: (context, index) {
                                          final service =
                                              widget.user.services![index];

                                          return ListTile(
                                            leading: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image.network(
                                                API.protocol +
                                                    API.base +
                                                    API.port +
                                                    "${service.mainPicPath}",
                                                cacheHeight: 256,
                                                cacheWidth: 256,
                                                filterQuality:
                                                    FilterQuality.medium,
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
                                            subtitle: Text(
                                                service.serviceType.toString()),
                                            trailing: Text(
                                              service.locationType.toString(),
                                              style: const TextStyle(
                                                  color: Colors.green),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            const Divider(),
                                        itemCount: widget.user.services!.length,
                                      ),
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

  Future<bool> updateUserData({bool isRefresh = false}) async {
    final Uri uri = Uri.parse(API.getUrl('user/${widget.user.userId}'));
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final result = User.fromMap(json.decode(response.body));
      if (result == null) {
        return false;
      }
      if (isRefresh) {
        setState(() {
          widget.setUser(result);
        });
      }
      return true;
    } else {
      return false;
    }
  }
}

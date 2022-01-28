// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:parkandpee/Model/service.dart';
import 'package:parkandpee/add_service_success.dart';
import 'package:http/http.dart' as http;
import 'package:parkandpee/api.dart';
import 'package:parkandpee/user.dart';
import 'Model/progress_step_widget.dart';

class AddServicePhoto extends StatefulWidget {
  final Service service;
  final User user;

  const AddServicePhoto({Key? key, required this.service, required this.user})
      : super(key: key);
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<AddServicePhoto> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Uri url = Uri.parse(API.getUrl("login"));

  @override
  void initState() {
    super.initState();
  }

  // Initials for stepping sequence
  static const stepIcons = [Icons.location_on, Icons.file_copy, Icons.verified];

  bool _acceptTandC = false;
  bool _mainPhotoAdded = false;
  bool _coverPhotoAdded = false;

  // late FilePickerResult? mainPhoto;

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
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  transform: Matrix4.diagonal3Values(1.2, 1.2, 0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: Image.asset(
                    widget.service.service == "Parking"
                        ? 'assets/cover_park.jpg'
                        : 'assets/cover_pee.jpg',
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
                            curStep: 3,
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
                            'One Last Step',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'fonts/Poppins-light.ttf',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 10, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Add Service Picture',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'fonts/Poppins-light.ttf',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 10, 10, 5),
                                        child: Container(
                                            decoration: BoxDecoration(
                                              color: _mainPhotoAdded
                                                  ? Colors.green[200]
                                                  : Colors.grey[350],
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            height: 100,
                                            width: 150,
                                            child: IconButton(
                                              color: Colors.white,
                                              iconSize: 35,
                                              icon: const Icon(
                                                  Icons.insert_photo),
                                              onPressed: () async {
                                                final mainPhoto =
                                                    await FilePicker.platform
                                                        .pickFiles(
                                                  allowMultiple: false,
                                                  type: FileType.custom,
                                                  allowedExtensions: [
                                                    'png',
                                                    'jpg',
                                                    'jpeg'
                                                  ],
                                                );
                                                if (mainPhoto == null) {
                                                  _scaffoldKey.currentState
                                                      ?.showSnackBar(
                                                          showSnackBar(
                                                              "No file selected",
                                                              context,
                                                              Colors.red[400],
                                                              1));
                                                  setState(() {
                                                    _mainPhotoAdded = false;
                                                  });
                                                } else {
                                                  _scaffoldKey.currentState
                                                      ?.showSnackBar(showSnackBar(
                                                          "Picture: \"${mainPhoto.names[0].toString()}\" is selected",
                                                          context,
                                                          Colors.green[400],
                                                          2));
                                                  setState(() {
                                                    _mainPhotoAdded = true;
                                                    _asyncFileUpload(
                                                        File(mainPhoto.files
                                                            .elementAt(0)
                                                            .path
                                                            .toString()),
                                                        widget.user.id
                                                            .toString(),
                                                        "main");
                                                  });
                                                }
                                              },
                                            )),
                                      ),
                                      Text(
                                        'Main Picture',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily:
                                                'fonts/Poppins-light.ttf',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey[600]),
                                      ),
                                    ]),
                                    Column(children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 10, 10, 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: _coverPhotoAdded
                                                ? Colors.green[200]
                                                : Colors.grey[350],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          height: 100,
                                          width: 150,
                                          child: IconButton(
                                              iconSize: 35,
                                              icon: const Icon(
                                                  Icons.insert_photo),
                                              color: Colors.white,
                                              onPressed: () async {
                                                final coverPhoto =
                                                    await FilePicker.platform
                                                        .pickFiles(
                                                  allowMultiple: false,
                                                  type: FileType.custom,
                                                  allowedExtensions: [
                                                    'png',
                                                    'jpg',
                                                    'jpeg'
                                                  ],
                                                );

                                                if (coverPhoto == null) {
                                                  _scaffoldKey.currentState
                                                      ?.showSnackBar(
                                                          showSnackBar(
                                                              "No file selected",
                                                              context,
                                                              Colors.red[400],
                                                              1));
                                                  setState(() {
                                                    _coverPhotoAdded = false;
                                                  });
                                                } else {
                                                  _scaffoldKey.currentState
                                                      ?.showSnackBar(showSnackBar(
                                                          "Picture: \"${coverPhoto.names[0].toString()}\" is selected",
                                                          context,
                                                          Colors.green[400],
                                                          2));
                                                  setState(() {
                                                    _coverPhotoAdded = true;
                                                    _asyncFileUpload(
                                                        File(coverPhoto.files
                                                            .elementAt(0)
                                                            .path
                                                            .toString()),
                                                        widget.user.id
                                                            .toString(),
                                                        "cover");
                                                  });
                                                }
                                              }),
                                        ),
                                      ),
                                      Text(
                                        'Cover Picture',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'fonts/Poppins-light.ttf',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: _acceptTandC
                                          ? Colors.green[400]
                                          : Colors.grey[400],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: IconButton(
                                        icon: _acceptTandC
                                            ? const Icon(Icons.verified)
                                            : const Icon(null),
                                        iconSize: 15,
                                        // 2
                                        color: Colors.white,
                                        // 3
                                        onPressed: () => {
                                              setState(() {
                                                _acceptTandC = !_acceptTandC;
                                              })
                                            }),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'I accept the',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  TextButton(
                                    child: Text(
                                      "terms and conditions",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.red[400],
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    // ignore: todo
                                    onPressed: null, //TODO
                                    style: TextButton.styleFrom(
                                        padding: const EdgeInsets.all(5)),
                                  ),
                                ],
                              )),
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
                                      0, 10, 0, 0),
                                  child: Text(
                                    'Note: Grey means picture not added and Green means added',
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
                                      child: const Text("LETS MAKE IT!"),
                                      onPressed: () {
                                        _scaffoldKey.currentState
                                            ?.removeCurrentSnackBar();
                                        if (_acceptTandC == false) {
                                          _scaffoldKey.currentState
                                              ?.showSnackBar(showSnackBar(
                                                  "Please accept the terms and condition",
                                                  context,
                                                  Colors.red[400],
                                                  1));
                                        } else if (_coverPhotoAdded == false ||
                                            _mainPhotoAdded == false) {
                                          _scaffoldKey.currentState
                                              ?.showSnackBar(showSnackBar(
                                                  "Please add the required photo and then try again",
                                                  context,
                                                  Colors.red[400],
                                                  1));
                                        } else {
                                          _asyncUploadToDatabase();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddServiceSuccess(
                                                      service: widget.service,
                                                      user: widget.user,
                                                    )),
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: _mainPhotoAdded &&
                                                _coverPhotoAdded &&
                                                _acceptTandC
                                            ? Colors.green[400]
                                            : const Color(0xFF58B6EC),
                                        textStyle: const TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 5,
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

  _asyncUploadToDatabase() {
    //TODO
  }

  _asyncFileUpload(File file, String id, String type) async {
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest(
        "POST", Uri.parse("http://192.168.1.3:8080/api/uploadFile"));
    //add text fields
    request.fields["id"] = id;
    request.fields["type"] = type;
    //create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath("file", file.path);
    //add multipart to request
    request.files.add(pic);
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    var jsonObject = jsonDecode(responseString);
    if (type == "main") {
      widget.service.mainPicPath = jsonObject["fileDownloadUri"];
    } else {
      widget.service.coverPicPath = jsonObject["fileDownloadUri"];
    }
    print(widget.service.mainPicPath.toString() +
        " " +
        widget.service.coverPicPath.toString());
  }
}

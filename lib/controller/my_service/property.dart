// ignore_for_file: file_names, unnecessary_const, unused_field, non_constant_identifier_names, duplicate_ignore, avoid_print, deprecated_member_use
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:parkandpee/model/api.dart';
import 'package:parkandpee/service_owner/so_dashboard_concept.dart';
import 'package:path/path.dart' as p;
import '../../model/model_core.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class MyPropertyPage extends StatefulWidget {
  const MyPropertyPage({Key? key}) : super(key: key);

  @override
  _MyPropertyPagestate createState() => _MyPropertyPagestate();
}

class _MyPropertyPagestate extends State<MyPropertyPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  File? file;

  // """"""""""""""""Date Picker"""""""""""""""""""""""
  DateTime date = DateTime.now();

  final int _counter = 0;
  String? dropDownValue;
  List<String> ItemList = [
    'Parking',
    'Toilet',
    'Both',
  ];

  String? dropDownGenderValue;
  List<String> GenderList = [
    'Male',
    'Female',
    'Other',
  ];
  bool value = false;

  User user = User();
  late Uri url;
  final _formKey = GlobalKey<FormState>();

  Future save(
      GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) async {
    _scaffoldKey.currentState!.hideCurrentSnackBar();
    try {
      var res = await http
          .put(url,
              headers: {'Content-Type': 'application/json'},
              body: json.encode({
                'legal_name': user.legalName.toString(),
                'current_address': user.currentAddress.toString(),
                'business_number': user.businessNumber.toString(),
                'dob': user.dob,
                'citizenship': user.citizenship.toString(),
                'gender': user.gender.toString(),
                'is_so': true
              }))
          .timeout(
            const Duration(seconds: 2),
          );
      if (res.statusCode == 404) {
        _scaffoldKey.currentState?.showSnackBar(showSnackBar(
            "Invalid User credentials", context, Colors.red[400], 2));
      }
      if (res.statusCode == 200) {
        User newUser = User.fromMap(jsonDecode(res.body));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SoDashBoard(
              user: newUser,
            ),
          ),
        );
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
  }

  bool checkLegalName() {
    if (user.legalName == null) {
      return false;
    } else if (user.legalName!.length < 3) {
      return false;
    }
    return true;
  }

  bool checkAddress() {
    if (user.currentAddress == null) {
      return false;
    } else if (user.currentAddress!.length < 3) {
      return false;
    }
    return true;
  }

  bool checkDob() {
    return user.dob != null;
  }

  bool checkCitizenship() {
    return user.citizenship != null;
  }

  bool checkGender() {
    return user.gender != null;
  }

  bool checkContact() {
    if (user.businessNumber == null) {
      return false;
    } else if (user.businessNumber!.length != 10) {
      return false;
    }
    return true;
  }

  SnackBar showSnackBar(String message, context, Color? color, int duration) {
    final snackbar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
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
  void initState() {
    super.initState();
    url = Uri.parse(API.getUrl("user/${1}"));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? p.basename(file!.path) : 'No File Selected';
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bodybackground.png'), fit: BoxFit.fill),
      ),
      child: SafeArea(
        top: true,
        child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 120, horizontal: 10),
                    child: Column(children: [
                      const Text(
                        "Are You the Property Owner ? \n Register Now",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 24),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.transparent)),
                        child: Column(children: [
//@@@@@@@@@@@@@@@@@@@@@@ Legal Name Text Form Field @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

//@@@@@@@@@@@@@@@@@@@@@@ Close Legal Name Text Form Field @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

//@@@@@@@@@@@@@@@@@@@@@@ Address Text Form Field and DropDown @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 165,
                                  child: TextFormField(
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 16),
                                    controller: TextEditingController(
                                        text: user.legalName),
                                    onChanged: (val) {
                                      user.legalName = val;
                                    },
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 20.0,
                                                horizontal: 10.0),
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: "Legal Name",
                                        hintStyle:
                                            const TextStyle(fontSize: 16),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 2, color: Colors.black26),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        )),
                                  ),
                                ),
                                Center(
                                  child: SizedBox(
                                    width: 165,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      controller: TextEditingController(
                                          text: user.businessNumber),
                                      onChanged: (val) {
                                        user.businessNumber = val;
                                      },
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 20.0,
                                                  horizontal: 10.0),
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: "Business No.",
                                          hintStyle:
                                              const TextStyle(fontSize: 16),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: Colors.black26),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          )),
                                    ),
                                  ),
                                ),

// ~~~~~~~~~~~~~~~~~~~DropDown Butoon~~~~~~~~~~~~~~~~~~
                              ]),
                          const SizedBox(
                            height: 20,
                          ),

// @@@@@@@@@@@@@@@@@@@@@@@@ Birthdate @@@@@@@@@@@@@@@@@@@@@@@@@@
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: SizedBox(
                                    width: 165,
                                    child: TextFormField(
                                      style: const TextStyle(),
                                      controller: TextEditingController(
                                          text: user.currentAddress),
                                      onChanged: (val) {
                                        user.currentAddress = val;
                                      },
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 20.0,
                                                  horizontal: 10.0),
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: "Current Address",
                                          hintStyle:
                                              const TextStyle(fontSize: 16),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: Colors.black26),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: 60,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: DropdownButtonFormField(
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                      ),
                                      iconSize: 25,
                                      iconEnabledColor: Colors.green,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: Colors.black26),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(25.0),
                                            ),
                                          ),
                                          filled: true,
                                          hintStyle: TextStyle(
                                              color: Colors.grey[800]),
                                          hintText: "Select Gender",
                                          fillColor: Colors.white),
                                      value: dropDownGenderValue,
                                      // ignore: non_constant_identifier_names
                                      onChanged: (String? Value) {
                                        user.gender = Value;
                                        setState(() {
                                          dropDownGenderValue = Value;
                                        });
                                      },
                                      // ignore: non_constant_identifier_names
                                      items: GenderList.map((GItems) =>
                                          DropdownMenuItem(
                                              value: GItems,
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  child:
                                                      Text(GItems)))).toList(),
                                    ))
                              ]),

// @@@@@@@@@@@@@@@@@@@@@@@@ close Birthdate @@@@@@@@@@@@@@@@@@@@@@@@@@

                          const SizedBox(
                            height: 20,
                          ),
//@@@@@@@@@@@@@@@@@@@@@@ Citizen Ship And DropDown Butoon @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    height: 60,
                                    width: 155,
                                    child: ElevatedButton.icon(
                                      onPressed: () async {
                                        await selectFile(
                                            _scaffoldKey, context, user);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        primary: Colors.orange[500],
                                        onPrimary: Colors.white,
                                        textStyle:
                                            const TextStyle(fontSize: 12),
                                      ),
                                      icon: const Icon(
                                        MdiIcons.fileDocumentEditOutline,
                                      ),
                                      label: const Text("Upload Citizenship"),
                                    )),
                                SizedBox(
                                    height: 60,
                                    width: 155,
                                    child: ElevatedButton.icon(
                                      onPressed: () async {
                                        DateTime? newDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: date,
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2100));
                                        //If cancel then  null
                                        if (newDate == null) return;

                                        //if "OK" then DateTime
                                        setState(() => {date = newDate});
                                        var a = date.toString().split(" ");
                                        user.dob = a[0];
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                          Radius.circular(25),
                                        )),
                                        primary: Colors.orange[500],
                                        textStyle:
                                            const TextStyle(fontSize: 12),
                                      ),
                                      icon: const Icon(
                                        MdiIcons.calendarToday,
                                        size: 25,
                                      ),
                                      label: Text(
                                        '${date.year}/${date.month}/${date.day}',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    )),
                                const SizedBox(
                                  height: 15,
                                ),
                              ]),

//@@@@@@@@@@@@@@@@@@@@@@ Citizen Ship And DropDown Butoon @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                          const SizedBox(
                            height: 20,
                          ),

                          SizedBox(
                            child: Center(
                              child: Text(
                                'Selected: ' + fileName,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Checkbox(
                                  activeColor: Colors.orange,
                                  shape: const CircleBorder(),
                                  tristate: false,
                                  value: value,
                                  onChanged: (value) {
                                    setState(() {
                                      this.value = value!;
                                    });
                                  },
                                ),

                                const SizedBox(
                                  width: 1,
                                ), //SizedBox
                                const Text(
                                  'Agree to our Terms and Condition \n and Privacy Policy',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 15,
                                      fontFamily: "fonts/Poppins-Regular.ttf"),
                                ),
                              ]),

                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            //  padding: EdgeInsets.only(left:50),
                            height: 60,
                            width: 180,
                            child: ElevatedButton(
                              child: const Text('Register',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: "fonts/Poppins-Bold.ttf")),
                              onPressed: () {
                                if (!checkLegalName()) {
                                  _scaffoldKey.currentState?.showSnackBar(
                                      showSnackBar("Invalid Legal Name",
                                          context, Colors.red[400], 2));
                                } else if (!checkAddress()) {
                                  _scaffoldKey.currentState?.showSnackBar(
                                      showSnackBar(
                                          "Please, Provide your current address",
                                          context,
                                          Colors.red[400],
                                          2));
                                } else if (!checkContact()) {
                                  _scaffoldKey.currentState?.showSnackBar(
                                      showSnackBar("Invalid Business Number",
                                          context, Colors.red[400], 2));
                                } else if (!checkDob()) {
                                  _scaffoldKey.currentState?.showSnackBar(
                                      showSnackBar(
                                          "Please, Select your date of birth",
                                          context,
                                          Colors.red[400],
                                          2));
                                } else if (!checkGender()) {
                                  _scaffoldKey.currentState?.showSnackBar(
                                      showSnackBar(
                                          "Please, Provide your gender",
                                          context,
                                          Colors.red[400],
                                          2));
                                } else {
                                  _scaffoldKey.currentState?.showSnackBar(
                                      showSnackBar(
                                          "Now sending the request, Please wait...",
                                          context,
                                          Colors.green[400],
                                          2));
                                  EasyDebounce.debounce(
                                      "property-debouncer",
                                      const Duration(milliseconds: 1200),
                                      () => {save(_scaffoldKey, context)});
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ]),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Future selectFile(GlobalKey<ScaffoldState> scaffoldKey, BuildContext context,
      User user) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
    );

    if (result == null) {
      _scaffoldKey.currentState?.showSnackBar(
          showSnackBar("No file selected", context, Colors.red[400], 1));
      return;
    }
    _scaffoldKey.currentState?.showSnackBar(showSnackBar(
        "Picture: \"${result.names[0].toString()}\" is selected",
        context,
        Colors.green[400],
        2));
    final path = result.files.single.path!;
    _asyncFileUpload(File(result.files.elementAt(0).path.toString()),
        1.toString(), "citizenship", user);
    setState(() => file = File(path));
  }
}

_asyncFileUpload(File file, String id, String type, User user) async {
  //create multipart request for POST or PATCH method
  var request =
      http.MultipartRequest("POST", Uri.parse(API.getUrl("uploadFile")));
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

  user.citizenship = jsonObject["fileDownloadUri"];
}

// ignore_for_file: file_names, unnecessary_const, unused_field, non_constant_identifier_names, duplicate_ignore
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:path/path.dart' as p;
import 'api/firebase_api.dart';
import 'user.dart';
import 'api.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class MyPropertyPage extends StatefulWidget {
  const MyPropertyPage({Key? key}) : super(key: key);

  @override
  _MyPropertyPagestate createState() => _MyPropertyPagestate();
}

class _MyPropertyPagestate extends State<MyPropertyPage> {
  UploadTask? task;
  File? file;

  // """"""""""""""""Date Picker"""""""""""""""""""""""
  DateTime date = DateTime(2022, 12, 22);

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
  User user = User("", "", "");
  Uri url = Uri.parse(API.getUrl("register"));
  final _formKey = GlobalKey<FormState>();

  Future save() async {
    var res = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': user.name,
          'number': user.phone,
          'password': user.password
        }));
    if (res.body.isNotEmpty) {
      var a = jsonDecode(res.body);
      // ignore: avoid_print
      print(
          "Thanks ${a['name']}! Your number (${user.phone}) has been successfully registered and your ID is ${a['id']}");
      Navigator.pushNamed(context, 'verification');
    } else {
      // ignore: avoid_print
      print("User Doesn't Exists!");
    }
  }

  bool check() {
    return checkNumber() && checkPassword() && checkName();
  }

  bool checkNumber() {
    // ignore: unnecessary_null_comparison
    return user.phone != null && user.phone.length == 10;
  }

  bool checkName() {
    return user.name.length > 2 && user.name.length < 30;
  }

  bool hasNumberAndChar(String password) {
    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    return hasDigits & hasUppercase & hasLowercase & hasSpecialCharacters;
  }

  bool checkPassword() {
    // ignore: unnecessary_null_comparison
    if (user.password == null || user.confirmPass == null) {
      return false;
    } else if (user.password.length < 8) {
      return false;
    } else if (!hasNumberAndChar(user.password)) {
      return false;
    } else if (user.password != user.confirmPass) {
      return false;
    } else {
      return true;
    }
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
                    child: Form(
                        key: _formKey,
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
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Column(children: [
//@@@@@@@@@@@@@@@@@@@@@@ Legal Name Text Form Field @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                SizedBox(
                                  height: 50,
                                  child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    style: const TextStyle(color: Colors.black),
                                    controller:
                                        TextEditingController(text: user.name),
                                    onChanged: (val) {
                                      user.name = val;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Name is Empty';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                        fillColor: Colors.white,
                                        filled: true,
                                        errorStyle: const TextStyle(
                                          height: 0.008,
                                          color: Colors.redAccent,
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          borderSide: const BorderSide(
                                              color: Colors.redAccent,
                                              width: 1),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          borderSide: const BorderSide(
                                              color: Colors.blue, width: 2),
                                        ),
                                        hintText: "Enter Your Legal Name",
                                        hintStyle:
                                            const TextStyle(fontSize: 14),
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
                                const SizedBox(
                                  height: 15,
                                ),
//@@@@@@@@@@@@@@@@@@@@@@ Close Legal Name Text Form Field @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

//@@@@@@@@@@@@@@@@@@@@@@ Address Text Form Field and DropDown @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 170,
                                        child: TextFormField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          style: const TextStyle(),
                                          obscureText: true,
                                          controller: TextEditingController(
                                              text: user.password),
                                          onChanged: (val) {
                                            user.password = val;
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Current Address is Empty';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              fillColor: Colors.white,
                                              filled: true,
                                              errorStyle: const TextStyle(
                                                height: 0.008,
                                                color: Colors.redAccent,
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                borderSide: const BorderSide(
                                                    color: Colors.redAccent,
                                                    width: 1),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                borderSide: const BorderSide(
                                                    color: Colors.blue,
                                                    width: 2),
                                              ),
                                              hintText: "Current Address",
                                              hintStyle:
                                                  const TextStyle(fontSize: 14),
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

// ~~~~~~~~~~~~~~~~~~~DropDown Butoon~~~~~~~~~~~~~~~~~~
                                      SizedBox(
                                          height: 60,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: DropdownButtonFormField(
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down,
                                            ),
                                            iconSize: 25,
                                            iconEnabledColor: Colors.green,
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      width: 2,
                                                      color: Colors.black26),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                border:
                                                    const OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(25.0),
                                                  ),
                                                ),
                                                filled: true,
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[800]),
                                                hintText: "Select Services",
                                                fillColor: Colors.white),
                                            value: dropDownValue,
                                            // ignore: non_constant_identifier_names
                                            onChanged: (String? Value) {
                                              setState(() {
                                                dropDownValue = Value;
                                              });
                                            },
                                            // ignore: non_constant_identifier_names
                                            items: ItemList.map((Items) =>
                                                    DropdownMenuItem(
                                                        value: Items,
                                                        child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child:
                                                                Text(Items))))
                                                .toList(),
                                          ))
                                    ]),
                                const SizedBox(
                                  height: 15,
                                ),

// @@@@@@@@@@@@@@@@@@@@@@@@ Birthdate @@@@@@@@@@@@@@@@@@@@@@@@@@
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          height: 50,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(20),
                                                    topLeft:
                                                        Radius.circular(20))),
                                            padding: const EdgeInsets.only(
                                                left: 30, top: 15),
                                            child: Text(
                                              '${date.year}/${date.month}/${date.day}',
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          )),
                                      SizedBox(
                                          height: 50,
                                          width: 170,
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
                                              setState(() => date = newDate);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              )),
                                              primary: Colors.orange[500],
                                              textStyle:
                                                  const TextStyle(fontSize: 12),
                                            ),
                                            icon: const Icon(
                                              MdiIcons.calendarToday,
                                              size: 25,
                                            ),
                                            label: const Text(
                                                "Enter Date of Birth"),
                                          )),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ]),

// @@@@@@@@@@@@@@@@@@@@@@@@ close Birthdate @@@@@@@@@@@@@@@@@@@@@@@@@@

                                const SizedBox(
                                  height: 15,
                                ),
//@@@@@@@@@@@@@@@@@@@@@@ Citizen Ship And DropDown Butoon @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          height: 50,
                                          width: 170,
                                          child: ElevatedButton.icon(
                                            onPressed: () {
                                              selectFile();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              primary: Colors.orange[500],
                                              onPrimary: Colors.white,
                                              textStyle:
                                                  const TextStyle(fontSize: 12),
                                            ),
                                            icon: const Icon(
                                              MdiIcons.fileDocumentEditOutline,
                                            ),
                                            label: const Text(
                                                "Upload Citizenship"),
                                          )),
                                      SizedBox(
                                          height: 60,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: DropdownButtonFormField(
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down,
                                            ),
                                            iconSize: 25,
                                            iconEnabledColor: Colors.green,
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      width: 2,
                                                      color: Colors.black26),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                border:
                                                    const OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                              setState(() {
                                                dropDownGenderValue = Value;
                                              });
                                            },
                                            // ignore: non_constant_identifier_names
                                            items: GenderList.map((GItems) =>
                                                    DropdownMenuItem(
                                                        value: GItems,
                                                        child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child:
                                                                Text(GItems))))
                                                .toList(),
                                          ))
                                    ]),

//@@@@@@@@@@@@@@@@@@@@@@ Citizen Ship And DropDown Butoon @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 300,
                                  child: Text(
                                    fileName,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(children: <Widget>[
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
                                        fontFamily:
                                            "fonts/Poppins-Regular.ttf"),
                                  ),
                                ]),

                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                    //  padding: EdgeInsets.only(left:50),
                                    height: 40,
                                    width: 150,
                                    child: ElevatedButton(
                                        child: const Text('Register',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily:
                                                    "fonts/Poppins-Bold.ttf")),
                                        onPressed: () {
                                          uploadFile();
                                          if (_formKey.currentState!
                                              .validate()) {
                                            if (check()) {
                                              save();
                                            } else {
                                              // ignore: avoid_print
                                              print("Invalid Credentials");
                                            }
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.green,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                        ))),
                              ]))
                        ])),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = p.basename(file!.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}

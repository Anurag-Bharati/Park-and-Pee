// ignore_for_file: file_names, unnecessary_const, unused_field, non_constant_identifier_names, duplicate_ignore
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'user.dart';
import 'api.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class MyProperyPage extends StatefulWidget {
  const MyProperyPage({Key? key}) : super(key: key);

  @override
  _MyProperyPagestate createState() => _MyProperyPagestate();
}

class _MyProperyPagestate extends State<MyProperyPage> {
  final int _counter = 0;
  String? dropDownValue;
  List<String> ItemList = [
    'Parking',
    'Toilet',
    'Both',
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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/insidebackground.png'), fit: BoxFit.fill),
      ),
      child: SafeArea(
        top: true,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Stack(
             children: [
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
                              fontFamily: "fonts/Poppins-Bold.ttf",
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 5,
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
                                      hintText: "Enter Your Legal Name",
                                      hintStyle:
                                          const TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: 50,
                                child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  style: const TextStyle(color: Colors.black),
                                  controller:
                                      TextEditingController(text: user.phone),
                                  onChanged: (val) {
                                    user.phone = val;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Citizenship Number is Empty';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.fromLTRB(
                                              10, 0, 0, 0),
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: "Citizenship Number",
                                      hintStyle:
                                          const TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
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
                                            hintText: "Current Address",
                                            hintStyle:
                                                const TextStyle(fontSize: 14),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            )),
                                      ),
                                    ),

// ~~~~~~~~~~~~~~~~~~~DropDown Butoon~~~~~~~~~~~~~~~~~~
                                    SizedBox(
                                        height: 60,
                                        width: 170,
                                        child: DropdownButtonFormField(
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                          ),
                                          iconSize: 25,
                                          iconEnabledColor: Colors.green,
                                          decoration: InputDecoration(
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
                                              hintText: "Name",
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
                              SizedBox(
                                height: 50,
                                child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  style: const TextStyle(),
                                  obscureText: true,
                                  controller: TextEditingController(
                                      text: user.confirmPass),
                                  onChanged: (val) {
                                    user.confirmPass = val;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Date of Birth is Empty';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.fromLTRB(
                                              10, 0, 0, 0),
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: "Date of Birth",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
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
            ),)]
          ),
        ),
      ),
    );
  }
}

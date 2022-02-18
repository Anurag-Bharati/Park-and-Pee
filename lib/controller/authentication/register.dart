// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:parkandpee/controller/authentication/verification.dart';
import 'package:parkandpee/model/model_core.dart';

import '../../Model/api.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool value = false;
  String? confirmPass;

  // DUMMY_VALUE
  User user = User(userId: 1);
  Uri url = Uri.parse(API.getUrl("user/auth"));

  Future save(
      GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) async {
    try {
      String encodedPass = base64.encode(utf8.encode(user.password.toString()));
      var res = await http
          .post(url,
              headers: {'Content-Type': 'application/json'},
              body: json.encode({
                'name': user.name,
                'number': user.number.toString(),
                'password': user.password
              }))
          .timeout(
            const Duration(seconds: 2),
          );
      if (res.statusCode == 404) {
        _scaffoldKey.currentState?.showSnackBar(showSnackBar(
            "Invalid User credentials", context, Colors.red[400], 2));
      }
      if (res.statusCode == 202) {
        // TODO Transfer user
        Navigator.pushNamed(context, 'navbar');
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

  bool checkNull() {
    return user.number != null && user.name != null;
  }

  bool checkNumber() {
    return user.number!.length == 10;
  }

  bool checkName() {
    return user.name!.length > 2 && user.name!.length < 30;
  }

  bool hasNumberAndChar(String password) {
    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    return hasDigits & hasUppercase & hasLowercase & hasSpecialCharacters;
  }

  bool checkPasswordLength() {
    return user.password!.length < 8;
  }

  bool checkPasswordMatch() {
    return user.password != confirmPass;
  }

  SnackBar showSnackBar(String message, context, Color? color, int duration) {
    FocusScope.of(context).unfocus();
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
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/LRVBackground.png'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
              child: Padding(
            padding: (MediaQuery.of(context).size.height > 1000 &&
                    MediaQuery.of(context).size.width > 500)
                ? const EdgeInsets.only(
                    top: 350, left: 25, right: 25, bottom: 300)
                : const EdgeInsets.only(
                    top: 310, left: 25, right: 25, bottom: 300),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: TextEditingController(text: user.name),
                    onChanged: (val) {
                      user.name = val;
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Full Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                    controller: TextEditingController(text: user.number),
                    onChanged: (val) {
                      user.number = val;
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Contact Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    style: TextStyle(),
                    obscureText: true,
                    controller: TextEditingController(text: user.password),
                    onChanged: (val) {
                      user.password = val;
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    style: TextStyle(),
                    obscureText: true,
                    controller: TextEditingController(text: confirmPass),
                    onChanged: (val) {
                      confirmPass = val;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Confirm Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 5.5,
                  ),
                  height: 50,
                  width: 150,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // ignore: unrelated_type_equality_checks
                      if (!checkNull()) {
                        _scaffoldKey.currentState?.showSnackBar(showSnackBar(
                            "Please fill up all the fields",
                            context,
                            Colors.red[400],
                            3));
                      } else if (!checkNumber()) {
                        _scaffoldKey.currentState?.showSnackBar(showSnackBar(
                            "Invalid Phone number",
                            context,
                            Colors.red[400],
                            3));
                      } else if (checkPasswordLength()) {
                        _scaffoldKey.currentState?.showSnackBar(showSnackBar(
                            "Password must be 8 character long",
                            context,
                            Colors.red[400],
                            3));
                      } else if (checkPasswordMatch()) {
                        _scaffoldKey.currentState?.showSnackBar(showSnackBar(
                            "Confirm Password and Password does not match",
                            context,
                            Colors.red[400],
                            3));
                      } else {
                        _scaffoldKey.currentState?.removeCurrentSnackBar();
                        _scaffoldKey.currentState?.showSnackBar(showSnackBar(
                            "Trying to log in, Please Wait..." +
                                user.name.toString(),
                            context,
                            Colors.green[400],
                            2));
                        EasyDebounce.debounce(
                            'reg-debouncer', const Duration(milliseconds: 1200),
                            () {
                          save(
                            _scaffoldKey,
                            context,
                          );
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[500],
                      padding: const EdgeInsets.only(left: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    label: Icon(
                      MdiIcons.arrowRightBoldCircle,
                      size: 40,
                      color: Colors.blue[800],
                    ),
                    icon: const Text(
                      "SIGN UP",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "fonts/Poppins-Bold.ttf"),
                    ),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                // ignore: prefer_const_literals_to_create_immutables

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                          fontFamily: "fonts/Poppins-Regular.ttf"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'login');
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            fontFamily: "fonts/Poppins-Bold.ttf",
                            color: Color.fromARGB(1000, 42, 111, 249),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}

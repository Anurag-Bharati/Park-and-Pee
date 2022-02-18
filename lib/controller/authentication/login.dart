// ignore_for_file: unnecessary_null_comparison, deprecated_member_use

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:http/http.dart' as http;
import 'package:parkandpee/model/model_core.dart' show User;
import '../../Model/api.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool value = false;
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
    return user.number != null;
  }

  bool checkNumber() {
    return user.number!.length == 10;
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
    if (user.password == null) {
      return false;
    } else if (user.password!.length < 8) {
      return false;
    } else if (!hasNumberAndChar(user.password.toString())) {
      return true;
    } else {
      return true;
    }
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
        body: SingleChildScrollView(
          child: Padding(
            padding: (MediaQuery.of(context).size.height > 1000 &&
                    MediaQuery.of(context).size.width > 500)
                ? const EdgeInsets.only(
                    top: 350, left: 25, right: 25, bottom: 300)
                : const EdgeInsets.only(
                    top: 310, left: 25, right: 25, bottom: 300),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.black),
                    controller: TextEditingController(text: user.number),
                    onChanged: (val) {
                      user.number = val;
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Contact Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    obscureText: true,
                    controller: TextEditingController(text: user.password),
                    onChanged: (val) {
                      user.password = val;
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "fonts/Poppins-SemiBold.ttf",
                            color: Colors.blue[500]),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'forgetpassword');
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontWeight: FontWeight.w700),
                      ),
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
                            _scaffoldKey.currentState?.showSnackBar(
                                showSnackBar("Please fill up all the fields",
                                    context, Colors.red[400], 3));
                          } else if (!checkNumber()) {
                            _scaffoldKey.currentState?.showSnackBar(
                                showSnackBar("Invalid Phone number", context,
                                    Colors.red[400], 3));
                          } else if (!checkPassword()) {
                            _scaffoldKey.currentState?.showSnackBar(
                                showSnackBar("Password does not match", context,
                                    Colors.red[400], 3));
                          } else {
                            _scaffoldKey.currentState?.removeCurrentSnackBar();
                            _scaffoldKey.currentState?.showSnackBar(
                                showSnackBar(
                                    "Trying to log in, Please Wait..." +
                                        user.name.toString(),
                                    context,
                                    Colors.green[400],
                                    2));
                            EasyDebounce.debounce('login-debouncer',
                                const Duration(milliseconds: 1200), () {
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
                          color: Colors.blue[800],
                          size: 40,
                        ),
                        icon: const Text(
                          "SIGN IN",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "fonts/Poppins-Bold.ttf"),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(children: const <Widget>[
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                    height: 20,
                  )),
                  Text(
                    "OR",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                  )),
                ]),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SignInButton(
                      Buttons.GoogleDark,
                      mini: false,
                      onPressed: () {},
                    ),
                    SignInButton(
                      Buttons.Facebook,
                      mini: true,
                      onPressed: () {
                        Navigator.pushNamed(context, 'admin');
                      },
                    ),
                    SignInButton(
                      Buttons.Apple,
                      mini: true,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have Account?",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                          fontFamily: "fonts/Poppins-Regular.ttf"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'register');
                      },
                      child: const Text(
                        'Sign up',
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
          ),
        ),
      ),
    );
  }
}

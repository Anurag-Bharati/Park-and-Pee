// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:http/http.dart' as http;

import 'user.dart';
import 'api.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
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
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/LRVBackground.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            PageView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(left: 35, right: 35, top: 320 - 45),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 320,
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
                                        EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Full Name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: 320,
                              height: 50,
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                style: TextStyle(color: Colors.black),
                                controller:
                                    TextEditingController(text: user.phone),
                                onChanged: (val) {
                                  user.phone = val;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Contact is Empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Contact Number",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: 320,
                              height: 50,
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                style: TextStyle(),
                                obscureText: true,
                                controller:
                                    TextEditingController(text: user.password),
                                onChanged: (val) {
                                  user.password = val;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password is Empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: 320,
                              height: 50,
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                style: TextStyle(),
                                obscureText: true,
                                controller: TextEditingController(
                                    text: user.confirmPass),
                                onChanged: (val) {
                                  user.confirmPass = val;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Confirm Password is Empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Confirm Password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "     Please, Fill up all details.",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                      fontFamily: "fonts/Poppins-Regular.ttf"),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                    //  padding: EdgeInsets.only(left:50),
                                    height: 40,
                                    width: 150,
                                    child: ElevatedButton(
                                        child: Text('SIGN UP',
                                            style: TextStyle(
                                                fontSize: 20,
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
                                          primary: Colors.deepPurpleAccent[400],
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                        ))),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            // ignore: prefer_const_literals_to_create_immutables
                            Row(children: <Widget>[
                              Expanded(
                                  child: Divider(
                                color: Colors.black,
                                height: 20,
                              )),
                              Text(
                                "OR",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              Expanded(
                                  child: Divider(
                                color: Colors.black,
                              )),
                            ]),
                            SizedBox(
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
                                  onPressed: () {},
                                ),
                                SignInButton(
                                  Buttons.Apple,
                                  mini: true,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(padding: EdgeInsets.only(right: 5)),
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
                                        color:
                                            Color.fromARGB(1000, 42, 111, 249),
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

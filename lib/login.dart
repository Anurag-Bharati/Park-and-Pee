// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:http/http.dart' as http;
import 'user.dart';
import 'api.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool value = false;
  User user = User("", "", "");
  Uri url = Uri.parse(API.getUrl("login"));
  final _formKey = GlobalKey<FormState>();

  Future save() async {
    var res = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'number': user.phone, 'password': user.password}));
    if (res.body.isNotEmpty) {
      var a = jsonDecode(res.body);
      // ignore: avoid_print
      print("Welcome ${a['name']}! Your ID is ${a['id']}");
      Navigator.pushNamed(context, 'homepage');
    } else {
      // ignore: avoid_print
      print("User Doesn't Exists!");
    }
  }

  bool check() {
    return checkNumber() && checkPassword();
  }

  bool checkNumber() {
    return user.phone != null && user.phone.length == 10;
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
    } else if (user.password.length < 8) {
      return false;
    } else if (!hasNumberAndChar(user.password)) {
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
              image: AssetImage('assets/LRVBackground.png'), fit: BoxFit.fill),
        ),
        child: SafeArea(
          top: true,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 250, horizontal: 10),
                            child: Form(
                                key: _formKey,
                                child: Column(children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 24, horizontal: 24),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                            color: Colors.transparent)),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 50,
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            controller: TextEditingController(
                                                text: user.phone),
                                            onChanged: (val) {
                                              user.phone = val;
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Contact No is Empty';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 0, 0, 0),
                                                fillColor: Colors.white,
                                                filled: true,
                                                hintText: "Contact Number",
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
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            obscureText: true,
                                            controller: TextEditingController(
                                                text: user.password),
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
                                                
                                                    const EdgeInsets.fromLTRB(
                                                        10, 0, 0, 0),
                                                fillColor: Colors.white,
                                                filled: true,
                                                hintText: "Password",
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                )),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric( vertical:0,horizontal: 50,),
                                          // padding:
                                          //     const EdgeInsets.only(left: 165),
                                          child: TextButton(
                                            child: const Text(
                                              'Forgot Password',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily:
                                                      "fonts/Poppins-SemiBold.ttf",
                                                  color: Color.fromARGB(
                                                      1000, 49, 53, 49)),
                                            ),
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, 'forgetpassword');
                                            },
                                            style: ElevatedButton.styleFrom(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                      Row(
                                        mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                        children: [
                                        Row(
                                          children: <Widget>[
                                            Checkbox(
                                              value: value,
                                              onChanged: (value) {
                                                setState(() {
                                                  this.value = value!;
                                                });
                                              },
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ), //SizedBox
                                            const Text(
                                              'Remember me',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily:
                                                      "fonts/Poppins-Regular.ttf"),
                                            ),
                                            ]
                                            ),
                                            Container(
                                          padding: const EdgeInsets.symmetric( vertical:0,horizontal: 5.5,),
                                              height: 40,
                                              width: 130,
                                              child: ElevatedButton.icon(
                                                  onPressed: () {
                                                    // ignore: unrelated_type_equality_checks

                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      if (check()) {
                                                        save();
                                                      } else {
                                                        // ignore: avoid_print
                                                        print(
                                                            "Invalid Credentials");
                                                      }
                                                    }
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors
                                                        .deepPurpleAccent[400],
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25)),
                                                  ),
                                                  label: const Icon(
                                                    MdiIcons
                                                        .arrowRightBoldCircle,
                                                    size: 40,
                                                  ),
                                                  icon: const Text("SIGN IN",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontFamily:
                                                              "fonts/Poppins-Bold.ttf"))),
                                            ),
                                          ],),
                                        
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Don't Have Account?",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 18,
                                                  fontFamily:
                                                      "fonts/Poppins-Regular.ttf"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, 'register');
                                              },
                                              child: const Text(
                                                'Sign up',
                                                style: TextStyle(
                                                    fontFamily:
                                                        "fonts/Poppins-Bold.ttf",
                                                    color: Color.fromARGB(
                                                        1000, 42, 111, 249),
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ]
                                )
                                )
                                )
                      ],
                    ),
                
                ),
              ],
            ),
          ),
        )
        );
  }
}

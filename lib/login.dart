import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class MyLogin extends StatefulWidget {                                                                                                 
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
                      padding: EdgeInsets.only(
                        top: deviceHeight(context) * 0.4,
                        left: deviceWidth(context) * 0.06,
                        right: deviceWidth(context) * 0.06,
                        // bottom: deviceHeight(context) * 0.0,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 320,
                            height: 50,
                            child: TextField(
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Contact Number",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 320,
                            height: 50,
                            child: TextField(
                              style: const TextStyle(),
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 165),
                            child: TextButton(
                              child: const Text(
                                'Forgot Password',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "fonts/Poppins-SemiBold.ttf",
                                    color: Color.fromARGB(1000, 49, 53, 49)),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, 'register');
                              },
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
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
                                    fontFamily: "fonts/Poppins-Regular.ttf"),
                              ),

                              // const SizedBox(width: 15),
                              //SizedBox
                              Container(
                                margin: EdgeInsets.only(
                                  left: deviceWidth(context) * 0.06,
                                ),
                                height: 40,
                                width: 130,
                                child: ElevatedButton.icon(
                                    onPressed: () { Navigator.pushNamed(context, 'verification');},
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.deepPurpleAccent[400],
                                      padding: const EdgeInsets.only(left: 15),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                    label: const Icon(
                                      MdiIcons.arrowRightBoldCircle,
                                      size: 40,
                                    ),
                                    icon: const Text("SIGN IN",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily:
                                                "fonts/Poppins-Bold.ttf"))),
                              )
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
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Expanded(
                                child: Divider(
                              color: Colors.black,
                            )
                            ),
                          ]
                          ),
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
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: deviceWidth(context) * 0.04,
                                  right: deviceWidth(context) * 0.04,
                                ),
                              ),
                              
                              const Text(
                                "Don't Have Account?",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18,
                                    fontFamily: "fonts/Poppins-Regular.ttf"),
                              ),
                              const SizedBox(width: 30,),
                              TextButton(

                                onPressed: () {
                                  Navigator.pushNamed(context, 'register');
                                },
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                      fontFamily: "fonts/Poppins-Bold.ttf",
                                      color: Color.fromARGB(1000, 42, 111, 249),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
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

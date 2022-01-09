// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
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
              children:[
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35,top: 320),
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
                            child: TextField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
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
                            child: TextField(
                              style: TextStyle(),
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
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 320,
                            height: 50,
                            child: TextField(
                              style: TextStyle(),
                              obscureText: true,
                              decoration: InputDecoration(
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
                                "Invalid Credentials \n Please Enter Again",
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
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.deepPurpleAccent[400],
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                      )
                                      )
                                      ),
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

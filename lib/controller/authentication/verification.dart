// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parkandpee/controller/home/navbar.dart';
import 'package:pinput/pin_put/pin_put.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class MyVerification extends StatefulWidget {
  final String phone;
  // ignore: use_key_in_widget_constructors
  const MyVerification(this.phone, {Key? key}) : super(key: key);

  @override
  _MyVerificationstate createState() => _MyVerificationstate();
}

class _MyVerificationstate extends State<MyVerification> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  late String _verificationCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/LRVBackground.png'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        key: _scaffoldkey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  'Verification',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Enter the OTP code has been sent to",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  widget.phone,
                  style: const TextStyle(
                    color: Color(0xFFFFD100),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  // padding: const EdgeInsets.all(28),
                  padding: const EdgeInsets.only(
                      top: 50, left: 28, right: 28, bottom: 50),
                  // margin: const EdgeInsets.only(top:50),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.black12)),
                  child: Column(
                    children: [
                      PinPut(
                        fieldsCount: 6,
                        textStyle: const TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                        eachFieldWidth: 45.0,
                        eachFieldHeight: 45.0,
                        focusNode: _pinPutFocusNode,
                        controller: _pinPutController,
                        submittedFieldDecoration: pinPutDecoration,
                        selectedFieldDecoration: pinPutDecoration,
                        followingFieldDecoration: pinPutDecoration,
                        pinAnimationType: PinAnimationType.fade,
                        onSubmit: (pin) async {
                          print("submitting...");
                          try {
                            await FirebaseAuth.instance
                                .signInWithCredential(
                                    PhoneAuthProvider.credential(
                                        verificationId: _verificationCode,
                                        smsCode: pin))
                                .then((value) async {
                              if (value.user != null) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Mynavbar()));
                              }
                              print("lol");
                            });
                          } catch (e) {
                            print(e);

                            FocusScope.of(context).unfocus();
                            // ignore: deprecated_member_use
                            _scaffoldkey.currentState?.showSnackBar(
                                const SnackBar(content: Text('invalid OTP')));
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                          //  padding: EdgeInsets.only(left:50),
                          height: 40,
                          width: 150,
                          child: ElevatedButton(
                              child: const Text('Verify',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "fonts/Poppins-Bold.ttf")),
                              onPressed: () {
                                Navigator.pushNamed(context, 'newpassword');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurpleAccent[400],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                              ))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Didn't received the code?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                    // height: 2,
                    ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '');
                  },
                  child: const Text(
                    'Resend New Code',
                    style: TextStyle(
                        fontFamily: "fonts/Poppins-Bold.ttf",
                        color: Color.fromARGB(1000, 42, 111, 249),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+977${widget.phone}',
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            _verificationCode = verificationId;
          });
        },
        timeout: const Duration(seconds: 60),
        codeSent: (String verificationId, int? forceResendingToken) {
          _verificationCode = verificationId;
        },
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await FirebaseAuth.instance
              .signInWithCredential(phoneAuthCredential)
              .then((value) async {
            if (value.user != null) {
              print("User Logged in");
            }
          });
        },
        verificationFailed: (FirebaseAuthException error) {
          print(error.stackTrace);
          print(error.message);
        });
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }
}

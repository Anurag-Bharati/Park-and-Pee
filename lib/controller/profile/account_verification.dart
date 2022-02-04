import 'package:flutter/material.dart';

import 'package:pinput/pin_put/pin_put.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class MyAccountVerification extends StatefulWidget {
  final String phone;
  // ignore: use_key_in_widget_constructors
  const MyAccountVerification(this.phone, {Key? key}) : super(key: key);

  @override
  _MyVerificationstate createState() => _MyVerificationstate();
}

class _MyVerificationstate extends State<MyAccountVerification> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      //APP BAR COLOR
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF937FEE), // Colors.transparent
        ),
      ),

      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF6A6A),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFF937FEE),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 1),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width,
                      maxHeight: MediaQuery.of(context).size.height * 0.7,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0,
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, -15),
                          spreadRadius: 10,
                        ),
                        BoxShadow(
                          blurRadius: 0,
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          offset: Offset(0, -30),
                          spreadRadius: 15,
                        ),
                        BoxShadow(
                          blurRadius: 0,
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          offset: Offset(0, -45),
                          spreadRadius: 20,
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Container(
                      transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 10),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                transform:
                                    Matrix4.translationValues(0.0, -20.0, 0.0),
                                width: 125,
                                height: 125,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    'assets/avatar.png',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Text(
                                  'CHANGES VERIFICATION',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'fonts/Poppins-light.ttf',
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Text(
                                  'Authentication Code',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'fonts/Poppins-light.ttf',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  child: PinPut(
                                      fieldsCount: 6,
                                      textStyle: const TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.white,
                                      ),
                                      eachFieldWidth: 45.0,
                                      eachFieldHeight: 45.0,
                                      focusNode: _pinPutFocusNode,
                                      controller: _pinPutController,
                                      submittedFieldDecoration:
                                          pinPutDecoration,
                                      selectedFieldDecoration: pinPutDecoration,
                                      followingFieldDecoration:
                                          pinPutDecoration,
                                      pinAnimationType: PinAnimationType.fade,
                                      onSubmit: (pin) {
                                        // TODO
                                        print("submitting...");
                                        FocusScope.of(context).unfocus();
                                        scaffoldkey.currentState?.showSnackBar(
                                            const SnackBar(
                                                content: Text('invalid OTP')));
                                      }),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Text(
                                  'A six digit auth code has been sent to',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Text(
                                  '984485XXXXX',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Color(0xFFFFCA4E),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 30, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 130,
                                      height: 40,
                                      child: ElevatedButton(
                                        child: const Text("BACK"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          print('Button pressed ...');
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: const Color(0xFFFF6363),
                                            textStyle: const TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                            side: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)))),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 130,
                                      height: 40,
                                      child: ElevatedButton(
                                        child: const Text("DONE"),
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: const Color(0xFF58EC7B),
                                          textStyle: const TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                          side: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // TODO Function For firebase auth
  @override
  void initState() {
    super.initState();
  }
}

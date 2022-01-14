// ignore_for_file: file_names, unnecessary_const

import 'package:flutter/material.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class MyAccountPageEdit extends StatefulWidget {
  const MyAccountPageEdit({Key? key}) : super(key: key);

  @override
  _MyAccountPageEditstate createState() => _MyAccountPageEditstate();
}

class _MyAccountPageEditstate extends State<MyAccountPageEdit> {
  String dropDownValue = "";
  late TextEditingController textController4;
  late TextEditingController textController3;
  late TextEditingController textController1;
  late TextEditingController textController2;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // final List<String> _locations = ['MALE', 'FEMALE', 'OTHER'].toList();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController(text: 'MOHAN BASNET');
    textController2 = TextEditingController(
        text:
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis.');
    textController3 = TextEditingController();
    textController4 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.zero,
          child: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xFF937FEE), // Colors.transparent
          ),
        ),
        body: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFFF5F5F5),
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
                          color: const Color(0xFFFF6A6A),
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
                          height: MediaQuery.of(context).size.height * 0.70,
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width,
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.70,
                          ),
                          decoration: const BoxDecoration(
                            color: const Color(0xFFEEEEEE),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0,
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(0, -15),
                                spreadRadius: 0.1,
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: const Radius.circular(0),
                              topLeft: Radius.circular(80),
                              topRight: const Radius.circular(80),
                            ),
                            shape: BoxShape.rectangle,
                          ),
                          alignment: const AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                30, 115, 30, 30),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextFormField(
                                  controller: textController1,
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    hintText: 'YOUR NAME',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Please provide a valid name';
                                    }
                                    if (val.length < 3) {
                                      return 'The name must be 3 character long';
                                    }
                                    return null;
                                  },
                                ),
                                const Text(
                                  'USER ID : 00001',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFFF5D5D),
                                    fontSize: 18,
                                  ),
                                ),
                                TextFormField(
                                  controller: textController2,
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    hintText: 'DESCRIBE ABOUT YOURSELF',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF424242),
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  validator: (val) {
                                    if (val!.length < 3) {
                                      return 'Requires at least 3 characters.';
                                    }
                                    return null;
                                  },
                                ),
                                const Divider(
                                  height: 20,
                                  thickness: 2,
                                  color: Color(0x7A000000),
                                ),
                                const Text(
                                  'MY INFO',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 21,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Location',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          'Gender',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 200,
                                          height: 23,
                                          decoration: const BoxDecoration(),
                                          child: TextFormField(
                                            controller: textController3,
                                            obscureText: false,
                                            decoration: const InputDecoration(
                                              hintText: 'Nepal,Ktm',
                                              hintStyle: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Poppins',
                                                fontSize: 18,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontFamily: 'Poppins',
                                              fontSize: 18,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          height: 23,
                                          decoration: const BoxDecoration(),
                                          child: TextFormField(
                                            controller: textController4,
                                            obscureText: false,
                                            decoration: const InputDecoration(
                                              hintText: 'Male',
                                              hintStyle: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Poppins',
                                                fontSize: 18,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontFamily: 'Poppins',
                                              fontSize: 18,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(
                                  height: 15,
                                  thickness: 2,
                                  color: Color(0x7A000000),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment:
                                        const AlignmentDirectional(0, -0.3),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 130,
                                          height: 40,
                                          child: ElevatedButton(
                                            child: const Text("CANCLE"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              print('Button pressed ...');
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary:
                                                    const Color(0xFFFF6363),
                                                textStyle: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                                side: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                shape:
                                                    const BeveledRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)))),
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
                                                primary:
                                                    const Color(0xFF58EC7B),
                                                textStyle: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                                side: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                shape:
                                                    const BeveledRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)))),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, -0.5),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 50, 0, 380),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.height * 1,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      'assets/avatar.png',
                                      width:
                                          MediaQuery.of(context).size.width * 1,
                                      height:
                                          MediaQuery.of(context).size.width * 1,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0, -0.60),
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width * 1,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              1,
                                      decoration: const BoxDecoration(
                                        color: const Color(0xA7000000),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.add_box_outlined,
                                          color: Color(0xCBFFFFFF),
                                          size: 50,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ),
                                  ),
                                ],
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
          ),
        ));
  }
}

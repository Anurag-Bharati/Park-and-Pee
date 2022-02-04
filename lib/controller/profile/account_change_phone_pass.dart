// ignore_for_file: file_names, unnecessary_const, avoid_print
import 'package:flutter/material.dart';
import 'package:parkandpee/controller/profile/account_verification.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class MyAccountPageChange extends StatefulWidget {
  const MyAccountPageChange({Key? key}) : super(key: key);

  @override
  _MyAccountPagestate createState() => _MyAccountPagestate();
}

class _MyAccountPagestate extends State<MyAccountPageChange> {
  late TextEditingController textController1;
  late bool passwordVisibility1;
  late TextEditingController textController2;
  late bool passwordVisibility2;
  late TextEditingController textController3;
  late bool passwordVisibility3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    passwordVisibility1 = false;
    textController2 = TextEditingController();
    passwordVisibility2 = false;
    textController3 = TextEditingController();
    passwordVisibility3 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                    color: const Color(0xFF937FEE),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0.6),
                  child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.75,
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                        maxHeight: MediaQuery.of(context).size.height * 0.75,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
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
                          topRight: const Radius.circular(40),
                        ),
                        shape: BoxShape.rectangle,
                      ),
                      alignment: const AlignmentDirectional(0, 0),
                      child: Container(
                        transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30, 0, 30, 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  transform: Matrix4.translationValues(
                                      0.0, -20.0, 0.0),
                                  width: 125,
                                  height: 125,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    height:
                                        MediaQuery.of(context).size.height * 1,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.asset(
                                        'assets/avatar.png',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                1,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                child: Text(
                                  'Change Phone Number',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'fonts/Poppins-light.ttf',
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Text(
                                  'Enter New Contact Number',
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'fonts/Poppins-light.ttf',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 5, 0, 0),
                                child: TextFormField(
                                  controller: textController1,
                                  obscureText: !passwordVisibility1,
                                  decoration: InputDecoration(
                                    hintText: 'Your Phone Number Here',
                                    hintStyle: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'fonts/Poppins-light.ttf',
                                      fontSize: 15,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFE4E4E4),
                                    prefixIcon: const Icon(
                                      Icons.contact_phone,
                                      color: Color(0xFF303030),
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => passwordVisibility1 =
                                            !passwordVisibility1,
                                      ),
                                      child: Icon(
                                        passwordVisibility1
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: const Color(0xFF303030),
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'fonts/Poppins-light.ttf',
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.start,
                                  keyboardType: TextInputType.phone,
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: Text(
                                  'Change Your Password ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'fonts/Poppins-light.ttf',
                                    fontSize: 23,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Text(
                                  'Enter The Old Password',
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'fonts/Poppins-light.ttf',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 5, 0, 0),
                                child: TextFormField(
                                  controller: textController2,
                                  obscureText: !passwordVisibility2,
                                  decoration: InputDecoration(
                                    hintText: 'Your Old Password Here',
                                    hintStyle: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'fonts/Poppins-light.ttf',
                                      fontSize: 15,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: const Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFE4E4E4),
                                    prefixIcon: const Icon(
                                      Icons.vpn_key,
                                      color: Color(0xFF303030),
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => passwordVisibility2 =
                                            !passwordVisibility2,
                                      ),
                                      child: Icon(
                                        passwordVisibility2
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: const Color(0xFF303030),
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'fonts/Poppins-light.ttf',
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.start,
                                  keyboardType: TextInputType.phone,
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Text(
                                  'Enter New Password',
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'fonts/Poppins-light.ttf',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 5, 0, 0),
                                child: TextFormField(
                                  controller: textController3,
                                  obscureText: !passwordVisibility3,
                                  decoration: InputDecoration(
                                    hintText: 'Your New Passoword \nHere',
                                    hintStyle: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'fonts/Poppins-light.ttf',
                                      fontSize: 15,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: const Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFE4E4E4),
                                    prefixIcon: const Icon(
                                      Icons.vpn_key,
                                      color: const Color(0xFF303030),
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => passwordVisibility3 =
                                            !passwordVisibility3,
                                      ),
                                      child: Icon(
                                        passwordVisibility3
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: const Color(0xFF303030),
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'fonts/Poppins-light.ttf',
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.start,
                                  keyboardType: TextInputType.phone,
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
                                        child: const Text("CANCLE"),
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
                                        child: const Text("NEXT"),
                                        onPressed: () {
                                          //TODO
                                          print('Button pressed ...');

                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const MyAccountVerification(
                                                          "")));
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
}

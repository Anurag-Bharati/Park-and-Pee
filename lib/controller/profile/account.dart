// ignore_for_file: file_names, unnecessary_const, avoid_print

import 'package:flutter/material.dart';
import 'package:parkandpee/model/api.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  _MyAccountPagestate createState() => _MyAccountPagestate();
}

class _MyAccountPagestate extends State<MyAccountPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          backgroundColor:
              const Color.fromRGBO(64, 224, 208, 1), // Colors.transparent
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
                    color: const Color.fromRGBO(64, 224, 208, 1),
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
                    child: Container(
                      transform: Matrix4.translationValues(0.0, -80.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              transform:
                                  Matrix4.translationValues(0.0, 10.0, 0.0),
                              width: 125,
                              height: 125,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 1,
                                height: MediaQuery.of(context).size.height * 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(
                                      API.getUrl("IMAGE LINK TODO"),
                                      width:
                                          MediaQuery.of(context).size.width * 1,
                                      height:
                                          MediaQuery.of(context).size.width * 1,
                                      fit: BoxFit.cover, errorBuilder: (context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                    return Image.asset(
                                      'assets/avatar.png',
                                      width:
                                          MediaQuery.of(context).size.width * 1,
                                      height:
                                          MediaQuery.of(context).size.width * 1,
                                      fit: BoxFit.cover,
                                    );
                                  }),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(1, 0),
                              child: Container(
                                transform:
                                    Matrix4.translationValues(0.0, -15, 0.0),
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    const BoxShadow(
                                      blurRadius: 5,
                                      color: const Color(0x63000000),
                                      spreadRadius: 1,
                                    )
                                  ],
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.create,
                                    color: Colors.black,
                                    size: 26,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                    Navigator.pushNamed(
                                        context, 'account_edit');
                                  },
                                ),
                              ),
                            ),
                            const Text(
                              'MOHAN BASNET',
                              style: TextStyle(
                                fontFamily: 'fonts/Poppins-light.ttf',
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Text(
                              'USER ID : 00001',
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: 'fonts/Poppins-light.ttf',
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'fonts/Poppins-light.ttf',
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Divider(
                              height: 25,
                              thickness: 2,
                              color: Color(0x7A000000),
                            ),
                            const Text(
                              'MY INFO',
                              style: TextStyle(
                                fontFamily: 'fonts/Poppins-light.ttf',
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Contact',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'fonts/Poppins-light.ttf',
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'Location',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'fonts/Poppins-light.ttf',
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'Gender',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'fonts/Poppins-light.ttf',
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'Position',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'fonts/Poppins-light.ttf',
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'Reputation',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'fonts/Poppins-light.ttf',
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '98480XXXXX',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'fonts/Poppins-light.ttf',
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'Nepal , KTM',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'fonts/Poppins-light.ttf',
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'MALE',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'fonts/Poppins-light.ttf',
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'Customer',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'fonts/Poppins-light.ttf',
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      '8.4/10',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'fonts/Poppins-light.ttf',
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              height: 25,
                              thickness: 2,
                              color: Color(0x7A000000),
                            ),
                            TextButton(
                              onPressed: () {
                                print('Button pressed ...');
                                Navigator.pushNamed(
                                    context, 'account_change_phone_pass');
                              },
                              child: const Text(
                                'Change Number or Password',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  height: 1,
                                  fontFamily: 'fonts/Poppins-light.ttf',
                                  color: Colors.red,
                                  fontSize: 18,
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
    );
  }
}

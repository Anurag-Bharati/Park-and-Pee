import 'package:flutter/material.dart';

class Myadmin extends StatefulWidget {
  const Myadmin({Key? key}) : super(key: key);

  @override
  _MyadminState createState() => _MyadminState();
}

class _MyadminState extends State<Myadmin> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/admin-4.png'), fit: BoxFit.fill),
        ),
        child: SafeArea(
          top: true,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Form(
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 5, right: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 5, top: 10),
                                                child: SizedBox(
                                                  child: Text(
                                                    "17th January, 2022",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15, top: 10),
                                                child: SizedBox(
                                                  child: Text(
                                                    "Hello, Admin",
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0, right: 25),
                                            child: Column(
                                              children: const [
                                                CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      'assets/anurag.jpg'),
                                                  radius: 35,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, top: 40),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              // Padding(
                                              //     padding: EdgeInsets.only(
                                              //         top: 30, left: 100)),
                                              Container(
                                                height: 80,
                                                width: 160,
                                                decoration: BoxDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                          begin: Alignment
                                                              .bottomLeft,
                                                          end: Alignment
                                                              .topRight,
                                                          colors: [
                                                        Color(0xffE8BECB),
                                                        Color(0xff745CCC)
                                                      ]),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.7),
                                                      spreadRadius: 7,
                                                      blurRadius: 9,
                                                      offset:
                                                          const Offset(2, 3),
                                                    ),
                                                  ],
                                                ),
                                                child: Column(
                                                  children: const [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 2),
                                                      child: Text(
                                                        "Active Parking Spaces",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "fonts/Poppins-light.ttf",
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 0),
                                                      child: Text(
                                                        "54",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "fonts/Poppins-light.ttf",
                                                            fontSize: 25,
                                                            color: Color(
                                                                0xff0B2E82),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        textAlign:
                                                            TextAlign.end,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              // Padding(
                                              //     padding: EdgeInsets.only(
                                              //         top: 40, left: 100)),
                                              Container(
                                                height: 80,
                                                width: 160,
                                                decoration: BoxDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                          begin: Alignment
                                                              .bottomLeft,
                                                          end: Alignment
                                                              .topRight,
                                                          colors: [
                                                        Color(0xffE8BECB),
                                                        Color(0xff745CCC),
                                                      ]),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.7),
                                                      spreadRadius: 7,
                                                      blurRadius: 9,
                                                      offset:
                                                          const Offset(2, 3),
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                child: Column(
                                                  children: const [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 2,
                                                          right: 2,
                                                          left: 2),
                                                      child: Text(
                                                        "Active   Washrooms",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "fonts/Poppins-light.ttf",
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 0),
                                                      child: Text(
                                                        "67",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "fonts/Poppins-light.ttf",
                                                            fontSize: 25,
                                                            color: Color(
                                                                0xff0B2E82),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        textAlign:
                                                            TextAlign.end,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 50, left: 50, right: 30),
                        child: Container(
                          height: 100,
                          width: 200,
                          color: Colors.white.withOpacity(0.5),
                          child: const Text("hello"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

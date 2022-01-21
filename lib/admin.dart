// import 'dart:js';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class Myadmin extends StatefulWidget {
  const Myadmin({Key? key}) : super(key: key);

  @override
  _MyadminState createState() => _MyadminState();
}

class _MyadminState extends State<Myadmin> {
  List<PieChartSectionData> data = [
    PieChartSectionData(title: "", color: Colors.red, value: 30),
    PieChartSectionData(title: "", color: Colors.green, value: 20),
    PieChartSectionData(title: "", color: Colors.orange, value: 30),
    PieChartSectionData(title: "", color: Colors.blue, value: 40),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Color(0xff001D41)
            // image: DecorationImage(

            //     image: AssetImage('assets/admin-4.png'), fit: BoxFit.fill),
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
                                      top: 5, left: 0, right: 0, bottom: 0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 180,
                                        width: 390,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent),
                                        child: Row(
                                          children: [
                                            //for pie chart ie graph
                                            Container(
                                              width: 200,
                                              height: 180,
                                              decoration: const BoxDecoration(
                                                  color: Colors.transparent),
                                              child: PageView(
                                                children: <Widget>[
                                                  PieChart(
                                                    PieChartData(
                                                      sections: data,
                                                      centerSpaceRadius:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              8,
                                                      sectionsSpace: 0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),

                                            Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 25, top: 15),
                                                  child: Container(
                                                      child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          "Active Parking spaces",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          "Inactive parkinh Spaces",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: const Text(
                                                          "Active Washroom Spaces",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          "Inactive Washroom Spaces",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )

                                      //   Column(
                                      //     children: [
                                      //       // Padding(
                                      //       //     padding: EdgeInsets.only(
                                      //       //         top: 30, left: 100)),
                                      //       Container(
                                      //         height: 80,
                                      //         width: 160,
                                      //         decoration: BoxDecoration(
                                      //           gradient:
                                      //               const LinearGradient(
                                      //                   begin: Alignment
                                      //                       .bottomLeft,
                                      //                   end: Alignment
                                      //                       .topRight,
                                      //                   colors: [
                                      //                 Color(0xffE8BECB),
                                      //                 Color(0xff745CCC)
                                      //               ]),
                                      //           borderRadius:
                                      //               BorderRadius.circular(25),
                                      //           boxShadow: [
                                      //             BoxShadow(
                                      //               color: Colors.black
                                      //                   .withOpacity(0.7),
                                      //               spreadRadius: 7,
                                      //               blurRadius: 9,
                                      //               offset:
                                      //                   const Offset(2, 3),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //         child: Column(
                                      //           children: const [
                                      //             Padding(
                                      //               padding: EdgeInsets.only(
                                      //                   top: 2),
                                      //               child: Text(
                                      //                 "Active Parking Spaces",
                                      //                 style: TextStyle(
                                      //                     fontFamily:
                                      //                         "fonts/Poppins-light.ttf",
                                      //                     fontSize: 18,
                                      //                     fontWeight:
                                      //                         FontWeight
                                      //                             .bold),
                                      //                 textAlign:
                                      //                     TextAlign.center,
                                      //               ),
                                      //             ),
                                      //             Padding(
                                      //               padding: EdgeInsets.only(
                                      //                   top: 0),
                                      //               child: Text(
                                      //                 "54",
                                      //                 style: TextStyle(
                                      //                     fontFamily:
                                      //                         "fonts/Poppins-light.ttf",
                                      //                     fontSize: 25,
                                      //                     color: Color(
                                      //                         0xff0B2E82),
                                      //                     fontWeight:
                                      //                         FontWeight
                                      //                             .bold),
                                      //                 textAlign:
                                      //                     TextAlign.end,
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      //   Column(
                                      //     children: [
                                      //       // Padding(
                                      //       //     padding: EdgeInsets.only(
                                      //       //         top: 40, left: 100)),
                                      //       Container(
                                      //         height: 80,
                                      //         width: 160,
                                      //         decoration: BoxDecoration(
                                      //           gradient:
                                      //               const LinearGradient(
                                      //                   begin: Alignment
                                      //                       .bottomLeft,
                                      //                   end: Alignment
                                      //                       .topRight,
                                      //                   colors: [
                                      //                 Color(0xffE8BECB),
                                      //                 Color(0xff745CCC),
                                      //               ]),
                                      //           boxShadow: [
                                      //             BoxShadow(
                                      //               color: Colors.black
                                      //                   .withOpacity(0.7),
                                      //               spreadRadius: 7,
                                      //               blurRadius: 9,
                                      //               offset:
                                      //                   const Offset(2, 3),
                                      //             ),
                                      //           ],
                                      //           borderRadius:
                                      //               BorderRadius.circular(25),
                                      //         ),
                                      //         child: Column(
                                      //           children: const [
                                      //             Padding(
                                      //               padding: EdgeInsets.only(
                                      //                   top: 2,
                                      //                   right: 2,
                                      //                   left: 2),
                                      //               child: Text(
                                      //                 "Active   Washrooms",
                                      //                 style: TextStyle(
                                      //                     fontFamily:
                                      //                         "fonts/Poppins-light.ttf",
                                      //                     fontSize: 18,
                                      //                     fontWeight:
                                      //                         FontWeight
                                      //                             .bold),
                                      //                 textAlign:
                                      //                     TextAlign.center,
                                      //               ),
                                      //             ),
                                      //             Padding(
                                      //               padding: EdgeInsets.only(
                                      //                   top: 0),
                                      //               child: Text(
                                      //                 "67",
                                      //                 style: TextStyle(
                                      //                     fontFamily:
                                      //                         "fonts/Poppins-light.ttf",
                                      //                     fontSize: 25,
                                      //                     color: Color(
                                      //                         0xff0B2E82),
                                      //                     fontWeight:
                                      //                         FontWeight
                                      //                             .bold),
                                      //                 textAlign:
                                      //                     TextAlign.end,
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),

                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Container(
                          height: 530,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft,
                                  colors: [
                                    Color(0xff4B36F5),
                                    Color(0xffD6D4E9)
                                  ]),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 25, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 160,
                                          decoration: BoxDecoration(
                                            color: Color(0xffAA00FF),
                                            // gradient: const LinearGradient(
                                            //     begin: Alignment.bottomLeft,
                                            //     end: Alignment.topRight,
                                            //     colors: [
                                            //       Color(0xffE8BECB),
                                            //       Color(0xff745CCC)
                                            //     ]),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                spreadRadius: 7,
                                                blurRadius: 9,
                                                offset: const Offset(2, 3),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: const [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 2),
                                                child: Text(
                                                  "Active Parking Spaces",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "fonts/Poppins-light.ttf",
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 0),
                                                child: Text(
                                                  "54",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "fonts/Poppins-light.ttf",
                                                      fontSize: 25,
                                                      color: Color(0xff0B2E82),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.end,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
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
                                            color: Color(0xff30DBE2),
                                            // gradient: const LinearGradient(
                                            //     begin: Alignment.bottomLeft,
                                            //     end: Alignment.topRight,
                                            //     colors: [
                                            //       Color(0xffE8BECB),
                                            //       Color(0xff745CCC),
                                            //     ]),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                spreadRadius: 7,
                                                blurRadius: 9,
                                                offset: const Offset(2, 3),
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Column(
                                            children: const [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 2, right: 2, left: 2),
                                                child: Text(
                                                  "Active   Washrooms",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          "fonts/Poppins-light.ttf",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 0),
                                                child: Text(
                                                  "67",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "fonts/Poppins-light.ttf",
                                                      fontSize: 25,
                                                      color: Color(0xff0B2E82),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.end,
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
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // color: Colors.white,
                                      height: 320,
                                      width: 350,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: Colors.white
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //     color:
                                          //         Colors.black.withOpacity(0.7),
                                          //     spreadRadius: 7,
                                          //     blurRadius: 9,
                                          //     offset: const Offset(2, 3),
                                          //   ),
                                          // ],
                                          ),

                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 25),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    const Text(
                                                      "Recent Activities",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "fonts/Poppins-Bold.ttf",
                                                          fontSize: 23,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.red),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          //Recent Activities 1st
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, top: 15, right: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    const CircleAvatar(
                                                      backgroundImage: AssetImage(
                                                          "assets/bijay.jpg"),
                                                      radius: 28,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 0),
                                                      child: Text(
                                                        "Bijay Gautam               ",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "fonts/Poppins-Bold.ttf",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    Text(
                                                        "Changed profile picture")
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text("17th Jan 2022"),
                                                    Text(
                                                      "               low",
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 15),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),

                                          //Recent Activities 2nd
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, top: 20, right: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    const CircleAvatar(
                                                      backgroundImage: AssetImage(
                                                          "assets/aayush.png"),
                                                      radius: 28,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 0),
                                                      child: Text(
                                                        "Aayush raj joshi           ",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "fonts/Poppins-Bold.ttf",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    Text(
                                                        "Changed price rates      ")
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text("23th Jan 2022"),
                                                    Text(
                                                      "               high",
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 15),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),

                                          //Recent Activities 3rd
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, top: 20, right: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    const CircleAvatar(
                                                      backgroundImage: AssetImage(
                                                          "assets/bhai1.png"),
                                                      radius: 28,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 0),
                                                      child: Text(
                                                        "Rohan Khadka           ",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "fonts/Poppins-Bold.ttf",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    Text(
                                                        "Closed service             ")
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text("23th Jan 2022"),
                                                    Text(
                                                      "               high",
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 15),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      // Padding(
                      //   padding:
                      //       const EdgeInsets.only(top: 50, left: 50, right: 30),
                      //   child: Container(
                      //     height: 100,
                      //     width: 200,
                      //     color: Colors.white.withOpacity(0.5),
                      //     child: const Text("hello"),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

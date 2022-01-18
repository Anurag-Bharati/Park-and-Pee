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
              image: AssetImage('assets/admin3.png'), fit: BoxFit.fill),
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
                                Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0, left: 5, right: 5),
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
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            

                                            


                                            
                                            
                                          )


                                        ],

                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

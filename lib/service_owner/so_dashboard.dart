import 'package:flutter/material.dart';

class MySoDashboard extends StatefulWidget {
  const MySoDashboard({ Key? key }) : super(key: key);

  @override
  _MySoDashboardState createState() => _MySoDashboardState();
}

class _MySoDashboardState extends State<MySoDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top:70, left:14),
        child: Column(
          children: [
            Container(
              height: 140,
              width: 364,
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Daily Earning',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(height: 6,),
                    Text(
                      'NRs 200',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(height: 6,),
                    Text(
                      'Daily Request: 5',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),   
            ),

            const SizedBox(height: 25,),
            Container(
              height: 277,
              width: 364,
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12,),
                  Row(
                    children: const [
                      SizedBox(width: 20,),
                      Text(
                        "Toilet",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      )
                     
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Container(
                    height: 82,
                    width: 332,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10,),
                        Container(
                          height: 58,
                          width: 58,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:  AssetImage('assets/account.png'), fit: BoxFit.cover
                            )
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            children: const [
                              Text(
                                "ANURAG BHARATI", 
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black
                                ),
                              ),
                              Text(
                                "PARKING|TOILET", 
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 55,bottom: 5, left: 30),
                          child: const Text(
                          "18 Jan 2022", 
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black
                          ),
                        ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    children: const [
                      SizedBox(width: 20,),
                      Text(
                        "Parking",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 82,
                    width: 332,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10,),
                        Container(
                          height: 58,
                          width: 58,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:  AssetImage('assets/account.png'), fit: BoxFit.cover
                            )
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            children: const [
                              Text(
                                "ANURAG BHARATI", 
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black
                                ),
                              ),
                              Text(
                                "PARKING|TOILET", 
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 55,bottom: 5, left: 30),
                          child: const Text(
                          "18 Jan 2022", 
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black
                          ),
                        ),
                        )
                      ],
                    ),
                  ),
                ],
              ),            
            ),

            const SizedBox(height: 25,),
            Container(
              height: 220,
              width: 364,
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Container(
                    height: 82,
                    width: 332,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10,),
                        Container(
                          height: 58,
                          width: 58,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:  AssetImage('assets/account.png'), fit: BoxFit.cover
                            )
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            children: const [
                              Text(
                                "ANURAG BHARATI", 
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black
                                ),
                              ),
                              Text(
                                "PARKING|TOILET", 
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 55,bottom: 5, left: 30),
                          child: const Text(
                          "18 Jan 2022", 
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black
                          ),
                        ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    height: 82,
                    width: 332,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10,),
                        Container(
                          height: 58,
                          width: 58,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:  AssetImage('assets/account.png'), fit: BoxFit.cover
                            )
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            children: const [
                              Text(
                                "ANURAG BHARATI", 
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black
                                ),
                              ),
                              Text(
                                "PARKING|TOILET", 
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 55,bottom: 5, left: 30),
                          child: const Text(
                          "18 Jan 2022", 
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black
                          ),
                        ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
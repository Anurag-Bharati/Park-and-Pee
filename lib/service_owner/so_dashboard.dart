import 'package:flutter/material.dart';

class MySoDashboard extends StatefulWidget {
  const MySoDashboard({ Key? key }) : super(key: key);

  @override
  _MySoDashboardState createState() => _MySoDashboardState();
}

class _MySoDashboardState extends State<MySoDashboard> {
  bool isSwitched = false;
  bool isSwitched1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top:55, left:14),
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
            const SizedBox(height: 2,),
            Container(
              padding: const EdgeInsets.only(right: 250, top: 15),
              child: Column (
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                  "My Request",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 2,),
            Container(
              height: 277,
              width: 364,
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 1,),
                  Row(
                    children: [
                      const SizedBox(width: 20,),
                      const Text(
                        "Toilet",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      const SizedBox(width: 180,),
                      Row(
                        children: [
                          Switch(
                            activeColor: Colors.green,
                            inactiveThumbColor: Colors.red,
                            activeTrackColor: Colors.greenAccent,
                            inactiveTrackColor: Colors.redAccent,
                            value: isSwitched,
                            onChanged: (value){
                              setState(() {
                              isSwitched = value;  
                              });
                            }
                          ),
                          if(isSwitched == true)
                            (const Text("Online",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),))
                          else
                            (const Text("Offline",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),))
                        ],
                      )
                    ],
                  ),
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
                  const SizedBox(height: 2,),
                  Row(
                    children:  [
                      const SizedBox(width: 20,),
                      const Text(
                        "Parking",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white
                        ),
                      ),
                      const SizedBox(width: 160,),
                      Row(
                        children: [
                          Switch(
                            activeColor: Colors.green,
                            inactiveThumbColor: Colors.red,
                            activeTrackColor: Colors.greenAccent,
                            inactiveTrackColor: Colors.redAccent,
                            value: isSwitched1,
                            onChanged: (value){
                              setState(() {
                              isSwitched1 = value; 
                              });
                            }
                          ),
                          if(isSwitched1 == true)
                            (const Text("Online",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),))
                          else
                            (const Text("Offline",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),))
                        ],
                      )
                    ],
                  ),
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
            const SizedBox(height: 2,),
            Container(
              padding: const EdgeInsets.only(right: 230, top: 15),
              child: Column (
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                  "Recent Request",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 2,),
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
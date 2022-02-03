import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MySoStatement extends StatefulWidget {
  const MySoStatement({ Key? key }) : super(key: key);

  @override
  _MySoStatementState createState() => _MySoStatementState();
}

class _MySoStatementState extends State<MySoStatement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF7F7F7),
      body: Container(
        padding: const EdgeInsets.symmetric(),
        child:  Column(
          children: [
            Container(
              width: 394,
              height: 130,
              decoration: const BoxDecoration(
                color: Color(0xBD8066F2),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30)
                )
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 60, top:70),
                child: (
                  const Text("STATEMENT", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),)
                ),
              ),
            ),
            Expanded(child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 260, top: 5),
                    child: Column (
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "21 Jan",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    height: 82,
                    width: 340,
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
                          margin: const EdgeInsets.only(top: 13, bottom: 10),
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
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
                              ),
                              Text(
                                "10:44 AM", 
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16,bottom: 5, left: 33),
                          child: Column(
                            children: const [
                              Icon(
                                FontAwesomeIcons.angleDoubleDown,
                                color: Colors.green,
                                size: 20
                              ),
                              Text(
                                "Rs 10", 
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.green,
                                  fontWeight:FontWeight.bold
                                ),
                              ),
                            ],
                          )                          
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 82,
                    width: 340,
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
                          margin: const EdgeInsets.only(top: 13, bottom: 10),
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
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
                              ),
                              Text(
                                "10:44 AM", 
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16,bottom: 5, left: 33),
                          child: Column(
                            children: const [
                              Icon(
                                FontAwesomeIcons.angleDoubleDown,
                                color: Colors.green,
                                size: 20
                              ),
                              Text(
                                "Rs 10", 
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.green,
                                  fontWeight:FontWeight.bold
                                ),
                              ),
                            ],
                          )                          
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    padding: const EdgeInsets.only(right: 260, top: 5),
                    child: Column (
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "21 Jan",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    height: 82,
                    width: 340,
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
                          margin: const EdgeInsets.only(top: 13, bottom: 10),
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
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
                              ),
                              Text(
                                "10:44 AM", 
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16,bottom: 5, left: 33),
                          child: Column(
                            children: const [
                              Icon(
                                FontAwesomeIcons.angleDoubleDown,
                                color: Colors.green,
                                size: 20
                              ),
                              Text(
                                "Rs 10", 
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.green,
                                  fontWeight:FontWeight.bold
                                ),
                              ),
                            ],
                          )                          
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 82,
                    width: 340,
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
                          margin: const EdgeInsets.only(top: 13, bottom: 10),
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
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
                              ),
                              Text(
                                "10:44 AM", 
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16,bottom: 5, left: 33),
                          child: Column(
                            children: const [
                              Icon(
                                FontAwesomeIcons.angleDoubleDown,
                                color: Colors.green,
                                size: 20
                              ),
                              Text(
                                "Rs 10", 
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.green,
                                  fontWeight:FontWeight.bold
                                ),
                              ),
                            ],
                          )                          
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 82,
                    width: 340,
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
                          margin: const EdgeInsets.only(top: 13, bottom: 10),
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
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
                              ),
                              Text(
                                "10:44 AM", 
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16,bottom: 5, left: 33),
                          child: Column(
                            children: const [
                              Icon(
                                FontAwesomeIcons.angleDoubleDown,
                                color: Colors.green,
                                size: 20
                              ),
                              Text(
                                "Rs 10", 
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.green,
                                  fontWeight:FontWeight.bold
                                ),
                              ),
                            ],
                          )                          
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    padding: const EdgeInsets.only(right: 260, top: 5),
                    child: Column (
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "21 Jan",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    height: 82,
                    width: 340,
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
                          margin: const EdgeInsets.only(top: 13, bottom: 10),
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
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
                              ),
                              Text(
                                "10:44 AM", 
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16,bottom: 5, left: 33),
                          child: Column(
                            children: const [
                              Icon(
                                FontAwesomeIcons.angleDoubleDown,
                                color: Colors.green,
                                size: 20
                              ),
                              Text(
                                "Rs 10", 
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.green,
                                  fontWeight:FontWeight.bold
                                ),
                              ),
                            ],
                          )                          
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 82,
                    width: 340,
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
                          margin: const EdgeInsets.only(top: 13, bottom: 10),
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
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
                              ),
                              Text(
                                "10:44 AM", 
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16,bottom: 5, left: 33),
                          child: Column(
                            children: const [
                              Icon(
                                FontAwesomeIcons.angleDoubleDown,
                                color: Colors.green,
                                size: 20
                              ),
                              Text(
                                "Rs 10", 
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.green,
                                  fontWeight:FontWeight.bold
                                ),
                              ),
                            ],
                          )                          
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 82,
                    width: 340,
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
                          margin: const EdgeInsets.only(top: 13, bottom: 10),
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
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
                              ),
                              Text(
                                "10:44 AM", 
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16,bottom: 5, left: 33),
                          child: Column(
                            children: const [
                              Icon(
                                FontAwesomeIcons.angleDoubleDown,
                                color: Colors.green,
                                size: 20
                              ),
                              Text(
                                "Rs 10", 
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.green,
                                  fontWeight:FontWeight.bold
                                ),
                              ),
                            ],
                          )                          
                        )
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),),
          ],     
        ),
      )
    );
  }
}
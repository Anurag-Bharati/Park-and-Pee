import 'package:flutter/material.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class MyNewPassword extends StatefulWidget {
  const MyNewPassword({Key? key}) : super(key: key);

  @override
  _MyNewPasswordstate createState() => _MyNewPasswordstate();
}

class _MyNewPasswordstate extends State<MyNewPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/LRVBackground.png'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  'Create a new Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  // padding: const EdgeInsets.all(28),
                  padding: const EdgeInsets.only(top:30,left:28,right:28,bottom: 30),
                  // margin: const EdgeInsets.only(top:50),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.black12)
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                            width: 320,
                            height: 50,
                            child: TextField(
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "New Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  )),
                            ),
                          ),
                      const SizedBox(
                        height: 30,
                      ),    
                      SizedBox(
                            width: 320,
                            height: 50,
                            child: TextField(
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Confirm Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  )),
                            ),
                          ),    
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                      //  padding: EdgeInsets.only(left:50),
                      height: 40,
                      width: 150,
                      child: ElevatedButton(
                          child: const Text('Continue',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily:
                                      "fonts/Poppins-Bold.ttf")),
                          onPressed: () {
                            Navigator.pushNamed(context, 'navbar');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurpleAccent[400],
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(25)),
                          )
                          )
                          ),
                    ],
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

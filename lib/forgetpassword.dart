import 'package:flutter/material.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class MyForgetPassword extends StatefulWidget {
  const MyForgetPassword({Key? key}) : super(key: key);

  @override
  _MyForgetPasswordstate createState() => _MyForgetPasswordstate();
}

class _MyForgetPasswordstate extends State<MyForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/LRVBackground.png'), fit: BoxFit.cover),
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
                  'Forget Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  // padding: const EdgeInsets.all(28),
                  padding: const EdgeInsets.only(top:50,left:28,right:28,bottom: 50),
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
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Contact Number",
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
                          child: const Text('Send',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily:
                                      "fonts/Poppins-Bold.ttf")),
                          onPressed: () {
                            Navigator.pushNamed(context, 'verification');
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

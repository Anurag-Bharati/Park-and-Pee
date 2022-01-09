import 'package:flutter/material.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

class MyVerification extends StatefulWidget {
  const MyVerification({Key? key}) : super(key: key);

  @override
  _MyVerificationstate createState() => _MyVerificationstate();
}

class _MyVerificationstate extends State<MyVerification> {
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
                  'Verification',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Enter the OTP code sent to your number ",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _textFieldOTP(first: true, last: false),
                          _textFieldOTP(first: false, last: false),
                          _textFieldOTP(first: false, last: false),
                          _textFieldOTP(first: false, last: false),
                          _textFieldOTP(first: false, last: false),
                          _textFieldOTP(first: false, last: true),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                      //  padding: EdgeInsets.only(left:50),
                      height: 40,
                      width: 150,
                      child: ElevatedButton(
                          child: const Text('Verify',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily:
                                      "fonts/Poppins-Bold.ttf")),
                          onPressed: () {
                            Navigator.pushNamed(context, 'homepage');
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
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Didn't received the code?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  // height: 2,
                ),
                 TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '');
                  },
                  child: const Text(
                    'Resend New Code',
                    style: TextStyle(
                        fontFamily: "fonts/Poppins-Bold.ttf",
                        color: Color.fromARGB(1000, 42, 111, 249),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP({required bool first, last}) {
    return SizedBox(
      height: 42,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: true,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(13)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.purple),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}

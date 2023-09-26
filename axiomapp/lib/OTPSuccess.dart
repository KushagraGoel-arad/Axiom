import 'package:axiomapp/signin_create.dart';
import 'package:flutter/material.dart';

class otpSuccess extends StatefulWidget {
  const otpSuccess({super.key});

  @override
  State<otpSuccess> createState() => _otpSuccessState();
}

class _otpSuccessState extends State<otpSuccess> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: height * 0.2,
        ),
        Image.asset("images/complete_valid.png"),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16),
            child: Text(
              "OTP Verified Successfully ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 56, 55, 55),
                  fontSize: 30),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.08,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16),
            child: Text(
              "User authentication is done",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 56, 55, 55),
                  fontSize: 30),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.15,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              width: 100,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => signinCreate(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(2), // Button border radius
                    side: BorderSide(
                        color:
                            Color.fromARGB(255, 22, 103, 170)), // Border color
                  ),
                ),
                child:
                    // Icon(Icons.cancel),
                    // SizedBox(
                    //   width: 7,
                    // ),
                    Text(
                  'Close',
                  style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 5, 49, 86),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

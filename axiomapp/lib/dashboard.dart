import 'package:axiomapp/Widgets/navBar.dart';
import 'package:axiomapp/dashboard1.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(65, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text("LOGIN.GOV"),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: 25, color: Colors.black54),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Welcome ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: 'kushagra.goel@gmail.com',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Text("|"),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: 25, color: Colors.black54),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign out',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Add your navigation logic here, e.g., open a URL or navigate to a screen
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: height * 0.5,
            child: Column(children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16),
                  child: Text(
                    "Enter Incorporation Information",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 56, 55, 55),
                        fontSize: 20),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16),
                  child: Text(
                    "Start Year",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(221, 59, 59, 59),
                        fontSize: 14),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 190,
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 8),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 182, 224, 242),
                        //labelText: 'Email Address',
                        //labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 10, 10, 10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 22, 103, 170)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                height: 120,
                width: 550,
                padding: EdgeInsets.symmetric(horizontal: 0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 244, 237, 237),
                  border: Border.all(
                    color: Colors.black26,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(1.0),
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(fontSize: 25, color: Colors.black54),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Start Year ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: 'could be',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: SizedBox(
                        width: 180,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your button click logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Button border radius
                              side: BorderSide(
                                  color: Colors.black54), // Border color
                            ),
                          ),
                          child:
                              // Icon(Icons.cancel),
                              // SizedBox(
                              //   width: 7,
                              // ),
                              Row(
                            children: [
                              Icon(Icons.cancel),
                              SizedBox(width: 7),
                              Text(
                                'CANCEL',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: const Color.fromARGB(255, 5, 49, 86),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: SizedBox(
                              width: 180,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add your button click logic here
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 220, 240,
                                      198), // Light green background color
                                  foregroundColor: Color.fromARGB(255, 72, 177,
                                      75), // Text/icon color when pressed
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25), // Button border radius
                                    side: BorderSide(
                                        color: Colors.green), // Border color
                                  ),
                                ),
                                child: Text(
                                  'PREVIOUS',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color:
                                          const Color.fromARGB(255, 6, 43, 74),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: SizedBox(
                              width: 180,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  //_isNextButtonPressed = true;
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 140, 249,
                                      156), // Light green background color
                                  // Text/icon color when pressed
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25), // Button border radius
                                    // Border color
                                  ),
                                ),
                                child: Text(
                                  'NEXT',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color:
                                          const Color.fromARGB(255, 6, 43, 74),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

import 'package:axiomapp/profileCreation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          child: Column(
        children: [
          SizedBox(height: height * 0.1),
          Center(
            child: Image.asset(
              'images/authenticate.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: height * 0.045,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Continue to Axiom Protect 2.0",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: 20, color: Colors.black54),
                children: <TextSpan>[
                  TextSpan(
                    text: "We'll share your information with ",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: "Axiom Protect 2.0",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: " to connect your account.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 1,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.grey.withOpacity(0.6),
                  Colors.transparent
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.check,
              color: Colors.green,
            ),
            title: Text(
              "Email address",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            subtitle: Text(
              "shubham@mollatech.com",
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.grey.withOpacity(0.6),
                  Colors.transparent
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                height: height * 0.1,
                width: width * 1,
                color: Color.fromARGB(255, 240, 235, 186),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(
                          CupertinoIcons.exclamationmark_triangle_fill,
                          color: Colors.yellow,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black54),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Add a second authentication method.",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Add your navigation logic here, e.g., open a URL or navigate to a screen
                                      },
                                  ),
                                  TextSpan(
                                    text:
                                        " You have to delete your account and start over if you lose your only authentication method.",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.06,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                backgroundColor: Color.fromARGB(255, 22, 103, 170),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => profileCreation(),
                  ),
                );
              },
              child: const Center(
                  child: Text(
                "Agree and continue",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
        ],
      )),
    );
  }
}

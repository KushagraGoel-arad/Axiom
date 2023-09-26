import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class addSecurity extends StatefulWidget {
  const addSecurity({super.key});

  @override
  State<addSecurity> createState() => _addSecurityState();
}

class _addSecurityState extends State<addSecurity> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool _isChecked = false;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 235, 243),
      body: Center(
        child: Container(
            width: width * 0.5,
            height: height * 0.9,
            color: Colors.white,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset("images/Securitykey.png")),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Add your security key",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                'Add security key that meets the FIDO standard as your authentication method. You can add as many security keys as you want. To get started, first give your security key a nickname.',
                            style: TextStyle()),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Security key nickname",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold)),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 182, 224, 242),
                          //labelText: 'Email Address',
                          //labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    const Color.fromARGB(255, 206, 205, 205)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 22, 103, 170)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 165, 205, 237),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Checkbox(
                            value: _isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked = !_isChecked;
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black54),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Remember this browser",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Text(
                          //   'I read and accept the Login.gov',
                          //   style: TextStyle(color: Color.fromARGB(255, 91, 90, 90)),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 150,
                    height: 75,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          backgroundColor: Color.fromARGB(255, 22, 103, 170),
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => saveBackUpCodes(),
                          //   ),
                          // );
                        },
                        child: const Center(
                            child: Text(
                          "Continue",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: height * 0.02,
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
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Choose another authentication method',
                          style: TextStyle(
                            fontSize: 14,
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
                ),
                SizedBox(
                  height: height * 0.04,
                ),

                //Text("We sent a confirmation mail to shubham@mollatech.com with a link to confirm your email address. Follow the link to continue creating your account."),
              ],
            )),
      ),
    );
  }
}

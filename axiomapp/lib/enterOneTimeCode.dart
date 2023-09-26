import 'package:axiomapp/authMethodSetup.dart';
import 'package:axiomapp/authMethodSetupTextnVoice.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class enterOneTimeCode extends StatefulWidget {
  const enterOneTimeCode({super.key});

  @override
  State<enterOneTimeCode> createState() => _enterOneTimeCodeState();
}

class _enterOneTimeCodeState extends State<enterOneTimeCode> {
  bool _isChecked = true;
  // String _selectedLanguage = '';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 235, 243),
      body: Center(
        child: Container(
            width: width * 0.5,
            height: height * 0.9,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Enter your one-time code",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
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
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "We sent a text(SMS) with a one-time code to ",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: "+91 8851019233 ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "This code will expire in 10 minutes.",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
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
                          child: Text("One-time code",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("Example:123456",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            //controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              fillColor: Color.fromARGB(255, 182, 224, 242),
                              //labelText: 'Email Address',
                              //labelStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color.fromARGB(
                                        255, 206, 205, 205)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 22, 103, 170)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        backgroundColor: Color.fromARGB(255, 22, 103, 170),
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => addAuthApp(),
                        //   ),
                        // );
                      },
                      child: const Center(
                          child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Background color
                          foregroundColor:
                              Color.fromARGB(255, 22, 103, 170), // Text color
                          side: BorderSide(
                            color: Color.fromARGB(
                                255, 22, 103, 170), // Outer border color
                            width: 1.0,
                          ),
                        ),
                        onPressed: () {
                          // String textToCopy = _textEditingController.text;
                          // if (textToCopy.isNotEmpty) {
                          //   Clipboard.setData(
                          //       ClipboardData(text: textToCopy));
                          //   // Optionally, show a snackbar or toast to indicate text is copied.
                          // }

                          print('Copy button pressed');
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.refresh),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Send another code'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("Having trouble? Here's what you can do:",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            style:
                                TextStyle(fontSize: 20, color: Colors.black54),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Use another phone number",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  //decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Add your navigation logic here, e.g., open a URL or navigate to a screen
                                  },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => textnVoice(),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromARGB(255, 22, 103, 170),
                            ),
                          ),
                        )
                      ],
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style:
                                TextStyle(fontSize: 20, color: Colors.black54),
                            children: <TextSpan>[
                              TextSpan(
                                text: "I didn't receive my one-time code ",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  //decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => authMetSetup(jwtToken: null, tokenExpiry: null, userDetails: null, accountId: '',),
                                      ),
                                    );
                                    // Add your navigation logic here, e.g., open a URL or navigate to a screen
                                  },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => authMetSetup(jwtToken: null, tokenExpiry: null, userDetails: null, accountId: '',),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromARGB(255, 22, 103, 170),
                            ),
                          ),
                        )
                      ],
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style:
                                TextStyle(fontSize: 20, color: Colors.black54),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Learn more about authentication options",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  //decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => authMetSetup(jwtToken: null, tokenExpiry: null, userDetails: null, accountId: '',),
                                      ),
                                    );
                                    // Add your navigation logic here, e.g., open a URL or navigate to a screen
                                  },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => authMetSetup(jwtToken: null, tokenExpiry: null, userDetails: null, accountId: '',),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromARGB(255, 22, 103, 170),
                            ),
                          ),
                        )
                      ],
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Choose another authentication method",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => authMetSetup(jwtToken: null, tokenExpiry: null, userDetails: null, accountId: '',),
                                    ),
                                  );
                                  // Add your navigation logic here, e.g., open a URL or navigate to a screen
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

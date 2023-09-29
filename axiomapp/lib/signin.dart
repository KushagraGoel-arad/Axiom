import 'dart:convert';
import 'dart:io';

import 'package:axiomapp/authMethodSetup.dart';
import 'package:axiomapp/profileCreation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? resultMessage;
  String getCurrentDateTime() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(now);
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Success"),
          content: Text("Login successful."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the success dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => profileCreation()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the error dialog
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> loginWithOutPassword() async {
    final userId = emailController.text;
    var ct = getCurrentDateTime();

    final url = Uri.parse(
      'https://access.axiomprotect.com:6653/AxiomProtect/v1/user/loginWithOutPassword?userId=$userId&requestTime=${ct}',
    );

    final headers = {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': '*',
    };

    final email = emailController.text;

    if (email.isEmpty) {
      // Handle empty email
      showErrorDialog("Email is required.");
      return;
    }

    final body = {};

    try {
      final response =
          await http.post(url, headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        print('POST request successful');
        print(response.body);
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        String? resultMessage = jsonResponse['resultMessage'];

        if (resultMessage != null) {
          print('Result Message: $resultMessage');
        } else {
          print('Result Message is null.');
        }
        if (jsonResponse['resultCode'] == 0) {
          print(jsonResponse);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => authMetSetup(
                jwtToken: "jwtToken",
                tokenExpiry: "tokenExpiry",
                userDetails: "userDetails",
                accountId: "accountId",
              ),
            ),
          );
          //Save data to session storage
          final jwtToken = jsonResponse['resultData']['jwtToken'];
          final tokenExpiry = jsonResponse['resultData']['tokenExpiry'];
          final userDetails = jsonResponse['resultData']['user']['userid'];
          final accountId = jsonResponse['resultData']['user']['accountid'];
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('jwtToken', jwtToken);
          prefs.setInt('tokenExpiry', tokenExpiry);
          prefs.setString('userDetails', userDetails);
          prefs.setString('accountId', accountId);
          // Navigate to another page with data
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => authMetSetup(
          //       jwtToken: jwtToken,
          //       tokenExpiry: tokenExpiry,
          //       userDetails: userDetails,
          //       accountId: accountId,
          //     ),
          //   ),
          // );
        } else {
          showErrorDialog('$resultMessage');
        }
      } else {
        print('POST request failed');
        print('Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        showErrorDialog("${response.statusCode}");
      }
    } catch (e) {
      print('Error: $e'); // Print the exception message for debugging

      showErrorDialog("An error occurred. Please try again later.");
    }
  }

  // Future<void> loginUser() async {
  //   final userId = emailController.text;
  //   var ct = getCurrentDateTime();

  //   final url = Uri.parse(
  //       'https://access.axiomprotect.com:6653/AxiomProtect/v1/user/loginWithOutPassword?userId=$userId&requestTime=${ct}');

  //   final headers = {
  //     'Content-Type': 'application/json',
  //     "Access-Control-Allow-Origin": "*",
  //     "Access-Control-Allow-Methods": "*",
  //   };

  //   final email = emailController.text;
  //   //final password = passwordController.text;

  //   if (email.isEmpty) {
  //     // Handle empty email or password
  //     showErrorDialog("Email and password are required.");
  //     return;
  //   } else {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => profileCreation()),
  //     );
  //   }

  //   final body = {
  //     "userId": userId,

  //     // "accountId": "8797893D-7F0D-4B5F-9F6E-DE1706BC33D0",
  //     // "email": email,
  //     // "password": password,
  //   };
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final response = await http.post(url, headers: headers, body: body);

  //   if (response.statusCode == 200) {
  //     print('POST request successful');
  //     print(response.body);
  //      prefs.setInt('');
  //     showSuccessDialog();

  //     // Show the success dialog
  //   } else {
  //     print('POST request failed');
  //     print('Status Code: ${response.statusCode}');
  //     print('Response Body: ${response.body}');
  //     showErrorDialog("Incorrect email or password. Please try again.");
  //   }
  // }
  // Future<void> loginUser() async {
  //   //var ct = getCurrentDateTime();
  //   final url = Uri.parse(
  //       'https://access.axiomprotect.com:6653/AxiomProtect/v1/operator/loginV1');

  //   final headers = {
  //     'Content-Type': 'application/json',
  //   };

  //   final body = {
  //     "accountId": "8797893D-7F0D-4B5F-9F6E-DE1706BC33D0",
  //     "email": emailController.text,
  //     "password": passwordController.text,
  //     "requestTime": "2023-07-07 12:04:05",
  //   };

  //   final response = await http.post(
  //     url,
  //     headers: headers,
  //     body: body,
  //   );

  //   if (response.statusCode == 200) {
  //     //showAboutDialog(context: context);
  //     print('POST request successful');
  //     print(response.body);
  //     showSuccessDialog();
  //   } else {
  //     print('POST request failed');
  //     print('Status Code: ${response.statusCode}');
  //     print('Response Body: ${response.body}');
  //     showErrorDialog("Incorrect email or password. Please try again.");
  //   }
  // }

  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 232, 241),
      body: Card(
        margin: EdgeInsets.only(top: 70, bottom: 70, left: 490, right: 490),
        child: Container(
            child: Column(
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            Text(
              "Sign in for existing users",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  height: height * 0.18,
                  width: width * 1,
                  color: Color.fromARGB(255, 209, 232, 243),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: Icon(
                            CupertinoIcons.info_circle_fill,
                            color: Color.fromARGB(255, 62, 146, 214),
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
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black54),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            "Axiom Protect 2.0 only recognizes one email address on Login.gov accounts. Adding email addresses to your Login.gov accounts. Adding email addresses to your Login.gov account ",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "may cause your Axiom Protect 2.0 login to fail.",
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
                              ),
                              //     Text(
                              //   "SAM.gov only recognizes one email address on Login.gov accounts. Adding email addresses to your Login.gov accounts. Adding email addresses to your Login.gov account may cause your SAM.gov login to fail. ",
                              //   //textAlign: TextAlign.center,
                              //   style:
                              //       TextStyle(fontSize: 16, color: Colors.black87),
                              // )
                            ),
                            // SizedBox(
                            //   height: 8,
                            // ),
                            // Expanded(
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(16.0),
                            //     child: RichText(
                            //       textAlign: TextAlign.center,
                            //       text: TextSpan(
                            //         style: TextStyle(
                            //             fontSize: 20, color: Colors.black54),
                            //         children: <TextSpan>[
                            //           TextSpan(
                            //             text:
                            //                 "Sharing your Login.gov password or using someone else's Login.gov account violates the ",
                            //             style: TextStyle(
                            //               fontSize: 18,
                            //             ),
                            //           ),
                            //           TextSpan(
                            //             text: "rules of use.",
                            //             style: TextStyle(
                            //               fontSize: 18,
                            //               color: Colors.blue,
                            //               decoration: TextDecoration.underline,
                            //             ),
                            //             recognizer: TapGestureRecognizer()
                            //               ..onTap = () {
                            //                 // Add your navigation logic here, e.g., open a URL or navigate to a screen
                            //               },
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ),

                            //   //     Text(
                            //   //   "Sharing your Login.gov password or using someone else's Login.gov account violates the rules of use. ",
                            //   //   //textAlign: TextAlign.center,
                            //   //   style:
                            //   //       TextStyle(fontSize: 16, color: Colors.black87),
                            //   // )
                            // ),
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
              padding: const EdgeInsets.only(left: 50.0, bottom: 10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("User ID",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 50,
                    ),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 182, 224, 242),
                        //labelText: 'Email Address',
                        //labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 206, 205, 205)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 22, 103, 170)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Column(
            //     children: [
            //       Align(
            //         alignment: Alignment.topLeft,
            //         child: Text("Password",
            //             style: TextStyle(
            //                 fontSize: 16,
            //                 color: Colors.black87,
            //                 fontWeight: FontWeight.bold)),
            //       ),
            //       TextFormField(
            //         controller: passwordController,
            //         obscureText: !_isChecked,
            //         decoration: InputDecoration(
            //           fillColor: Color.fromARGB(255, 198, 228, 241),
            //           //labelText: 'Email Address',
            //           //labelStyle: TextStyle(color: Colors.grey),
            //           enabledBorder: OutlineInputBorder(
            //             borderSide: BorderSide(
            //                 color: const Color.fromARGB(255, 199, 198, 198)),
            //           ),
            //           focusedBorder: OutlineInputBorder(
            //             borderSide: BorderSide(
            //                 color: Color.fromARGB(255, 22, 103, 170)),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: <Widget>[
            //       Checkbox(
            //         value: _isChecked,
            //         onChanged: (bool? value) {
            //           setState(() {
            //             _isChecked = value!;
            //           });
            //         },
            //       ),
            //       Text(
            //         'Show password',
            //         style: TextStyle(color: Color.fromARGB(255, 91, 90, 90)),
            //       ),
            //     ],
            //   ),
            // ),

            SizedBox(
              height: height * 0.08,
            ),
            Container(
              width: width * 0.12,
              height: height * 0.1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    backgroundColor: Color.fromARGB(255, 22, 103, 170),
                  ),
                  onPressed: () async {
                    await loginWithOutPassword();
                  },
                  child: const Center(
                      child: Text(
                    "Sign in",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

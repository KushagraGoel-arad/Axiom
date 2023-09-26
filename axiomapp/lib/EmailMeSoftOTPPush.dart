import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:axiomapp/backupCodes.dart';
import 'package:axiomapp/verifyAxiomPush.dart';
import 'package:axiomapp/verifyOTPemail.dart';
import 'package:axiomapp/verifySoftOTP.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'authMethodList.dart';
import 'authMethodSetupTextnVoice.dart';

class EamilMeSoftOTPPush extends StatefulWidget {
  const EamilMeSoftOTPPush({super.key});

  @override
  State<EamilMeSoftOTPPush> createState() => _EamilMeSoftOTPPushState();
}

class _EamilMeSoftOTPPushState extends State<EamilMeSoftOTPPush> {
  String getCurrentDateTime() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(now);
  }

  String? resultMessage;
  List<CheckboxModel> checkboxes = [
    CheckboxModel(
      title: 'Email Me',
      image: 'images/auth_application.png',
      isChecked: false,
      route: reg_code(),
    ),
    CheckboxModel(
      title: 'Axiom Push',
      image: 'images/textnVoiceMessage.png',
      isChecked: false,
      route: verifyAxiomPush(),
    ),
    CheckboxModel(
      title: 'Soft OTP',
      image: 'images/backup_codes.png',
      isChecked: false,
      route: verifySoftOtp(),
    ),
  ];

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
                // Navigator.of(context).pop(); // Close the success dialog
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => profileCreation()),
                // );
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
          title: Text(""),
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

  //Email OTP API
  Future<void> sendOTP() async {
    // Replace with your actual API endpoint URL
    var ct = getCurrentDateTime();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final accountId = prefs.getString('accountId');
    final authToken = prefs.getString('jwtToken');
    final userId1 = prefs.getString('userDetails');
    final appId = prefs.getString('appid');

    // Update the URL and request parameters
    final url = Uri.parse(
      'https://access.axiomprotect.com:6653/AxiomProtect/v1/token/sendOTP'
      '?userId=$userId1&appId=$appId&category=3&type=1&requestTime=$ct',
    );

    // Prepare the request body as JSON
    final Map<String, dynamic> requestBody = {
      'accountId': accountId,
      'userId': userId1,
      'appId': appId,
    };

    final headers = {
      'Content-Type': 'application/json', // Set content type to JSON
      'authToken': authToken,
      // Remove these headers if they are not needed for your API
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': '*',
    }.cast<String, String>();

    // Send the POST request with a JSON body
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      // Successful request, you can handle the response data here
      print('OTP sent successfully');
      print('Response body: ${response.body}');
      // final jsonResponse = jsonDecode(response.body);
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      String? resultMessage = jsonResponse['resultMessage'];

      if (resultMessage != null) {
        print('Result Message: $resultMessage');
      } else {
        print('Result Message is null.');
      }
      if (jsonResponse['resultCode'] == 0) {
        CheckboxModel selectedItem =
            checkboxes.firstWhere((item) => item.isChecked);

        if (selectedItem != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => selectedItem.route),
          );
        } else {
          // Handle case when no checkbox is selected
          showErrorDialog('$resultMessage');
        }
      }
      showErrorDialog('$resultMessage');
    } else {
      // Error handling for non-200 status codes
      print('Failed to send OTP. Status Code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

//Axiom Push
  Future<void> AxiomPush() async {
    // Replace with your actual API endpoint URL
    var ct = getCurrentDateTime();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final accountId = prefs.getString('accountId');
    final authToken = prefs.getString('jwtToken');
    final userId1 = prefs.getString('userDetails');
    final appId = prefs.getString('appid');

    // Update the URL and request parameters
    final url = Uri.parse(
      'https://access.axiomprotect.com:6653/AxiomProtect/v1/authenticator/sendPush'
      '?accountId=$accountId&userId=$userId1&requestTime=$ct',
    );

    // Prepare the request body as JSON
    final Map<String, dynamic> requestBody = {
      "PushDetails": {
        "amount": "",
        "appId": "",
        "appUrl": "",
        "consentRequester": "",
        "consetPurpose": "",
        "device": "",
        "expirytimeInMins": 0,
        "fromAccount": "",
        "ip": "",
        "message": "",
        "options": "",
        "pushMessageType": 0,
        "requestType": 0,
        "title": "",
        "toAccount": "",
        "updatePushRequestBefore": ""
      }
    };

    final headers = {
      'Content-Type': 'application/json',
      'authToken': authToken,
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': '*',
    }.cast<String, String>();

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      // Successful request, you can handle the response data here
      print('OTP sent successfully');
      print('Response body: ${response.body}');
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      String? resultMessage = jsonResponse['resultMessage'];

      if (resultMessage != null) {
        print('Result Message: $resultMessage');
      } else {
        print('Result Message is null.');
      }
      if (jsonResponse['resultCode'] == 0) {
        CheckboxModel selectedItem =
            checkboxes.firstWhere((item) => item.isChecked);

        if (selectedItem != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => selectedItem.route),
          );
        } else {
          // Handle case when no checkbox is selected
          showErrorDialog('$resultMessage');
        }
      }
      showErrorDialog('$resultMessage');
    } else {
      // Error handling for non-200 status codes
      print('Failed to send OTP. Status Code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  Future<void> sendSoftOTP() async {
    CheckboxModel selectedItem =
        checkboxes.firstWhere((item) => item.isChecked);
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => selectedItem.route),
    );
  }

  void handleButtonPress() async {
    CheckboxModel selectedItem =
        checkboxes.firstWhere((item) => item.isChecked);

    if (selectedItem != null) {
      switch (selectedItem.title) {
        case 'Email Me':
          await sendOTP();
          break;
        case 'Axiom Push':
          await AxiomPush();
          break;
        case 'Soft OTP':
          await sendSoftOTP();
          break;
        default:
          showErrorDialog('Please Select One Option');
      }
    } else {
      // Handle case when no checkbox is selected
      showErrorDialog('Please Select One Option');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 236, 245),
      body: Card(
        margin: EdgeInsets.only(top: 70, bottom: 70, left: 450, right: 450),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How would you like to sign in',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(height: 8),
                  // Text(
                  //   'Add another layer of security by selecting a multi-factor authentication method. We recommend you select at least two different options in case you lose one of your methods.',
                  //   style: TextStyle(fontSize: 16, color: Colors.grey),
                  // ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: checkboxes.length,
                itemBuilder: (context, index) {
                  final item = checkboxes[index];

                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 165, 205, 237),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListTile(
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              value: item.isChecked,
                              onChanged: (value) {
                                setState(() {
                                  checkboxes.forEach((model) {
                                    model.isChecked = false;
                                  });

                                  // Update the selected item
                                  item.isChecked = value!;
                                });
                              },
                            ),
                            SizedBox(width: 8),
                            Image.network(
                              item.image,
                              width: 40,
                              height: 40,
                            )
                            // FutureBuilder(
                            //   future: loadImage(item.image),
                            //   builder: (context, snapshot) {
                            //     if (snapshot.connectionState ==
                            //         ConnectionState.done) {
                            //       if (snapshot.hasError) {
                            //         return Text('Image Error');
                            //       }
                            //       return Image.network(item.image);
                            //     } else {
                            //       return CircularProgressIndicator();
                            //     }
                            //   },
                            // ),
                          ],
                        ),
                        title: Text(
                          item.title,
                          style: TextStyle(
                              color: Color.fromARGB(255, 22, 103, 170),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: Container(
                width: width * 0.3,
                height: height * 0.1,
                child: Padding(
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
                      handleButtonPress();
                      // CheckboxModel selectedItem =
                      //     checkboxes.firstWhere((item) => item.isChecked);

                      // if (selectedItem != null) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => selectedItem.route),
                      //   );
                      // } else {
                      //   // Handle case when no checkbox is selected
                      //   print('No checkbox selected');
                      // }
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
          ],
        ),
      ),
    );
  }
}

class CheckboxModel {
  final String title;

  final String image;
  bool isChecked;
  final Widget route;

  CheckboxModel({
    required this.title,
    required this.image,
    this.isChecked = false,
    required this.route,
  });
}

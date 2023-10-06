import 'dart:convert';

import 'package:axiomapp/signin_create.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'OTPSuccess.dart';

class verifySoftOtp extends StatefulWidget {
  const verifySoftOtp({super.key});

  @override
  State<verifySoftOtp> createState() => _verifySoftOtpState();
}

class _verifySoftOtpState extends State<verifySoftOtp> {
  bool _enabled = false;
  bool isLoading = false;
  String getCurrentDateTime() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(now);
  }

  void _updateEnteredValue() {
    enteredValue = controllers.map((controller) => controller.text).join('');
    if (enteredValue.length == controllers.length) {
      final completeEnteredValue = enteredValue;

      print('Complete Entered Value: $completeEnteredValue');
    }
  }

  showMyDialog(String _title, String _message) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text(_message)],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // showOTPSuccess(String _title, String _message) async {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       double width = MediaQuery.of(context).size.width;
  //       double height = MediaQuery.of(context).size.height;
  //       return AlertDialog(
  //         //title: Text(_title),
  //         content: Column(children: [

  //           Image.asset("images/complete_valid.png"),
  //           Align(
  //             alignment: Alignment.topCenter,
  //             child: Padding(
  //               padding: const EdgeInsets.only(left: 16.0, top: 16),
  //               child: Text(
  //                 "OTP Verified Successfully ",
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     color: Color.fromARGB(255, 56, 55, 55),
  //                     fontSize: 30),
  //               ),
  //             ),
  //           ),
  //           SizedBox(
  //             height: height * 0.04,
  //           ),
  //           Align(
  //             alignment: Alignment.topCenter,
  //             child: Padding(
  //               padding: const EdgeInsets.only(left: 16.0, top: 16),
  //               child: Text(
  //                 "User authentication is done",
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     color: Color.fromARGB(255, 56, 55, 55),
  //                     fontSize: 30),
  //               ),
  //             ),
  //           ),
  //           SizedBox(
  //             height: height * 0.05,
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Center(
  //               child: SizedBox(
  //                 width: 100,
  //                 height: 40,
  //                 child: ElevatedButton(
  //                   onPressed: () {
  //                     Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                         builder: (context) => signinCreate(),
  //                       ),
  //                     );
  //                   },
  //                   style: ElevatedButton.styleFrom(
  //                     backgroundColor: Colors.white,
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius:
  //                           BorderRadius.circular(2), // Button border radius
  //                       side: BorderSide(
  //                           color: Color.fromARGB(
  //                               255, 22, 103, 170)), // Border color
  //                     ),
  //                   ),
  //                   child:
  //                       // Icon(Icons.cancel),
  //                       // SizedBox(
  //                       //   width: 7,
  //                       // ),
  //                       Text(
  //                     'Close',
  //                     style: TextStyle(
  //                         fontSize: 18,
  //                         color: const Color.fromARGB(255, 5, 49, 86),
  //                         fontWeight: FontWeight.bold),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           )
  //         ]),
  //         // actions: <Widget>[
  //         //   TextButton(
  //         //     child: const Text('close'),
  //         //     onPressed: () {
  //         //       Navigator.of(context).pop();
  //         //     },
  //         //   ),
  //         // ],
  //       );
  //     },
  //   );
  // }
  showOTPSuccess(String _title, String _message) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
        return AlertDialog(
          //title: Text(_title),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Minimize the size of the dialog
            children: [
              Image.asset("images/complete_valid.png"),
              Text(
                "OTP Verified Successfully",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 56, 55, 55),
                  fontSize: 30,
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                "User authentication is done",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 56, 55, 55),
                  fontSize: 30,
                ),
              ),
              SizedBox(height: height * 0.03),
              Center(
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
                        borderRadius: BorderRadius.circular(2),
                        side: BorderSide(
                          color: Color.fromARGB(255, 22, 103, 170),
                        ),
                      ),
                    ),
                    child: Text(
                      'Close',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color.fromARGB(255, 5, 49, 86),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void clickedOnButton() {
    if (_enabled = true) {
      //VeriRegCode();
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => permissions(
      //       body: body,
      //       checks: checks,
      //     ),
      //   ),
      // );
    } else {
      showMyDialog("Alert", "User not verified");
    }
  }

  List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());

  String enteredValue = '';
  // Future<void> sendOTP() async {
  //   // Replace with your actual API endpoint URL
  //   var ct = getCurrentDateTime();

  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final accountId = prefs.getString('accountId');
  //   final authToken = prefs.getString('jwtToken');
  //   final userId1 = prefs.getString('userDetails');
  //   final appId = prefs.getString('appid');

  //   // Update the URL and request parameters
  //   final url = Uri.parse(
  //     'https://access.axiomprotect.com:6653/AxiomProtect/v1/token/sendOTP'
  //     '?userId=$userId1&appId=$appId&category=3&type=1&requestTime=$ct',
  //   );

  //   // Prepare the request body as JSON
  //   final Map<String, dynamic> requestBody = {
  //     'accountId': accountId,
  //     'userId': userId1,
  //     'appId': appId,
  //   };

  //   final headers = {
  //     'Content-Type': 'application/json', // Set content type to JSON
  //     'authToken': authToken,
  //     // Remove these headers if they are not needed for your API
  //     'Access-Control-Allow-Origin': '*',
  //     'Access-Control-Allow-Methods': '*',
  //   }.cast<String, String>();

  //   // Send the POST request with a JSON body
  //   final response = await http.post(
  //     url,
  //     headers: headers,
  //     body: jsonEncode(requestBody),
  //   );

  //   if (response.statusCode == 200) {
  //     // Successful request, you can handle the response data here
  //     print('OTP sent successfully');
  //     print('Response body: ${response.body}');
  //   } else {
  //     // Error handling for non-200 status codes
  //     print('Failed to send OTP. Status Code: ${response.statusCode}');
  //     print('Response body: ${response.body}');
  //   }
  // }
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

  Future<void> verifyOTP() async {
    setState(() {
      isLoading = true;
    });
    // Replace with your actual API endpoint URL
    var ct = getCurrentDateTime();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final accountId = prefs.getString('accountId');
    final authToken = prefs.getString('jwtToken');
    final userId1 = prefs.getString('userDetails');
    final appId = prefs.getString('appid');

    // Update the URL and request parameters
    final url = Uri.parse(
      'https://access.axiomprotect.com:6653/AxiomProtect/v1/absolute/verifyOneTimePassword?userId=$userId1&appId=$appId&otp=$enteredValue',
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
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      String? resultMessage = jsonResponse['resultMessage'];

      if (resultMessage != null) {
        print('Result Message: $resultMessage');
      } else {
        print('Result Message is null.');
      }
      if (jsonResponse['resultCode'] == 0) {
        print(jsonResponse);
        setState(() {
          isLoading = false;
        });
        // final jsonResponse = jsonDecode(response.body);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => otpSuccess(),
        //   ),
        // );
        showOTPSuccess('Success', 'OTP Success');
      } else {
        showErrorDialog('$resultMessage');
      }
    } else {
      // Error handling for non-200 status codes
      print('Failed to send OTP. Status Code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }
// //Send registration code as an init
//   Future<void> sendRegCode() async {
//     var rng = new Random();
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int code = rng.nextInt(900000) + 100000;
//     var authToken = prefs.getString('authToken');
//     print('Received jwttoken $authToken');
//     var ct = getCurrentDateTime();
//     var url =
//         "https://access.axiomprotect.com:6653/AxiomProtect/v1/WD/sonicKYC/sendRegistrationCode?accountId=8797893D-7F0D-4B5F-9F6E-DE1706BC33D0&userId=flutterTest1&requestTime=${ct}";

//     // var body = {
//     //   'accountId': '6BA2055B-A8FC-46B4-9969-AE75AB5CFB6C',
//     //   'userId': 'flutterTest',
//     //   'userName': 'flutterTest',
//     //   'email': 'flutterTest@gmail.com',
//     //   'phone': '9876545678',
//     //   'applicationNo': prefs.getInt('applicationNo'),
//     // };

//     var response = await ApiService().callPost(url, body, authToken!);

//     if (response["resultCode"] == 0) {
//       _enabled = true;
//       checks = response["resultData"];

//       print(checks);
//     } else {
//       print("Error occurred during the request: $e");
//     }
//   }

// //verify Registration code
//   Future<void> VeriRegCode() async {
//     var rng = new Random();
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var code = rng.nextInt(900000) + 100000;
//     var authToken1 = prefs.getString('authToken');
//     print('Received jwttoken: $authToken1');
//     var ct = getCurrentDateTime();

//     var url =
//         'https://access.axiomprotect.com:6653/AxiomProtect/v1/WD/sonicKYC/verifyRegistrationCode?accountId=8797893D-7F0D-4B5F-9F6E-DE1706BC33D0&userId=flutterTest1&registrationCode=$enteredValue&requestTime=${ct}';
//     // var body = {
//     //   'accountId': '492598DD-1F83-44EF-B21A-B619E80C0896',
//     //   'userId': 'kushagra12345',
//     //   'userName': 'kushagra1234',
//     //   'email': 'kushagra.goel@gmail.com',
//     //   'phone': '8851019233',
//     //   'applicationNo': "${code}",
//     // };
//     var response = await ApiService().callPost(url, body, authToken1!);

//     if (response["resultCode"] == 0) {
//       _enabled = true;
//       checks = response["resultData"] as Map<String, dynamic>;

//       print(checks);
//     } else {}
//   }

//   //call verification code Stage API
//   Future<void> verifyRegCodeStageApi() async {
//     var ct = getCurrentDateTime();
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var code1 = prefs.getInt('applicationNo');
//     var url =
//         "https://access.axiomprotect.com:6653/AxiomProtect/v1/WD/sonicKYC/updateStages?applicationNo=${code1}&requestTime=${ct}";
//     var body = {
//       "mode": "web",
//       "stageData": {
//         "value": {"otp": "String"}
//       },
//       "stageName": "VERIFY REGCODE",
//       "stageNo": "2",
//     };

//     var authTokenStage2 = prefs.getString('authToken');
//     print('Received jwttoken: $authTokenStage2');
//     var response = await ApiService().callPost(url, body, authTokenStage2!);

//     if (response["resultCode"] == 0) {
//       _enabled = true;
//       checks = response["resultData"] as Map<String, dynamic>;

//       print(checks);
//     } else {
//       print('Error occurred during the request: 1');
//     }
//   }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 236, 245),
      body: Card(
        margin: EdgeInsets.only(top: 130, bottom: 130, left: 490, right: 490),
        child: Center(
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Verify your OTP",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Please check Axiom Absolute Security app for OTP",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var i = 0; i < controllers.length; i++)
                          SizedBox(
                            width: 40,
                            child: TextFormField(
                              controller: controllers[i],
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              onSaved: (i) {},
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                  setState(() {
                                    _updateEnteredValue(); // Update the entered value variable
                                  });
                                } else if (value.isEmpty && i > 0) {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              style: const TextStyle(fontSize: 18),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 22, 103, 170),
                                  ),
                                ),
                                counterText: '',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 22, 103, 170),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         "Not received yet?",
                  //         style: TextStyle(
                  //           fontSize: 16,
                  //           color: Colors.grey[500],
                  //         ),
                  //       ),
                  //       InkWell(
                  //         // onTap: () => sendRegCode(),
                  //         child: const Text(
                  //           " Resend",
                  //           style: TextStyle(
                  //               fontSize: 16,
                  //               color: Color.fromARGB(255, 22, 103, 170),
                  //               fontWeight: FontWeight.w600),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: height * 0.15,
                  ),
                  Center(
                    child: Container(
                      width: width * 0.2,
                      height: height * 0.1,
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
                            verifyOTP();
                          },
                          child: const Center(
                              child: Text(
                            "VERIFY",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            if (isLoading) // Show CircularProgressIndicator as overlay when loading
              Positioned.fill(
                child: Container(
                  color: Color.fromARGB(137, 79, 79, 79)
                      .withOpacity(0.5), // Semi-transparent background
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          ]),
        ),
      ),
    );
  }
}

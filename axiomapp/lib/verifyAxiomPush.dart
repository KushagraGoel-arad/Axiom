import 'dart:async';
import 'dart:convert';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'OTPSuccess.dart';

class verifyAxiomPush extends StatefulWidget {
  const verifyAxiomPush({super.key});

  @override
  State<verifyAxiomPush> createState() => _verifyAxiomPushState();
}

class _verifyAxiomPushState extends State<verifyAxiomPush> {
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

  // Future<void> AxiomPush() async {
  //   // Replace with your actual API endpoint URL
  //   var ct = getCurrentDateTime();

  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final accountId = prefs.getString('accountId');
  //   final authToken = prefs.getString('jwtToken');
  //   final userId1 = prefs.getString('userDetails');
  //   final appId = prefs.getString('appid');

  //   // Update the URL and request parameters
  //   final url = Uri.parse(
  //     'https://access.axiomprotect.com:6653/AxiomProtect/v1/authenticator/sendPush'
  //     '?accountId=$accountId&userId=$userId1&requestTime=$ct',
  //   );

  //   // Prepare the request body as JSON
  //   final Map<String, dynamic> requestBody = {
  //     "PushDetails": {
  //       "amount": "",
  //       "appId": "",
  //       "appUrl": "",
  //       "consentRequester": "",
  //       "consetPurpose": "",
  //       "device": "",
  //       "expirytimeInMins": 0,
  //       "fromAccount": "",
  //       "ip": "",
  //       "message": "",
  //       "options": "",
  //       "pushMessageType": 0,
  //       "requestType": 0,
  //       "title": "",
  //       "toAccount": "",
  //       "updatePushRequestBefore": ""
  //     }
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

  int _remainingSeconds = 60;
  bool _timerIsRunning = true;
  late CountDownController _controller;

  void startTimer() {
    _controller = CountDownController();
    // Initialize the timer with the remaining seconds
    CircularCountDownTimer(
      duration: _remainingSeconds,
      initialDuration: 0,
      controller: _controller,
      width: 150,
      height: 150,
      ringColor: Colors.grey,
      ringGradient: null,
      fillColor: Colors.blue,
      fillGradient: null,
      backgroundColor: Colors.transparent,
      backgroundGradient: null,
      strokeWidth: 5.0,
      strokeCap: StrokeCap.round,
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      textFormat: CountdownTextFormat.S,
      isReverse: true,
      isReverseAnimation: false,
      isTimerTextShown: true,
      autoStart: true,
      onStart: () {
        setState(() {
          _timerIsRunning = true;
        });
      },
      onComplete: () {
        setState(() {
          _timerIsRunning = false;
          if (_timerIsRunning) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => otpSuccess(),
              ),
            );
          }
        });
        // Add the action you want to perform when the timer reaches 0 seconds
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    //AxiomPush();
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_timerIsRunning)
              Text(
                'Time remaining: $_remainingSeconds seconds',
                style: TextStyle(fontSize: 24),
              )
            else
              Text(
                'Timer Expired',
                style: TextStyle(fontSize: 24),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class confirmEmail extends StatefulWidget {
  const confirmEmail({super.key});

  @override
  State<confirmEmail> createState() => _confirmEmailState();
}

class _confirmEmailState extends State<confirmEmail> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          SizedBox(
            height: height * 0.04,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Check your email",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          SizedBox(
            height: height * 0.08,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                style: TextStyle(fontSize: 18, color: Colors.black54),
                children: <TextSpan>[
                  TextSpan(
                    text: 'We sent a confirmation mail to ',
                  ),
                  TextSpan(
                      text: 'shubham@mollatech.com',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text:
                        ' with a link to confirm your email address. Follow the link to continue creating your account.',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.15,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(fontSize: 18, color: Colors.black54),
              children: <TextSpan>[
                TextSpan(
                  text: 'Didn\'t receive an email? ',
                ),
                TextSpan(
                  text: 'Resend',
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
          SizedBox(
            height: height * 0.04,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(fontSize: 18, color: Colors.black54),
              children: <TextSpan>[
                TextSpan(
                  text: 'Or, ',
                ),
                TextSpan(
                  text: 'use a different email address',
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
          SizedBox(
            height: height * 0.04,
          ),
          Text(
            "You can close this window if you're done.",
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
          //Text("We sent a confirmation mail to shubham@mollatech.com with a link to confirm your email address. Follow the link to continue creating your account."),
        ],
      )),
    );
  }
}

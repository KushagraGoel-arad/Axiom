import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class pic_cacError extends StatefulWidget {
  const pic_cacError({super.key});

  @override
  State<pic_cacError> createState() => _pic_cacErrorState();
}

class _pic_cacErrorState extends State<pic_cacError> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 235, 243),
      body: Center(
        child: Container(
            width: width * 0.5,
            height: height * 0.45,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Your PIV/CAC did not work",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black87),
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
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Please ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                          text: 'try again',
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
                                '. If this problem continues, contact your agency administrator.',
                            style: TextStyle()),
                      ],
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

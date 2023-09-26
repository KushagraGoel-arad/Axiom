import 'package:axiomapp/sveBackUpCodes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class backupCodes extends StatefulWidget {
  const backupCodes({super.key});

  @override
  State<backupCodes> createState() => _backupCodesState();
}

class _backupCodesState extends State<backupCodes> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 235, 243),
      body: Center(
        child: Container(
            width: width * 0.8,
            height: height * 0.8,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Are you sure you want to use backup codes?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black87),
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
                            text:
                                'Backup codes are the least preferred authentication method ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                            text:
                                'because the codes can easily be lost. Try a safer option, like an authetication application or a security key.',
                            style: TextStyle()),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'We\'ll give you 10 codes that you can download, print, copy or write down. You\'ll enter one code every time you sign in.',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 150,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          backgroundColor: Color.fromARGB(255, 22, 103, 170),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => saveBackUpCodes(),
                            ),
                          );
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

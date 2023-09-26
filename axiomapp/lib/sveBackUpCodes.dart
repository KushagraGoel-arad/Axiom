import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class saveBackUpCodes extends StatefulWidget {
  const saveBackUpCodes({super.key});

  @override
  State<saveBackUpCodes> createState() => _saveBackUpCodesState();
}

class _saveBackUpCodesState extends State<saveBackUpCodes> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool _isChecked = true;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 235, 243),
      body: Center(
        child: Container(
            width: width * 0.5,
            height: height * 0.9,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Save these backup codes",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black87),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                'If you lose your device, you\'ll need these codes to sign into Login.gov.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                            text:
                                ' Save or print them and put them somewhere safe.',
                            style: TextStyle()),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: height * 0.02,
                ),
                Image.asset("images/backupCodes.png"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FractionallySizedBox(
                    widthFactor: 0.7,
                    child: Container(
                      height: height * 0.1,
                      width: width * 0.2,
                      color: Color.fromARGB(255, 249, 243, 194),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
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
                                          text:
                                              " Each code can only be used once. We'll give you new codes after you use all ten.",
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
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.07,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
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

                            print('Download button pressed');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.download),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Download'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
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

                            print('Print button pressed');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.print),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Print'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
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
                              Icon(Icons.copy),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Copy'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style:
                                TextStyle(fontSize: 20, color: Colors.black54),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    "I've put my backup codes in the safe place. ",
                                style: TextStyle(
                                  fontSize: 14,
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 150,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => textnVoice(),
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

                //Text("We sent a confirmation mail to shubham@mollatech.com with a link to confirm your email address. Follow the link to continue creating your account."),
              ],
            )),
      ),
    );
  }
}

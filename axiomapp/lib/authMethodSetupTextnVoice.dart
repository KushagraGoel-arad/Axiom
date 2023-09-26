import 'package:axiomapp/addAuthApp.dart';
import 'package:axiomapp/authMethodConfirm.dart';
import 'package:axiomapp/authMethodSetup.dart';
import 'package:axiomapp/enterOneTimeCode.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class textnVoice extends StatefulWidget {
  const textnVoice({super.key});

  @override
  State<textnVoice> createState() => _textnVoiceState();
}

class _textnVoiceState extends State<textnVoice> {
  final countryPicker = const FlCountryCodePicker();

  CountryCode? countryCode;
  TextEditingController _phoneController = TextEditingController();
  bool _isChecked = true;
  String _selectedLanguage = '';
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
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Get your one-time code",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                    "We'll send you a one-time code each time you sign in.")),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Phone Number",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
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
                      prefixIcon: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final code = await countryPicker.showPicker(
                                    context: context);
                                setState(() {
                                  countryCode = code;
                                });
                              },
                              child: Row(
                                children: [
                                  // Container(
                                  //   child: countryCode != null &&
                                  //           countryCode!.flagUri != null
                                  //       ? Image.network(countryCode!
                                  //           .flagUri) // Display the flag if available
                                  //       : Icon(Icons
                                  //           .flag), // Display a placeholder or default flag
                                  // ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      countryCode?.dialCode ?? "+61",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("How you'll get your code",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: width,
                  child: Row(
                    children: [
                      Container(
                        width: width * 0.45,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 210, 208, 208)),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: RadioListTile(
                          tileColor: Color.fromARGB(255, 218, 230, 236),
                          title: Text('Text message (SMS)'),
                          value: 'Text message (SMS)',
                          groupValue: _selectedLanguage,
                          onChanged: (value) {
                            setState(() {
                              _selectedLanguage = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        width: width * 0.45,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 210, 208, 208)),
                          borderRadius: BorderRadius.circular(
                              5.0), // Add border styling here
                        ),
                        child: RadioListTile(
                          selectedTileColor: Color.fromARGB(255, 218, 230, 236),
                          title: Text('Phone Call'),
                          value: 'Phone Call',
                          groupValue: _selectedLanguage,
                          onChanged: (value) {
                            setState(() {
                              _selectedLanguage = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                  "You can change this anytime. If you use a landline number, select \"Phone call.\" ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  )),
            ),
          ),
          SizedBox(
            height: height * 0.07,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                backgroundColor: Color.fromARGB(255, 22, 103, 170),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => enterOneTimeCode(),
                  ),
                );
              },
              child: const Center(
                  child: Text(
                "Send code",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                  "Message and data rates may apply. Do not use web-based (VOIP) phone services or premium rate (toll) phone numbers. ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: 20, color: Colors.black54),
                children: <TextSpan>[
                  TextSpan(
                    text: "Mobile terms of service",
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
          SizedBox(
            height: 10,
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
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
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
        ],
      )),
    );
  }
}

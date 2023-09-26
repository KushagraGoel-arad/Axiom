import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class createStrongPassword extends StatefulWidget {
  const createStrongPassword({super.key});

  @override
  State<createStrongPassword> createState() => _createStrongPasswordState();
}

class _createStrongPasswordState extends State<createStrongPassword> {
  bool _isPasswordVisible = false;
  //bool _isChecked = true;
  String _password = '';
  int _strength = 0;

  void _checkPasswordStrength(String password) {
    int strength = 0;

    if (password.length >= 12) {
      strength++;
    }

    if (!password.contains('abc') && !password.contains('111')) {
      strength++;
    }

    setState(() {
      _strength = strength;
    });
  }

  String _confirmPassword = '';
  bool _passwordsMatch = false;

  void _checkPasswordMatch() {
    setState(() {
      _passwordsMatch = _password == _confirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Color progressBarColor = Colors.red;

    if (_strength == 1) {
      progressBarColor = Colors.orange;
    } else if (_strength == 2) {
      progressBarColor = Color.fromARGB(255, 155, 204, 99);
    } else if (_strength >= 3) {
      progressBarColor = Colors.green;
    }

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
                  height: height * 0.02,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Create a strong Password",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Your password must be ",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                        TextSpan(
                          text: "12 characters",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              " or longer. Don't use common phrases or repeated characters, like abc or 111",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Password",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold)),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                            _checkPasswordStrength(value);
                            _checkPasswordMatch();
                          });
                        },
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 182, 224, 242),
                          //labelText: 'Email Address',
                          //labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    const Color.fromARGB(255, 206, 205, 205)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 22, 103, 170)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Confirm Password",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold)),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _confirmPassword = value;
                            _checkPasswordMatch();
                          });
                        },
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 198, 228, 241),
                          //labelText: 'Email Address',
                          //labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    const Color.fromARGB(255, 199, 198, 198)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 22, 103, 170)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        value: _isPasswordVisible,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _isPasswordVisible = newValue!;
                          });
                        },
                      ),
                      Text(
                        'Show password',
                        style:
                            TextStyle(color: Color.fromARGB(255, 91, 90, 90)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  _passwordsMatch
                      ? 'Passwords match'
                      : 'Passwords do not match',
                  style: TextStyle(
                    color: _passwordsMatch ? Colors.green : Colors.red,
                  ),
                ),
                SizedBox(height: 16),
                LinearProgressIndicator(
                  value: (_strength + 1) / 4,
                  backgroundColor: progressBarColor.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(progressBarColor),
                ),
                SizedBox(height: 8),
                Text(
                  _strength == 2
                      ? 'Password strength:  Strong'
                      : _strength == 1
                          ? 'Password strength:  Weak'
                          : _strength == 3
                              ? 'Password strength: Great'
                              : _strength == 4 
                                  ? 'Password strength: Great'
                                  : 'Password strength: Too Weak',
                  style: TextStyle(
                    color: progressBarColor,
                  ),
                ),
                Container(
                  width: width * 0.2,
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
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => profileCreation()),
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
              ],
            )),
      ),
    );
  }
}

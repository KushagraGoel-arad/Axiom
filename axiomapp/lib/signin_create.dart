import 'package:axiomapp/createAccount.dart';
import 'package:axiomapp/signin.dart';
import 'package:flutter/material.dart';

class signinCreate extends StatefulWidget {
  signinCreate({Key});

  @override
  State<signinCreate> createState() => _signinCreateState();
}

class _signinCreateState extends State<signinCreate> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    int _selectedIndex = 0;
    final List<Color> _buttonColors = [
      Color.fromARGB(255, 22, 103, 170),
      Color.fromARGB(255, 22, 103, 170),
    ];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 220, 232, 241),
      body: Card(
        //elevation: 4, // Shadow depth
        margin: EdgeInsets.only(top: 140, bottom: 140, left: 450, right: 450),
        child: Container(
            child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            Center(
              child: Image.asset(
                'images/axiom_login_logo.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: height * 0.08,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 22, 103, 170)),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Axiom Protect 2.0 ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text:
                        'is using Login.gov to allow\n you to sign in to your account\n safely and securely.',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Column(
              children: [
                ToggleButtons(
                  isSelected: [_selectedIndex == 0, _selectedIndex == 1],
                  onPressed: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });

                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signin()),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => createAccount()),
                      );
                    }
                  },
                  borderColor: Color.fromARGB(255, 22, 103, 170),
                  selectedColor: Colors.white,
                  fillColor: _buttonColors[_selectedIndex],
                  borderRadius: BorderRadius.circular(8.0),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 16.0),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 16.0),
                      child: Text(
                        'Create an Account',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 22, 103, 170),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                // Add other UI elements for each mode here
              ],
            ),
          ],
        )),
      ),
    );
  }
}

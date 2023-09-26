import 'package:axiomapp/addAuthApp.dart';
import 'package:axiomapp/authMethodSetup.dart';
import 'package:axiomapp/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class authConfirm extends StatefulWidget {
  const authConfirm({super.key});

  @override
  State<authConfirm> createState() => _authConfirmState();
}

class _authConfirmState extends State<authConfirm> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          child: Column(
        children: [
          SizedBox(height: height * 0.12),
          Center(
            child: Image.asset(
              'images/authenticate.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: height * 0.045,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "You've added your first authentication method! Add a second method as a backup.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
                "Adding another authentication method prevents you from getting locked out of your account if you lose one of your methods."),
          ),
          SizedBox(
            height: height * 0.2,
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
                    builder: (context) => authMetSetup(jwtToken: null, tokenExpiry: null, userDetails: null, accountId: '',),
                  ),
                );
              },
              child: const Center(
                  child: Text(
                "Add another Method",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                  fontSize: 25, color: Color.fromARGB(255, 22, 103, 170)),
              children: <TextSpan>[
                TextSpan(
                  text: 'Skip for now',
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
                          builder: (context) => login(),
                        ),
                      );
                      // Add your navigation logic here, e.g., open a URL or navigate to a screen
                    },
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

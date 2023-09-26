import 'package:axiomapp/whatsurgoal.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class createEntity extends StatefulWidget {
  const createEntity({super.key});

  @override
  State<createEntity> createState() => _createEntityState();
}

class _createEntityState extends State<createEntity> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Welcome",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black45),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "You are about to create a new entity record.",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "We will ask a few short questions to help us recommend the best option for you.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                width: 190, // Define the width
                height: 40, // Define the height
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => whatsUrGoal()));
                    // Add your button onPressed logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(
                        255, 128, 203, 131), // Set the button color
                  ),
                  child: Text(
                    'Create New Entity',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "Are you trying to update an existing entity record?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black87),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "Please go to your Workspace and select the 'Renew/Update' button for that entity.",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 180,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              // Add your button click logic here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 232, 242,
                                  221), // Light green background color
                              foregroundColor: Color.fromARGB(255, 72, 177,
                                  75), // Text/icon color when pressed
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Button border radius
                                side: BorderSide(
                                    color: Colors.green), // Border color
                              ),
                            ),
                            child: Text(
                              'Go to Workspace',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "Is your entity based outside of the United States?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black87),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            style:
                                TextStyle(fontSize: 20, color: Colors.black54),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    "You must get an NCAGE Code before starting a registration. Go to the ",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: "NCAGE Request Tool",
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
                                text: " to submit a request.",
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
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Download Your Registration Guide",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black87),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 180,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              // Add your button click logic here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 234, 244,
                                  222), // Light green background color
                              foregroundColor: Color.fromARGB(255, 72, 177,
                                  75), // Text/icon color when pressed
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Button border radius
                                side: BorderSide(
                                    color: Colors.green), // Border color
                              ),
                            ),
                            child: Text(
                              'Download Guide',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.085,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Divider(
              color: Colors.grey, // Customize the color of the divider
              thickness: 1.5,
            ),
          )
        ],
      )),
    );
  }
}

import 'package:axiomapp/enterIncorpInfo.dart';
import 'package:flutter/material.dart';

class reviewEntity extends StatefulWidget {
  const reviewEntity({super.key});

  @override
  State<reviewEntity> createState() => _reviewEntityState();
}

class _reviewEntityState extends State<reviewEntity> {
  String _selectedValue = '';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Review Entity Information",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black54),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(fontSize: 25, color: Colors.black54),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'Review the legal entity list and select whether or not you clearly recognize an entity as yours.',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Row(
              children: [
                Image.asset("images/whatsurgoal.png"),
                SizedBox(
                  width: 7,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Select an Option",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black87),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Flexible(
                    child: RadioListTile(
                      title: Text(
                        'I recognize my entity in the legal entities list.',
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(
                          "If some details are not correct, you can update them."),
                      value:
                          'I recognize my entity in the legal entities list.',
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                    ),
                  ),
                  Flexible(
                    child: RadioListTile(
                      title: Text("I don't recognize my entity in this list."),
                      subtitle: Text("Select Next to continue"),
                      value: "I don't recognize my entity in this list.",
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Expanded(
                child: Container(
                    height: height * 0.8,
                    width: width * 0.7,
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black26,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(1.0),
                    ),
                    child: SingleChildScrollView(
                      child: Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: height * 0.07,
                              color: Color.fromARGB(255, 192, 245, 194),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      "LEGAL ENTITIES LIST",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Text(
                                      "WHERE DO THESE RESULTS COME FROM?",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 28.0, top: 16),
                                child: Text(
                                  "Showing Top Results",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: height * 0.2,
                              width: width * 0.6,
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black26,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(1.0),
                              ),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0, top: 16),
                                        child: Text(
                                          "ARYA OMNITALK RADIO TRUNKING SERVICES PRIVATE LIMITED",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 25.0, top: 16),
                                      child: SizedBox(
                                        width: width * 0.15,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Add your button click logic here
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors
                                                .white, // Light green background color
                                            foregroundColor: Color.fromARGB(
                                                255,
                                                72,
                                                177,
                                                75), // Text/icon color when pressed
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      1), // Button border radius
                                              side: BorderSide(
                                                  color: Colors
                                                      .black26), // Border color
                                            ),
                                          ),
                                          child: Text(
                                            'Branches',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black45,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Doing Business As: ARYA OMNITALK RADIO\nTRUNKING SERVICES PRIVATE LIMITED",
                                            style: TextStyle(
                                                color: Colors.black38),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              "UNIT NO. 202, 2NN FLOOR, SUMMER COURT\nMAGARPATTA CITY, HADAPSAR PUNE, IN-MH 411013\nIND",
                                              style: TextStyle(
                                                  color: Colors.black38),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Container(
                              height: height * 0.2,
                              width: width * 0.6,
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black26,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(1.0),
                              ),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0, top: 16),
                                        child: Text(
                                          "BLUEBRICKS TECHNOLOGIES PRIVATE LIMITED",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 25,
                                        top: 16,
                                      ),
                                      child: SizedBox(
                                        width: width * 0.15,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Add your button click logic here
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors
                                                .white, // Light green background color
                                            foregroundColor: Color.fromARGB(
                                                255,
                                                72,
                                                177,
                                                75), // Text/icon color when pressed
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      1), // Button border radius
                                              side: BorderSide(
                                                  color: Colors
                                                      .black26), // Border color
                                            ),
                                          ),
                                          child: Text(
                                            'Corporate',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black45,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 1.0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Doing Business As: ARYA OMNITALK RADIO\nTRUNKING SERVICES PRIVATE LIMITED",
                                                style: TextStyle(
                                                    color: Colors.black38),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16.0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Text(
                                                  "UNIT NO. 202, 2NN FLOOR, SUMMER COURT\nMAGARPATTA CITY, HADAPSAR PUNE, IN-MH 411013\nIND",
                                                  style: TextStyle(
                                                      color: Colors.black38),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0, top: 16, right: 25),
                                        child: SizedBox(
                                          width: width * 0.15,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Add your button click logic here
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors
                                                  .white, // Light green background color
                                              foregroundColor: Color.fromARGB(
                                                  255,
                                                  72,
                                                  177,
                                                  75), // Text/icon color when pressed
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        1), // Button border radius
                                                side: BorderSide(
                                                    color: Colors
                                                        .black26), // Border color
                                              ),
                                            ),
                                            child: Text(
                                              'Ultimate Parent',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black45,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Container(
                              height: height * 0.2,
                              width: width * 0.6,
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black26,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(1.0),
                              ),
                              child: Column(children: [
                                Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0, top: 16),
                                        child: Text(
                                          "ARYA OMNITALK RADIO TRUNKING SERVICES PRIVATE LIMITED",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, top: 16),
                                      child: SizedBox(
                                        width: width * 0.15,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Add your button click logic here
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors
                                                .white, // Light green background color
                                            foregroundColor: Color.fromARGB(
                                                255,
                                                72,
                                                177,
                                                75), // Text/icon color when pressed
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      1), // Button border radius
                                              side: BorderSide(
                                                  color: Colors
                                                      .black26), // Border color
                                            ),
                                          ),
                                          child: Text(
                                            'Branches',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black45,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Doing Business As: ARYA OMNITALK RADIO\nTRUNKING SERVICES PRIVATE LIMITED",
                                            style: TextStyle(
                                                color: Colors.black38),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              "UNIT NO. 202, 2NN FLOOR, SUMMER COURT\nMAGARPATTA CITY, HADAPSAR PUNE, IN-MH 411013\nIND",
                                              style: TextStyle(
                                                  color: Colors.black38),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Container(
                              height: height * 0.2,
                              width: width * 0.6,
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black26,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(1.0),
                              ),
                              child: Column(children: [
                                Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0, top: 16),
                                        child: Text(
                                          "ARYA OMNITALK RADIO TRUNKING SERVICES PRIVATE LIMITED",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, top: 16),
                                      child: SizedBox(
                                        width: width * 0.15,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Add your button click logic here
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors
                                                .white, // Light green background color
                                            foregroundColor: Color.fromARGB(
                                                255,
                                                72,
                                                177,
                                                75), // Text/icon color when pressed
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      1), // Button border radius
                                              side: BorderSide(
                                                  color: Colors
                                                      .black26), // Border color
                                            ),
                                          ),
                                          child: Text(
                                            'Branches',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black45,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Doing Business As: ARYA OMNITALK RADIO\nTRUNKING SERVICES PRIVATE LIMITED",
                                            style: TextStyle(
                                                color: Colors.black38),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              "UNIT NO. 202, 2NN FLOOR, SUMMER COURT\nMAGARPATTA CITY, HADAPSAR PUNE, IN-MH 411013\nIND",
                                              style: TextStyle(
                                                  color: Colors.black38),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: SizedBox(
                      width: 180,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your button click logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                30), // Button border radius
                            side: BorderSide(
                                color: Colors.black54), // Border color
                          ),
                        ),
                        child:
                            // Icon(Icons.cancel),
                            // SizedBox(
                            //   width: 7,
                            // ),
                            Row(
                          children: [
                            Icon(Icons.cancel),
                            SizedBox(width: 7),
                            Text(
                              'CANCEL',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: const Color.fromARGB(255, 5, 49, 86),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: SizedBox(
                            width: 180,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                // Add your button click logic here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 220, 240,
                                    198), // Light green background color
                                foregroundColor: Color.fromARGB(255, 72, 177,
                                    75), // Text/icon color when pressed
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      25), // Button border radius
                                  side: BorderSide(
                                      color: Colors.green), // Border color
                                ),
                              ),
                              child: Text(
                                'PREVIOUS',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: const Color.fromARGB(255, 6, 43, 74),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: SizedBox(
                            width: 180,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            enterIncorpInfo()));
                                // _isNextButtonPressed = true;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 140, 249,
                                    156), // Light green background color
                                // Text/icon color when pressed
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      25), // Button border radius
                                  // Border color
                                ),
                              ),
                              child: Text(
                                'NEXT',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: const Color.fromARGB(255, 6, 43, 74),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

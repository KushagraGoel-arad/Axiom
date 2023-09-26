import 'package:axiomapp/requireEntitySam.dart';
import 'package:flutter/material.dart';

class whatsUrGoal extends StatefulWidget {
  const whatsUrGoal({super.key});

  @override
  State<whatsUrGoal> createState() => _whatsUrGoalState();
}

class _whatsUrGoalState extends State<whatsUrGoal> {
  String _selectedValue = '';
  bool _isNextButtonPressed = false;
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
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "What is your goal?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black54),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Divider(
                color: Colors.grey, // Customize the color of the divider
                thickness: 1.5,
              ),
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
                      "I want to do business..(Select the option most relevant to you)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black87),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('Directly with U.S. federal government.'),
                  value: 'Directly with U.S. federal government.',
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text(
                      'With a business or other organization which receives funds directly from the U.S. federal government.'),
                  value: 'Option 2',
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Other.'),
                  value: 'Option 3',
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
              ],
            ),
            Visibility(
                visible: _isNextButtonPressed,
                child: Column(
                  children: [
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
                              "Select the answer that best fits your intentions today:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black87),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Column(
                      children: [
                        RadioListTile(
                          title: Text(
                              'Provides goods or services as a federal subcontractor'),
                          value:
                              'Provides goods or services as a federal subcontractor',
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text(
                              'Receive a subaward under a federal grant/financial assistance program'),
                          value: 'Option 2',
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text(
                              'Apply as a direct vendor for federal funds distributed by the government entity other than the federal government.'),
                          value: 'Option 3',
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text(
                              'Apply as a grantee for federal funds distributed by a government entity other than the federal government'),
                          value: 'Directly with U.S. federal government.',
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text(
                              "Just browsing. I don't have anything specific in mind today, but might be interested in future work with organisations who receive funds directly from the U.S. federal government."),
                          value: 'Option 2',
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text(
                              'Participate in, or apply for, other programs. Please describe.'),
                          value: 'Option 3',
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value!;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 200,
                              height: 80,
                              child: TextField(
                                maxLines:
                                    null, // Allows unlimited lines (multiline)
                                keyboardType: TextInputType
                                    .multiline, // Specifies multiline input
                                decoration: InputDecoration(
                                  // contentPadding:
                                  //     EdgeInsets.symmetric(vertical: 40),
                                  hintText: 'Enter your text',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Divider(
                color: Colors.grey, // Customize the color of the divider
                thickness: 1.5,
              ),
            ),
            SizedBox(
              height: height * 0.08,
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
                            Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 18,
                              color: const Color.fromARGB(255, 5, 49, 86),
                              fontWeight: FontWeight.bold),
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
                              onPressed: () async {
                                _isNextButtonPressed = true;
                                bool isCarry = _isNextButtonPressed;
                                if (isCarry) {
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => reqEntSam()));
                                } else {
                                  print("Select one option");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 208, 207,
                                    207), // Light green background color
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
                                    color: Colors.white,
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
        )),
      ),
    );
  }
}

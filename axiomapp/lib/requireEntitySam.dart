import 'package:axiomapp/choosOption.dart';
import 'package:flutter/material.dart';

class reqEntSam extends StatefulWidget {
  const reqEntSam({super.key});

  @override
  State<reqEntSam> createState() => _reqEntSamState();
}

class _reqEntSamState extends State<reqEntSam> {
  String _selectedItem = 'Enter Code or Name';
  List<String> _items = ['Enter Code or Name'];

  String _selectedItem1 = 'Enter Code or Name';
  List<String> _items1 = ['Enter Code or Name'];

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
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    "Who required your entity to be in AXIOM PROTECT 2.0?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black54),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16, top: 5, bottom: 5),
              child: Divider(
                color: Colors.grey, // Customize the color of the divider
                thickness: 1.5,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                ),
                child: Text(
                  "Only select the primary source.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('Federal government'),
                  value: 'Directly with U.S. federal government.',
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Federal Hierarchy (Optional)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black54,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedItem,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedItem = newValue!;
                                });
                              },
                              items: _items.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                RadioListTile(
                  title: Text('U.S. state or territory government or office'),
                  value: 'U.S. state or territory government or office',
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
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black54,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedItem1,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedItem1 = newValue!;
                                });
                              },
                              items: _items1.map((String item1) {
                                return DropdownMenuItem<String>(
                                  value: item1,
                                  child: Text(
                                    item1,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                RadioListTile(
                  title: Text(
                      'Local government office, i.e., of a country or a city'),
                  value:
                      'Local government office, i.e., of a country or a city',
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
              ],
            ),
            Column(
              children: [
                Column(
                  children: [
                    RadioListTile(
                      title: Text('Tribal Government or office'),
                      value:
                          'Provides goods or services as a federal subcontractor',
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, right: 600, top: 5, bottom: 5),
                      child: Divider(
                        color:
                            Colors.grey, // Customize the color of the divider
                        thickness: 1.5,
                      ),
                    ),
                    RadioListTile(
                      title: Text('A company or business'),
                      value: 'A company or business',
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text(
                          'Hospital system or healthcare organization (for profit or non-profit)'),
                      value: 'Option 3',
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('Non-profit organisation'),
                      value: 'Non-profit organisation',
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text(
                          "University or research facility (for profit or non-profit)"),
                      value:
                          'University or research facility (for profit or non-profit)',
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, right: 600, top: 5, bottom: 5),
                      child: Divider(
                        color:
                            Colors.grey, // Customize the color of the divider
                        thickness: 1.5,
                      ),
                    ),
                    RadioListTile(
                      title: Text(
                          'Industry group, professional association, trade publication, etc.'),
                      value:
                          'Industry group, professional association, trade publication, etc.',
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title:
                          Text('APEX Accelerators (formerly known as PTACs)'),
                      value: 'APEX Accelerators (formerly known as PTACs)',
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('I decided on my own'),
                      value: 'I decided on my own',
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, right: 600, top: 5, bottom: 5),
                      child: Divider(
                        color:
                            Colors.grey, // Customize the color of the divider
                        thickness: 1.5,
                      ),
                    ),
                    RadioListTile(
                      title: Text('None of the above'),
                      value: 'None of the above',
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 36.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Please Specify")),
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
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Divider(
                color: Colors.grey, // Customize the color of the divider
                thickness: 1.5,
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => chooseOption()));
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
        )),
      ),
    );
  }
}

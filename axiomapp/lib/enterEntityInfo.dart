import 'package:axiomapp/reviewEntityInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class enterEntityInfo extends StatefulWidget {
  const enterEntityInfo({super.key});

  @override
  State<enterEntityInfo> createState() => _enterEntityInfoState();
}

class _enterEntityInfoState extends State<enterEntityInfo> {
  String _selectedItem = '                  ';
  List<String> _items = ['                  '];

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
                    "Enter Entity Information",
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
                            'Enter your current, correct legal business name and physical address, then select ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: 'Next.',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Legal Business Name",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "If you are acting on behalf of a limited partnership,LLC, or corporation, your legal business name is the name you registered with your state filing office.",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 550,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 182, 224, 242),
                      //labelText: 'Email Address',
                      //labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 10, 10, 10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 22, 103, 170)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16),
                child: Text(
                  "Doing Business As (Optional)",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Doing business as is the commonly used other name, such as a franchise, license name, or acronym.\nLeave blank if not applicable.",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 550,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 182, 224, 242),
                      //labelText: 'Email Address',
                      //labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 10, 10, 10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 22, 103, 170)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16),
                    child: Text(
                      "Physical Address",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black87),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      "Your physical address is the street address of the primary office or other building where your entity is located. A post office box may not be used as your physical address.",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16),
                    child: Text(
                      "Country",
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16),
                    child: Text(
                      "Street Address 1",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 550,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 182, 224, 242),
                          //labelText: 'Email Address',
                          //labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 10, 10, 10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 22, 103, 170)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16),
                    child: Text(
                      "Street Address 2 (Optional)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 550,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 182, 224, 242),
                          //labelText: 'Email Address',
                          //labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 10, 10, 10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 22, 103, 170)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16),
                    child: Text(
                      "ZIP Code ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 190,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 182, 224, 242),
                          //labelText: 'Email Address',
                          //labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 10, 10, 10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 22, 103, 170)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('City',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Container(
                            width: 350,
                            child: TextField(
                              //controller: textField1Controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('State/Territory',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Icon(CupertinoIcons.info_circle)
                            ],
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: 300,
                            child: TextField(
                              //controller: textField2Controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Divider(
            //     color: Colors.grey, // Customize the color of the divider
            //     thickness: 1.5,
            //   ),
            // ),
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
                                _isNextButtonPressed = true;
                                Navigator.push(context,
                      MaterialPageRoute(builder: (context) => reviewEntity()));
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

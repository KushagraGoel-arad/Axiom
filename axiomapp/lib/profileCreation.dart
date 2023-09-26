import 'package:axiomapp/createEntity.dart';
import 'package:axiomapp/login.dart';
import 'package:axiomapp/selectRole.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class profileCreation extends StatefulWidget {
  const profileCreation({super.key});

  @override
  State<profileCreation> createState() => _profileCreationState();
}

class _profileCreationState extends State<profileCreation> {
  final countryPicker = const FlCountryCodePicker();

  CountryCode? countryCode;
  TextEditingController _phoneController = TextEditingController();
  String _selectedItem = 'Enter UEI, LBN, CAGE, DoDAAC, or Office Code';
  List<String> _items = [
    'Enter UEI, LBN, CAGE, DoDAAC, or Office Code',
    'UEI',
    'LBN',
    'CAGE',
    'DoDAAC',
    'Office Code'
  ];
  String _selectedItem1 = 'Select a Role';
  List<String> _items1 = ['Select a Role', "Banker"];

  bool showDialogBox = false;
  Future<bool> showMyDialog(String _title, String _message) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_title),
          content: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Request Role (Optional)",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Note: If you know that you need a role, you may request it now. All the fields are required to submit a request. You may also choose to skip this step and request a role a later time.",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Request Details",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Entity",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      Text(
                        "Required",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "To be assigned additional roles and permissions for an organisation, you must be associated with an entity. Enter an Entity ID (UEI or CAGE) or Entity Name to find your entity.",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 165, 205, 237),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Role",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      Text(
                        "Required",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "The following roles are available based on your profile. If you need an administrative or other specialized role, reach out to your administrator",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Role Selection is Required",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.red),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 165, 205, 237),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
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
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: SizedBox(
                width: 140,
                height: 29,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                    // Add your button click logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 224, 240, 224),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(3), // Button border radius
                      // Border color
                    ),
                  ),
                  child: Text(
                    'close',
                    style: TextStyle(
                        fontSize: 18,
                        color: const Color.fromARGB(255, 5, 49, 86),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool _isChecked = true;
    String _selectedLanguage = '';

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                  "Complete your profile",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      "Next, complete the following fields. Unless marked as optional, all fields are required. ")),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("First Name",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: TextFormField(
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Last Name",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: TextFormField(
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Email Address",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: TextFormField(
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Business Phone (Optional)",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Country code is 1 for USA and North America",
                    style: TextStyle(color: Colors.black54),
                  )),
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                onPressed: () async {
                  bool dialogResult = await showMyDialog(
                      "Confirm Email", "Close the window once done");
                  if (dialogResult) {
                    // Dialog box was closed using the close button
                    setState(() {
                      showDialogBox = true; // Set the showDialogBox to true
                    });
                  } else {
                    // Dialog box was closed without using the close button
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => createEntity()));
                  }
                },
                child: const Center(
                    child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  backgroundColor: Colors.white, // Background color
                  foregroundColor:
                      Color.fromARGB(255, 22, 103, 170), // Text color
                  side: BorderSide(
                    color:
                        Color.fromARGB(255, 22, 103, 170), // Outer border color
                    width: 2.0,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => login(),
                    ),
                  );
                },
                child: const Center(
                    child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: Color.fromARGB(255, 22, 103, 170),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

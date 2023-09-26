import 'package:axiomapp/Widgets/UploadDocument.dart';
import 'package:flutter/material.dart';

class enterIncorpInfo extends StatefulWidget {
  const enterIncorpInfo({super.key});

  @override
  State<enterIncorpInfo> createState() => _enterIncorpInfoState();
}

class _enterIncorpInfoState extends State<enterIncorpInfo> {
  int currentStep = 0;
  bool _isFileUploaded = false;
  String _selectedFileName = '';

  void _uploadDocument(String fileName) {
    setState(() {
      _isFileUploaded = true;
      _selectedFileName = fileName;
    });
  }

  void _changeFile() {
    setState(() {
      _isFileUploaded = false;
      _selectedFileName = '';
    });
  }

  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;

  String _selectedItem = 'Other Document';
  List<String> _items = [
    'Other Document',
    'Articles of incorporation/organization',
    'Articles of formation or company bylaws',
    'Bank Statements',
    'Certificate of formation/organization',
    'Certified or validated tax returns or filings',
    '"Doing business as" documentation',
    'Employer Identification Number or Tax ID documentation from IRS',
    'Non-expired driver\'s license- sole proprietors and individuals doing business as only',
    'Operating agreements',
    'Share Certificates',
    'Stock Ownership',
    'Utility Bills'
  ];
  showMyDialog(String _title, String _message) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_title),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ListBody(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          _message,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Select a Document Type",
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
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            "This document includes the following. Select all that apply."),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Checkbox(
                          value: _isChecked1,
                          onChanged: (value) {
                            setState(() {
                              _isChecked1 = value!;
                            });
                          },
                        ),
                        title: Text(
                          'Legal business name and physical address in the same document.',
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Checkbox(
                          value: _isChecked2,
                          onChanged: (value) {
                            setState(() {
                              _isChecked2 = value!;
                            });
                          },
                        ),
                        title: Text(
                          'Legal business name and doing business as name in the same document.',
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Checkbox(
                          value: _isChecked3,
                          onChanged: (value) {
                            setState(() {
                              _isChecked3 = value!;
                            });
                          },
                        ),
                        title: Text(
                          'Legal business name and start year in the same document.',
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Select Document",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CustomPaint(
                            painter: DashedBorderPainter(),
                            child: _isFileUploaded
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Selected file:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 8),
                                      Text(_selectedFileName),
                                      SizedBox(height: 16),
                                      ElevatedButton(
                                        onPressed: _changeFile,
                                        child: Text('Change File'),
                                      ),
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.cloud_upload, size: 40),
                                      SizedBox(height: 16),
                                      Text(
                                          'Drag and drop a file here\nor click to select a file'),
                                      SizedBox(height: 16),
                                      ElevatedButton(
                                        onPressed: () {
                                          _uploadDocument(
                                              'example_document.pdf');
                                        },
                                        child: Text('Upload File'),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Center(
                    child: SizedBox(
                      width: 140,
                      height: 29,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Add your button click logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 201, 232, 202),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                3), // Button border radius
                            // Border color
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 18,
                              color: const Color.fromARGB(255, 5, 49, 86),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Center(
                    child: SizedBox(
                      width: 140,
                      height: 29,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Add your button click logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 151, 240, 154),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                3), // Button border radius
                            // Border color
                          ),
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              fontSize: 18,
                              color: const Color.fromARGB(255, 5, 49, 86),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  List<Step> getSteps() => [
        Step(
            label: Text("Get Started"),
            isActive: currentStep >= 0,
            title: Text(""),
            content: Container(
              color: Colors.white,
              child: Column(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16),
                    child: Text(
                      "Enter Incorporation Information",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 56, 55, 55),
                          fontSize: 20),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16),
                    child: Text(
                      "Start Year",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(221, 59, 59, 59),
                          fontSize: 14),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 190,
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 182, 224, 242),
                          //labelText: 'Email Address',
                          //labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1),
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
                SizedBox(
                  height: 35,
                ),
                Container(
                  height: 120,
                  width: 550,
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 244, 237, 237),
                    border: Border.all(
                      color: Colors.black26,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(1.0),
                  ),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style:
                                TextStyle(fontSize: 25, color: Colors.black54),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Start Year ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'could be',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    BulletPointText('your year of incorporation'),
                    BulletPointText('your "established date"'),
                    BulletPointText(
                        'the year you legally began doing business'),
                  ]),
                ),
                SizedBox(
                  height: 20,
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
                                      color:
                                          const Color.fromARGB(255, 5, 49, 86),
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
                                    backgroundColor: Color.fromARGB(
                                        255,
                                        220,
                                        240,
                                        198), // Light green background color
                                    foregroundColor: Color.fromARGB(
                                        255,
                                        72,
                                        177,
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
                                        color: const Color.fromARGB(
                                            255, 6, 43, 74),
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
                                    //_isNextButtonPressed = true;
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(
                                        255,
                                        140,
                                        249,
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
                                        color: const Color.fromARGB(
                                            255, 6, 43, 74),
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
              ]),
            )),
        Step(
            label: Text("Enter Entity Data"),
            isActive: currentStep >= 1,
            title: Text(""),
            content: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Expanded(
                  child: Column(children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 16),
                        child: Text(
                          "Confirm Entity Information",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 56, 55, 55),
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          color: Color.fromARGB(255, 207, 234, 245),
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: TextFormField(
                              decoration: InputDecoration(

                                  //labelText: 'Email Address',
                                  //labelStyle: TextStyle(color: Colors.grey),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16.0, top: 16),
                                child: Text(
                                  "Bluebricks Technologies Pvt Ltd",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 56, 55, 55),
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16.0, top: 16),
                                child: Text(
                                  "C15 Friends Enclave, Mundhwa Rd, Magarpatta,\nMundhwa, Pune, Maharashtra 411036\nPune, IN-MH\nINDIA",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 56, 55, 55),
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, top: 16),
                                  child: Text(
                                    "Year of Incorporation",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 56, 55, 55),
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, top: 16),
                                  child: Text(
                                    "2014",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 56, 55, 55),
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style:
                                TextStyle(fontSize: 25, color: Colors.black54),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'If update is correct select ',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: 'Next',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                    ', If you need to further revise the details,select ',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: 'Previous',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                                          color: const Color.fromARGB(
                                              255, 5, 49, 86),
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
                                        backgroundColor: Color.fromARGB(
                                            255,
                                            220,
                                            240,
                                            198), // Light green background color
                                        foregroundColor: Color.fromARGB(
                                            255,
                                            72,
                                            177,
                                            75), // Text/icon color when pressed
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              25), // Button border radius
                                          side: BorderSide(
                                              color:
                                                  Colors.green), // Border color
                                        ),
                                      ),
                                      child: Text(
                                        'PREVIOUS',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: const Color.fromARGB(
                                                255, 6, 43, 74),
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
                                        //_isNextButtonPressed = true;
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color.fromARGB(
                                            255,
                                            140,
                                            249,
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
                                            color: const Color.fromARGB(
                                                255, 6, 43, 74),
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
                  ]),
                ),
              ),
            )),
        Step(
            label: Text("Start Validation"),
            isActive: currentStep >= 2,
            title: Text(""),
            content: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Document Your Entity Details ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                              "Review Requirements",
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
                      padding: const EdgeInsets.all(32.0),
                      child: Expanded(
                        child: Container(
                            height: 170,
                            width: 550,
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black26,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            child: Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    height: 35,
                                    color: Color.fromARGB(255, 192, 245, 194),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            "YOU ARE DOCUMENTING ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0, top: 16),
                                                child: Text(
                                                  "Bluebricks Technologies Pvt Ltd",
                                                  style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 16),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0, top: 16),
                                                child: Text(
                                                  "C15 Friends Enclave, Mundhwa Rd, Magarpatta,\nMundhwa, Pune, Maharashtra 411036\nPune, IN-MH\nINDIA",
                                                  style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 16.0),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16.0, top: 16),
                                                  child: Text(
                                                    "Year of Incorporation",
                                                    style: TextStyle(
                                                        color: Colors.black45,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16.0, top: 16),
                                                  child: Text(
                                                    "2014",
                                                    style: TextStyle(
                                                        color: Colors.black45,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset("images/whatsurgoal.png"),
                        SizedBox(
                          width: 3,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Attach Documents",
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
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'You must attach one or more ',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'official documents',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            Color.fromARGB(255, 109, 187, 250)),
                                  ),
                                  TextSpan(
                                    text:
                                        ' that prove each of the items listed. A check here confirms you have provided proof for the required item. ',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        BulletPointText(
                            'Legal business name and physical address in the same document.'),
                        BulletPointText(
                            'Legal business name and start year in the same document.'),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 7, bottom: 7),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "The documents you provide may additionally include:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        BulletPointText(
                            'Legal business name and doing business as name in the same document.'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 190,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                showMyDialog("Add Document", "");
                                // Add your button click logic here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      5), // Button border radius
                                  side: BorderSide(
                                      color: Colors.black54), // Border color
                                ),
                              ),
                              child: Text(
                                'Add Document',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: const Color.fromARGB(255, 5, 49, 86),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Row(
                      children: [
                        Image.asset("images/whatsurgoal.png"),
                        SizedBox(
                          width: 3,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Provide Details (Optional)",
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
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black45),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'Please provide additional context for your specific situation, if necessary.',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Container(
                            height: 120,
                            width: 250,
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black87,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text("500 characters allowed",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          Color.fromARGB(255, 211, 210, 210)))),
                        ),
                      ],
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
                                          color: const Color.fromARGB(
                                              255, 5, 49, 86),
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
                                        backgroundColor: Color.fromARGB(
                                            255,
                                            220,
                                            240,
                                            198), // Light green background color
                                        foregroundColor: Color.fromARGB(
                                            255,
                                            72,
                                            177,
                                            75), // Text/icon color when pressed
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              25), // Button border radius
                                          side: BorderSide(
                                              color:
                                                  Colors.green), // Border color
                                        ),
                                      ),
                                      child: Text(
                                        'PREVIOUS',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: const Color.fromARGB(
                                                255, 6, 43, 74),
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
                                        // _isNextButtonPressed = true;
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color.fromARGB(
                                            255,
                                            140,
                                            249,
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
                                            color: const Color.fromARGB(
                                                255, 6, 43, 74),
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
              ),
            )),
        Step(
            label: Text("Complete Validation"),
            isActive: currentStep >= 3,
            title: Text(""),
            content: Container()),
        Step(
            label: Text("Get Unique Entity ID"),
            isActive: currentStep >= 4,
            title: Text(""),
            content: Container(
              color: Colors.white,
              child: Column(children: [
                Image.asset("images/complete_valid.png"),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16),
                    child: Text(
                      "Documentation Successfully Submitted",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 56, 55, 55),
                          fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Image.asset("images/docsSubmitted.png"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(fontSize: 25, color: Colors.black54),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                '*This is an estimate of how many business days it will take us to respond. Business\ndays do not include weekends or U.S. federal holidays.',
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
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: SizedBox(
                      width: 100,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your button click logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                2), // Button border radius
                            side: BorderSide(
                                color: Colors.black45), // Border color
                          ),
                        ),
                        child:
                            // Icon(Icons.cancel),
                            // SizedBox(
                            //   width: 7,
                            // ),
                            Text(
                          'Close',
                          style: TextStyle(
                              fontSize: 18,
                              color: const Color.fromARGB(255, 5, 49, 86),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            )),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
        onStepContinue: () {
          setState(() {
            currentStep += 1;
          });
        },
        onStepCancel: () {
          setState(() {
            currentStep -= 1;
          });
        },
      ),
    );
  }
}

class BulletPointText extends StatelessWidget {
  final String text;

  BulletPointText(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8.0),
          child: Icon(
            Icons.circle,
            size: 8,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final dashWidth = 5;
    final dashSpace = 5;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

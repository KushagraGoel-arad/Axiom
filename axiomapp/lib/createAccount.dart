import 'package:axiomapp/addAuthApp.dart';
import 'package:axiomapp/authMethodSetup.dart';
import 'package:axiomapp/confirmEmail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'absoluteAuthApp.dart';

class createAccount extends StatefulWidget {
  const createAccount({super.key});

  @override
  State<createAccount> createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {
  // bool showDialogBox = false;
  // bool emailSent = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  List<String> _selectedItem = [];
  List<String> _items = [];
  bool _isLoading = false;
  TextEditingController _typeAheadController = TextEditingController();
  // TextEditingController appNameController = TextEditingController();
  // String _selectedItem = 'Absolute';
  // List<String> _items = [
  //   'Absolute',
  //   'SonicEKYC',
  //   'absolute1',
  //   'oidc',
  //   'BB',
  //   'Microsoft Auth',
  //   'Google Auth',
  // ];
  // List<String> _selectedApplications = [];
  // Map<String, bool> _applicationItems = {};
  // List<Map<String, dynamic>> resultData = [];
  // List<DropdownMenuItem<String>> dropdownItems = [];
  bool showDialogBox = false;
  bool emailSent = false;
  //TextEditingController emailController = TextEditingController();
  // String? _selectedItem;
  List<String> _selectedApplications = [];
  Map<String, bool> _applicationItems = {};
  List<Map<String, dynamic>> resultData = [];
  List<DropdownMenuItem<String>> dropdownItems = [];
  TextEditingController appNameController = TextEditingController();

  String getCurrentDateTime() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(now);
  }

  Map<String, String> _itemToAppIdMapping = {};
  String? _selectedAppId;
  String? _selectedAppType;
  @override
  void initState() {
    super.initState();
    String accountId = '8797893D-7F0D-4B5F-9F6E-DE1706BC33D0';
    getJWTToken(accountId).then((jwtToken) {
      getAll(jwtToken, accountId).then((appNames) {
        setState(() {
          //_items = appNames;
          _items = appNames;
          _selectedAppId =
              _items.isNotEmpty ? _itemToAppIdMapping[_items[0]] : null;
          //_selectedAppId = appNames.isNotEmpty ? appNames[0] : null;
        });
      });
      // for (var appData in resultData) {
      //   String appName = appData['appname'];
      //   String appId = appData['appid'];
      //   _itemToAppIdMapping[appName] = appId;
      // }

      //   setState(() {
      //     dropdownItems = resultData.map((appData) {
      //       String appName = appData['appname'];
      //       return DropdownMenuItem<String>(
      //         value: appName,
      //         child: Text(appName),
      //       );
      //     }).toList();

      //     _selectedItem =
      //         dropdownItems.isNotEmpty ? dropdownItems[0].value : null;

      //     appNameController.text = _selectedItem ?? '';
      //   });

      //   print(dropdownItems);
    });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   String accountId = '8797893D-7F0D-4B5F-9F6E-DE1706BC33D0';
  //   getJWTToken(accountId).then((jwtToken) {
  //     getAll(jwtToken, accountId);

  //     setState(() {
  //       dropdownItems = resultData.map((appData) {
  //         String appName = appData['appname'];
  //         return DropdownMenuItem<String>(
  //           value: appName,
  //           child: Text(appName),
  //         );
  //       }).toList();
  //       // Set the initial value of the dropdown
  //       _selectedItem =
  //           dropdownItems.isNotEmpty ? dropdownItems[0].value : null;
  //       // Update the controller with the initial value
  //       appNameController.text = _selectedItem ?? '';
  //     });
  //     if (kDebugMode) {
  //       print(dropdownItems);
  //     }
  //   });
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   String accountId = '8797893D-7F0D-4B5F-9F6E-DE1706BC33D0';
  //   getJWTToken(accountId).then((jwtToken) {
  //     getAll(jwtToken, accountId);
  //     // After you have fetched the data, populate dropdownItems here.
  //     setState(() {
  //       dropdownItems = resultData.map((appData) {
  //         String appName = appData['appname'];
  //         return DropdownMenuItem<String>(
  //           value: appName,
  //           child: Text(appName),
  //         );
  //       }).toList();
  //     });
  //     print(dropdownItems);
  //   });
  // }
  Widget buildDropdownButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 475, // Set the width of the dropdown container
        height: 49, // Set the height of the dropdown container
        padding: EdgeInsets.only(),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 22, 103, 170),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // MultiSelectFormField(
              //   autovalidate: AutovalidateMode.disabled,
              //   chipBackGroundColor: Colors.blue,
              //   chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              //   dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
              //   checkBoxActiveColor: Colors.blue,
              //   checkBoxCheckColor: Colors.white,
              //   dialogShapeBorder: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(12.0))),
              //   title: Text('Applications'),
              //   dataSource: _items
              //       .map((item) => {'display': item, 'value': item})
              //       .toList(),
              //   textField: 'display',
              //   valueField: 'value',
              //   okButtonLabel: 'OK',
              //   cancelButtonLabel: 'CANCEL',
              //   //hintWidget: Text('Please choose one or more'),
              //   initialValue: _selectedItem,
              //   onSaved: (value) {
              //     if (value == null) return;
              //     setState(() {
              //       _selectedItem = value.cast<String>();
              //     });
              //   },
              // ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    //labelText: 'Applications',
                    // border: OutlineInputBorder(),
                    ),
                value: _selectedAppId,
                items: _items.map((item) {
                  return DropdownMenuItem<String>(
                    value: _itemToAppIdMapping[item],
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    //  _selectedAppType=;
                    //_selectedAppId = _itemToAppIdMapping[newValue!];
                    _selectedAppId = newValue;
                  });
                  print('New value: $newValue');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Success"),
          content: Text("Email sent successfully."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the success dialog
                setState(() {
                  // sendRandomPassword();
                  emailSent = true; // Set emailSent to true
                });
                // Show the second dialog or navigate to the next page
                showMyDialog();
              },
            ),
          ],
        );
      },
    );
  }

  void createSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text("Success"),
          content: Text("Email sent successfully."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the success dialog
                setState(() {
                  // sendRandomPassword();
                  emailSent = true; // Set emailSent to true
                });
                // Show the second dialog or navigate to the next page
                showMyDialog();
              },
            ),
          ],
        );
      },
    );
  }

  void showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the error dialog
              },
            ),
          ],
        );
      },
    );
  }

  Future<String?> getJWTToken(String accountId) async {
    var ct = getCurrentDateTime();
    final url = Uri.parse(
        'https://access.axiomprotect.com:6653/AxiomProtect/v1/user/getJWTToken?accountId=$accountId&value=FR1QFSJ2IYXLRMOG');

    final headers = {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': '*',
    };

    final body = jsonEncode({
      "accountId": "8797893D-7F0D-4B5F-9F6E-DE1706BC33D0",
    });

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      print('POST request successful');
      print(response.body);
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse['resultCode'] == 0) {
        print(jsonResponse);

        final jwtToken = jsonResponse['resultData'];
        // final tokenExpiry = jsonResponse['resultData']['tokenExpiry'];
        // final userDetails = jsonResponse['resultData']['user']['userid'];
        // final accountId = jsonResponse['resultData']['user']['accountid'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('jwtToken', jwtToken);
        // prefs.setString('jwtToken', jwtToken);
        // prefs.setInt('tokenExpiry', tokenExpiry);
        // prefs.setString('userDetails', userDetails);
        // prefs.setString('accountId', accountId);
        return jwtToken;
      } else {
        return null;
        //print('Response code not 0');
      }
      // showSuccessDialog(); // Show the first dialog
      // setState(() {
      //   emailSent = true; // Set the emailSent variable to true
      // });
    } else {
      print('POST request failed');
      print(response.statusCode);
      print(response.body);
      // showErrorDialog();
    }
  }

  Future<List<String>> getAll(String? jwtToken, String accountId) async {
    if (jwtToken == null) {
      // Handle the case where jwtToken is null or not available
      return [];
    }
    String? appId;
    var ct = getCurrentDateTime();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final authToken = prefs.getString('jwtToken');

    final url = Uri.parse(
        'https://access.axiomprotect.com:6653/AxiomProtect/v1/application/getAll?accountId=$accountId&requestTime=$ct');

    final headers = {
      'authToken': authToken,
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': '*',
    }.cast<String, String>();

    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      // Request was successful
      print('GET request successful');
      print(response.body);

      final jsonResponse = json.decode(response.body);

      final resultData = jsonResponse['resultData'];
      // final appType= resultData['resultData'];

      // List<String> appIds = [];
      // for (var appData in resultData) {
      //   appId = appData['appid'];
      //   String appName = appData['appname'];
      //   SharedPreferences prefs = await SharedPreferences.getInstance();
      //   prefs.setString('appid', appId!);
      //   appIds.add(appId);
      //   _itemToAppIdMapping[appName] = appId;
      //   // Access other fields as needed
      //   // print('App Name: $appName');
      //   // _applicationItems[appName] = true;
      // }
      // return appIds;

      List<String> appNames = [];
      for (var appData in resultData) {
        String appName = appData['appname'];
        String appId = appData['appid'];
        String appType = appData['apptype'];
        appNames.add(appName);
        _itemToAppIdMapping[appName] = appId;
        // You can also map appname to appid here
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('appid', appId);
        prefs.setString('apptype', appType);
      }
      return appNames;
    } else {
      // Request failed
      print('GET request failed');
      print(response.statusCode);
      print(response.body);
      return [];
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> create() async {
    setState(() {
      _isLoading = true; // Set loading state to true
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final appID = _selectedAppId;
    final authToken = prefs.getString('jwtToken');

    //final appTYpe = prefs.getString('apptype');
    // print(appID);
    //print("appTYpe : $appTYpe");
    get();
    //final apType = prefs.getString('apptype');
    var ct = getCurrentDateTime();

    final url = Uri.parse(
        'https://access.axiomprotect.com:6653/AxiomProtect/v1/user/create?sendEmail=true&appId=$appID&requestTime=$ct');

    final headers = {
      'authToken': authToken,
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': '*',
    }.cast<String, String>();
    final body = jsonEncode({
      "accountid": "8797893D-7F0D-4B5F-9F6E-DE1706BC33D0",
      "email": emailController.text,
      "phone": phoneController.text,
      "userid": userIdController.text,
      // "userimage": "string",
      "username": nameController.text
    });
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print('POST request successful');
      print(response.body);
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      String? resultMessage = jsonResponse['resultMessage'];

      if (resultMessage != null) {
        print('Result Message: $resultMessage');
      } else {
        print('Result Message is null.');
      }

      if (jsonResponse['resultCode'] == 0) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(() {
          _isLoading =
              false; // Set loading state to false when request completes
        });

        final aType = prefs.getString('apptype');
        print("appType: $aType");
        userCreatedSuccess(appTYPE: aType);

        final userId = jsonResponse['resultData']['userid'];
        final accountId = jsonResponse['resultData']['accountid'];
        //SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString('userid', userId);
        prefs.setString('accountid', accountId);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => userCreatedSuccess(),
        //   ),
        // );
      } else {
        showErrorDialog('$resultMessage');
      }
    } else {
      print('POST request failed');
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }
  }

  Future<void> get() async {
    // setState(() {
    //   _isLoading = true; // Set loading state to true
    // });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final appID = _selectedAppId;
    final authToken = prefs.getString('jwtToken');
    //final appTYpe = prefs.getString('apptype');
    final accountId = prefs.getString('accountid');
    // print(appID);
    // print("appTYpe : $appTYpe");
    var ct = getCurrentDateTime();
    final url = Uri.parse(
        'https://access.axiomprotect.com:6653/AxiomProtect/v1/application/get?accountId=$accountId&appId=$appID&requestTime=$ct');

    final headers = {
      'authToken': authToken,
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': '*',
    }.cast<String, String>();

    final response = await http.get(
      url,
      headers: headers,
    );
    // setState(() {
    //   _isLoading = false; // Set loading state to false when request completes
    // });

    if (response.statusCode == 200) {
      print('POST request successful');
      print(response.body);
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      String? resultMessage = jsonResponse['resultMessage'];
      if (resultMessage != null) {
        print('Result Message: $resultMessage');
      } else {
        print('Result Message is null.');
      }

      if (jsonResponse['resultCode'] == 0) {
        //userCreatedSuccess(appTYPE: appTYpe);

        final appTYPe = jsonResponse['resultData']['apptype'];

        SharedPreferences prefs = await SharedPreferences.getInstance();

        final AppType = prefs.setString('apptype', appTYPe);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => userCreatedSuccess(),
        //   ),
        // );
      } else {
        showErrorDialog('$resultMessage');
      }
    } else {
      print('POST request failed');
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }
  }

  Future<bool> showMyDialog() async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text(_title),
          content: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Check your email",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'We sent a confirmation mail to ',
                        ),
                        TextSpan(
                            text: emailController.text,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text:
                              ' with a link to confirm your email address. Follow the link to continue creating your account.',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Didn\'t receive an email? ',
                      ),
                      TextSpan(
                        text: 'Resend',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // resendActivationCode();

                            // Add your navigation logic here, e.g., open a URL or navigate to a screen
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Or, ',
                      ),
                      TextSpan(
                        text: 'use a different email address',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Add your navigation logic here, e.g., open a URL or navigate to a screen
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "You can close this window if you're done.",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => authMetSetup(
                                  jwtToken: null,
                                  tokenExpiry: null,
                                  userDetails: null,
                                  accountId: '',
                                )));
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

  Future<bool> userCreatedSuccess({String? appTYPE}) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: 300, // Set the desired width
            height: 200,
            child: Column(
              children: [
                Image.asset("images/complete_valid.png"),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16),
                    child: Text(
                      "User Account Created Successfully",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 56, 55, 55),
                        fontSize: 30,
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
                    if (appTYPE == "1") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => absoluteAuthApp(
                                  selectedAppId: _selectedAppId,
                                )),
                      );
                    } //
                    else if (appTYPE == "6" || appTYPE == "7") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => addAuthApp(
                                  selectedAppId: _selectedAppId,
                                )),
                      );
                    }

                    // Add your button click logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 147, 246, 147),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  child: Text(
                    'Ok',
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 5, 49, 86),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  bool _isChecked = true;
  String _selectedLanguage = "";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool _isChecked = true;
    String _selectedLanguage = '';

    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 224, 236, 245),
      body: SingleChildScrollView(
        child: Center(
          child: Stack(children: [
            Container(
                child: Column(
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text(
                      "Create an account for new users",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 16.0),
                //   child: Align(
                //       alignment: Alignment.topLeft,
                //       child: Text(
                //           "Next, complete the following fields. Unless marked as optional, all fields are required. ")),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Name*",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 8, right: 100),
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 182, 224, 242),
                            //labelText: 'Email Address',
                            //labelStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 22, 103, 170)),
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
                  padding: const EdgeInsets.only(left: 50.0, top: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Email*",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 8, right: 100),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 182, 224, 242),
                            //labelText: 'Email Address',
                            //labelStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 22, 103, 170)),
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
                  padding: const EdgeInsets.only(left: 50.0, top: 16),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Phone*",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 8, right: 100),
                        child: TextFormField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 182, 224, 242),
                            //labelText: 'Email Address',
                            //labelStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 22, 103, 170)),
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
                  padding: const EdgeInsets.only(left: 50.0, top: 16),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("UserId*",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 8, right: 100),
                        child: TextFormField(
                          controller: userIdController,
                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 182, 224, 242),
                            //labelText: 'Email Address',
                            //labelStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 22, 103, 170)),
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
                  padding: const EdgeInsets.only(left: 50.0, top: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Select a Application",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 60.0, top: 10, right: 100),
                  child: buildDropdownButton(),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  height: height * 0.1,
                  width: width * 0.2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        backgroundColor: Color.fromARGB(255, 22, 103, 170),
                      ),
                      onPressed: () async {
                        create();
                        // bool dialogResult = await showMyDialog(
                        //     "Confirm Email", "Close the window once done");
                        // if (dialogResult) {
                        //   // Dialog box was closed using the close button
                        //   setState(() {
                        //     showDialogBox = true; // Set the showDialogBox to true
                        //   });
                        // } else {
                        //   // Dialog box was closed without using the close button
                        //   // Navigator.push(
                        //   //     context,
                        //   //     MaterialPageRoute(
                        //   //         builder: (context) => createEntity()));
                        // }
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
                ),
                // Container(
                //   height: height * 0.1,
                //   width: width * 0.5,
                //   child: Padding(
                //     padding: const EdgeInsets.all(14.0),
                //     child: ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //         padding: const EdgeInsets.symmetric(
                //             horizontal: 20, vertical: 20),
                //         backgroundColor: Colors.white, // Background color
                //         foregroundColor:
                //             Color.fromARGB(255, 22, 103, 170), // Text color
                //         side: BorderSide(
                //           color: Color.fromARGB(
                //               255, 22, 103, 170), // Outer border color
                //           width: 2.0,
                //         ),
                //       ),
                //       onPressed: () {
                //         // Navigator.push(
                //         //   context,
                //         //   MaterialPageRoute(
                //         //     builder: (context) => login(),
                //         //   ),
                //         // );
                //       },
                //       child: const Center(
                //           child: Text(
                //         "Cancel",
                //         style: TextStyle(
                //             color: Color.fromARGB(255, 22, 103, 170),
                //             fontSize: 18,
                //             fontWeight: FontWeight.bold),
                //       )),
                //     ),
                //   ),
                // ),
              ],
            )),
            if (_isLoading) // Show CircularProgressIndicator as overlay when loading
              Positioned.fill(
                child: Container(
                  color: Color.fromARGB(137, 79, 79, 79)
                      .withOpacity(0.5), // Semi-transparent background
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          ]),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:axiomapp/PIV_CACError.dart';
import 'package:axiomapp/addAuthApp.dart';
import 'package:axiomapp/addSecurityKey.dart';
import 'package:axiomapp/authMethodList.dart';
import 'package:axiomapp/authMethodSetupTextnVoice.dart';
import 'package:axiomapp/backupCodes.dart';
import 'package:axiomapp/govtEmployeeCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'EmailMeSoftOTPPush.dart';

class authMetSetup extends StatefulWidget {
  const authMetSetup({
    super.key,
    required jwtToken,
    required tokenExpiry,
    required userDetails,
    required String accountId,
  });

  @override
  State<authMetSetup> createState() => _authMetSetupState();
}

class _authMetSetupState extends State<authMetSetup> {
  String getCurrentDateTime() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(now);
  }

  List<CheckboxModel> checkboxes = [
    CheckboxModel(
      title: 'Authentication application',
      subtitle:
          'Download or use an authentication app of your choice to generate secure codes.',
      image: 'images/auth_application.png',
      isChecked: false,
      route: authMethodList(),
    ),
    // CheckboxModel(
    //   title: 'Text or Voice message',
    //   subtitle: 'Receive a secure code by (SMS) text or phone call.',
    //   image: 'images/textnVoiceMessage.png',
    //   isChecked: false,
    //   route: textnVoice(),
    // ),
    // CheckboxModel(
    //   title: 'Backup codes',
    //   subtitle:
    //       'A list of 10 codes you can print or save to your device. When you use the last code, we will generate a new list. Keep in mind backup codes are easy to lose.',
    //   image: 'images/backup_codes.png',
    //   isChecked: false,
    //   route: backupCodes(),
    // ),
    // CheckboxModel(
    //   title: 'Security key',
    //   subtitle:
    //       'A physical device, often shaped like a USB drive, that you plug in to your device',
    //   image: 'images/security_key.png',
    //   isChecked: false,
    //   route: addSecurity(),
    // ),
    // CheckboxModel(
    //   title: 'Government employee ID',
    //   subtitle:
    //       'PIV/CAC cards for government and military employees. Desktop only.',
    //   image: 'images/govtEmploy.png',
    //   isChecked: false,
    //   route: govtEmployeeCard(),
    // ),
  ];

  // Future<void> getAssignedApplications() async {
  //   var ct = getCurrentDateTime();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final accountId = prefs.getString('accountId');
  //   final authToken = prefs.getString('jwtToken');
  //   final userId1 = prefs.getString('userDetails');
  //   final url = Uri.parse(
  //       'https://access.axiomprotect.com:6653/AxiomProtect/v1/user/getAssignedApplications?accountId=$accountId&userId=$userId1&requestTime=$ct');
  //   final headers = {
  //     'Content-Type': 'application/json',
  //     'authToken': authToken,
  //     'Access-Control-Allow-Origin': '*',
  //     'Access-Control-Allow-Methods': '*',
  //   }.cast<String, String>();

  //   try {
  //     final response = await http.get(url, headers: headers);

  //     if (response.statusCode == 200) {
  //       final jsonResponse = jsonDecode(response.body);

  //       if (jsonResponse['resultCode'] == 0) {
  //         final appData = jsonResponse['resultData'] as List<dynamic>;

  //         for (final app in appData) {
  //           final appname = app['appname'] as String;
  //           final applogo = app['applogo'] as String;
  //           final appid = app['appid'] as String;
  //           SharedPreferences prefs = await SharedPreferences.getInstance();
  //           prefs.setString('appid', appid);
  //           checkboxes.add(
  //             CheckboxModel(
  //               title: appname,
  //               image: applogo,
  //               isChecked: false,
  //               route: EamilMeSoftOTPPush(),
  //               subtitle: '',
  //             ),
  //           );
  //         }
  //         setState(() {});
  //       } else {
  //         print(
  //             'Failed to fetch data: resultCode = ${jsonResponse['resultCode']}');
  //       }
  //     } else {
  //       print('Failed to fetch data: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     print('Error fetching data: $error');
  //   }
  // }
  // List<dynamic> applicationData = [];
  // String getCurrentDateTime() {
  //   var now = DateTime.now();
  //   var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  //   return formatter.format(now);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getAssignedApplications();
  // }

  // Future<void> getAssignedApplications() async {
  //   var ct = getCurrentDateTime();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final accountId = prefs.getString('accountId');
  //   final authToken = prefs.getString('jwtToken');
  //   final userId1 = prefs.getString('userDetails');
  //   final url = Uri.parse(
  //       'https://access.axiomprotect.com:6653/AxiomProtect/v1/user/getAssignedApplications?accountId=$accountId&userId=$userId1&requestTime=$ct');
  //   final headers = {
  //     'Content-Type': 'application/json',
  //     'authToken': authToken,
  //     'Access-Control-Allow-Origin': '*',
  //     'Access-Control-Allow-Methods': '*',
  //   }.cast<String, String>();

  //   try {
  //     final response = await http.get(url, headers: headers);

  //     if (response.statusCode == 200) {
  //       final jsonResponse = jsonDecode(response.body);

  //       if (jsonResponse['resultCode'] == 0) {
  //         final appnameJson = jsonResponse['resultData']['appname'];
  //         final applogoJson = jsonResponse['resultData']['applogo'];

  //         // Store appname and applogo as JSON strings in SharedPreferences
  //         await prefs.setString('appname', jsonEncode(appnameJson));
  //         await prefs.setString('applogo', jsonEncode(applogoJson));

  //         setState(() {
  //           checkboxes = (appnameJson as List<dynamic>).map((item) {
  //             return CheckboxModel(
  //               title: item['appname'] as String,
  //               subtitle:
  //                   'Download or use an authentication app of your choice to generate secure codes.',
  //               image: item['applogo'] as String,
  //               isChecked: false,
  //               route: authMethodList(),
  //             );
  //           }).toList();
  //         });
  //       } else {
  //         print(
  //             'Failed to fetch data: resultCode = ${jsonResponse['resultCode']}');
  //       }
  //     } else {
  //       print('Failed to fetch data: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     print('Error fetching data: $error');
  //   }
  // }
  // Future<void> getAssignedApplications() async {
  //   var ct = getCurrentDateTime();

  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String? accountId = prefs.getString('accountId');
  //   final String? authToken = prefs.getString('jwtToken');
  //   final String? userId1 = prefs.getString('userDetails');

  //   if (accountId == null || authToken == null || userId1 == null) {
  //     print('Missing required data (accountId, authToken, or userDetails).');
  //     return;
  //   }

  //   final url = Uri.parse(
  //     'https://access.axiomprotect.com:6653/AxiomProtect/v1/user/getAssignedApplications?accountId=$accountId&userId=$userId1&requestTime=$ct',
  //   );

  //   final headers = {
  //     'Content-Type': 'application/json',
  //     'authToken': authToken,
  //     'Access-Control-Allow-Origin': '*',
  //     'Access-Control-Allow-Methods': '*',
  //   };

  //   try {
  //     final response = await http.get(url, headers: headers);

  //     if (response.statusCode == 200) {
  //       final jsonResponse = jsonDecode(response.body);

  //       if (jsonResponse['resultCode'] == 0) {
  //         setState(() {
  //           applicationData = jsonResponse['resultData'];
  //         });

  //         final appname = jsonResponse['resultData']['appname'];
  //         final applogo = jsonResponse['resultData']['applogo'];

  //         final prefs = await SharedPreferences.getInstance();
  //         await prefs.setStringList('appname', List<String>.from(appname));
  //         await prefs.setStringList('applogo', List<String>.from(applogo));

  //         // Optionally, you can store the data in SharedPreferences if needed
  //         // SharedPreferences prefs = await SharedPreferences.getInstance();
  //         // prefs.setString('TrustedAccessData', jsonEncode(applicationData));
  //       } else {
  //         print(
  //             'Failed to fetch data: resultCode = ${jsonResponse['resultCode']}');
  //       }
  //     } else {
  //       print('Failed to fetch data: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     print('Error fetching data for getAssignedApplication: $error');
  //   }
  // }

  // Future<void> getAssignedApplications() async {
  //   var ct = getCurrentDateTime();
  //   // Replace with your accountId
  //   // Replace with your userId

  //   // Replace with your authToken
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final accountId = prefs.getString('accountId');
  //   prefs.getInt('tokenExpiry');
  //   final authToken = prefs.getString('jwtToken');
  //   print("JWT Token: ");
  //   print(authToken);
  //   final userId1 = prefs.getString('userDetails');
  //   final url = Uri.parse(
  //       'https://access.axiomprotect.com:6653/AxiomProtect/v1/user/getAssignedApplications?accountId=$accountId&userId=$userId1&requestTime=$ct');

  //   final headers = {
  //     'Content-Type': 'application/json',
  //     'authToken': authToken,
  //     'Access-Control-Allow-Origin': '*',
  //     'Access-Control-Allow-Methods': '*',
  //   }.cast<String, String>();

  //   try {
  //     final response = await http.get(url, headers: headers);
  //     if (!mounted) {
  //       // Check if the widget is still mounted before updating the state
  //       return;
  //     }

  //     if (response.statusCode == 200) {
  //       final jsonResponse = jsonDecode(response.body);
  //       if (!mounted) {
  //         // Check if the widget is still mounted before updating the state
  //         return;
  //       }

  //       if (jsonResponse['resultCode'] == 0) {
  //         final appname = jsonResponse['resultData']['appname'];
  //         final applogo = jsonResponse['resultData']['applogo'];

  //         SharedPreferences prefs = await SharedPreferences.getInstance();
  //         final appname1 = prefs.setString('appname', appname);
  //         final appLogo1 = prefs.setInt('applogo', applogo);

  //         setState(() {
  //           applicationData = jsonResponse['resultData'];
  //         });

  //         // Optionally, you can store the data in SharedPreferences if needed
  //         // SharedPreferences prefs = await SharedPreferences.getInstance();
  //         // prefs.setString('TrustedAccessData', jsonEncode(applicationData));
  //       }
  //     } else {
  //       print('Failed to fetch data: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     print('Error fetching data: $error');
  //   }
  // }

  @override
  void dispose() {
    // Cancel any ongoing timers or dispose of resources here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 220, 231, 239),
      body: Card(
        margin: EdgeInsets.only(top: 70, bottom: 70, left: 450, right: 450),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Authentication Method Setup',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Add another layer of security by selecting a multi-factor authentication method. We recommend you select at least two different options in case you lose one of your methods.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: checkboxes.length,
                itemBuilder: (context, index) {
                  final item = checkboxes[index];

                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 165, 205, 237),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListTile(
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              value: item.isChecked,
                              onChanged: (value) {
                                setState(() {
                                  checkboxes.forEach((model) {
                                    model.isChecked = false;
                                  });

                                  // Update the selected item
                                  item.isChecked = value!;
                                });
                              },
                            ),
                            SizedBox(width: 8),
                            Image.asset(item.image),
                          ],
                        ),

                        //Image.asset(item.image),

                        title: Text(
                          item.title,
                          style: TextStyle(
                              color: Color.fromARGB(255, 22, 103, 170),
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(item.subtitle),
                        //trailing: Image.asset(item.image),
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: Container(
                width: width * 0.2,
                height: height * 0.1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      backgroundColor: Color.fromARGB(255, 22, 103, 170),
                    ),
                    onPressed: () {
                      CheckboxModel selectedItem =
                          checkboxes.firstWhere((item) => item.isChecked);

                      if (selectedItem != null) {
                        //getAssignedApplications();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => selectedItem.route),
                        );
                      } else {
                        // Handle case when no checkbox is selected
                        print('No checkbox selected');
                      }
                    },
                    child: const Center(
                        child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckboxModel {
  final String title;
  final String subtitle;
  final String image;
  bool isChecked;
  final Widget route;

  CheckboxModel({
    required this.title,
    required this.subtitle,
    required this.image,
    this.isChecked = false,
    required this.route,
  });
}

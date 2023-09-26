import 'dart:async';

import 'package:axiomapp/EmailMeSoftOTPPush.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'addAuthApp.dart';

class authMethodList extends StatefulWidget {
  const authMethodList({
    Key? key,
  }) : super(key: key);

  @override
  State<authMethodList> createState() => _authMethodListState();
}

class _authMethodListState extends State<authMethodList> {
  List<CheckboxModel> checkboxes = [];
  List<dynamic> applicationData = [];
  String getCurrentDateTime() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(now);
  }

  @override
  void initState() {
    super.initState();
    // Make the API call to get data and populate checkboxes
    getAssignedApplications();
  }

  Future<void> getAssignedApplications() async {
    var ct = getCurrentDateTime();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final accountId = prefs.getString('accountId');
    final authToken = prefs.getString('jwtToken');
    final userId1 = prefs.getString('userDetails');
    final url = Uri.parse(
        'https://access.axiomprotect.com:6653/AxiomProtect/v1/user/getAssignedApplications?accountId=$accountId&userId=$userId1&requestTime=$ct');
    final headers = {
      'Content-Type': 'application/json',
      'authToken': authToken,
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': '*',
    }.cast<String, String>();

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['resultCode'] == 0) {
          final appData = jsonResponse['resultData'] as List<dynamic>;

          for (final app in appData) {
            final appname = app['appname'] as String;
            final applogo = app['applogo'] as String;
            final appid = app['appid'] as String;
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('appid', appid);
            checkboxes.add(
              CheckboxModel(
                title: appname,
                image: applogo,
                isChecked: false,
                route: EamilMeSoftOTPPush(),
              ),
            );
          }
          setState(() {});
        } else {
          print(
              'Failed to fetch data: resultCode = ${jsonResponse['resultCode']}');
        }
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 234, 241),
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
                    'Select Application (Click on any one application)',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(height: 8),
                  // Text(
                  //   'Add another layer of security by selecting a multi-factor authentication method. We recommend you select at least two different options in case you lose one of your methods.',
                  //   style: TextStyle(fontSize: 16, color: Colors.grey),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
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
                            Image.network(
                              item.image,
                              width: 40,
                              height: 40,
                            )
                            // FutureBuilder(
                            //   future: loadImage(item.image),
                            //   builder: (context, snapshot) {
                            //     if (snapshot.connectionState ==
                            //         ConnectionState.done) {
                            //       if (snapshot.hasError) {
                            //         return Text('Image Error');
                            //       }
                            //       return Image.network(item.image);
                            //     } else {
                            //       return CircularProgressIndicator();
                            //     }
                            //   },
                            // ),
                          ],
                        ),

                        //Image.asset(item.image),

                        title: Text(
                          item.title,
                          style: TextStyle(
                              color: Color.fromARGB(255, 22, 103, 170),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        // subtitle: Text(item.subtitle),
                        //trailing: Image.asset(item.image),
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: Container(
                width: width * 0.15,
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

  final String image;
  bool isChecked;
  final Widget route;

  CheckboxModel({
    required this.title,
    required this.image,
    this.isChecked = false,
    required this.route,
  });
}

Future<Image> loadImage(String imageUrl) async {
  final Completer<Image> completer = Completer();
  try {
    final response = await http.get(Uri.parse(imageUrl));
    print('Response Status Code: ${response.statusCode}');
    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      final image = Image.memory(bytes);
      completer.complete(image);
    } else {
      print('Failed to load image: ${response.statusCode}');
      completer.completeError('Failed to load image');
    }
  } catch (e) {
    print('Error loading image: $e');
    completer.completeError('Error: $e');
  }
  return completer.future;
}

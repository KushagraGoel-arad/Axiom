// import 'dart:convert';

// import 'package:axiomapp/authMethodConfirm.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// class addAuthApp extends StatefulWidget {
//   const addAuthApp({super.key});

//   @override
//   State<addAuthApp> createState() => _addAuthAppState();
// }

// class _addAuthAppState extends State<addAuthApp> {
//   TextEditingController _textEditingController = TextEditingController();

//   String getCurrentDateTime() {
//     var now = DateTime.now();
//     var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
//     return formatter.format(now);
//   }

//   Future<void> loginWithOutPassword() async {
//     //final userId = emailController.text;
//     var ct = getCurrentDateTime();
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final accountId = prefs.getString('accountId');
//     final id = prefs.getString('jwtToken');
//     final appId = prefs.getString('appId');

//     final url = Uri.parse(
//       'https://access.axiomprotect.com:6653/AxiomProtect/v1/googleAuth/getTrustedQRCode?accountId=$accountId&id=$id&appId=$appId',
//     );

//     final headers = {
//       'Content-Type': 'application/json',
//       'Access-Control-Allow-Origin': '*',
//       'Access-Control-Allow-Methods': '*',
//     };

//     //final email = emailController.text;

//     // if (email.isEmpty) {
//     //   // Handle empty email
//     //   showErrorDialog("Email is required.");
//     //   return;
//     // }

//     final body = {};

//     try {
//       final response =
//           await http.post(url, headers: headers, body: jsonEncode(body));

//       if (response.statusCode == 200) {
//         print('POST request successful');
//         print(response.body);
//         Map<String, dynamic> jsonResponse = jsonDecode(response.body);
//         String? resultMessage = jsonResponse['resultMessage'];

//         if (resultMessage != null) {
//           print('Result Message: $resultMessage');
//         } else {
//           print('Result Message is null.');
//         }

//         if (jsonResponse['resultCode'] == 0) {
//           print(jsonResponse);

//           // Navigator.pushReplacement(
//           //   context,
//           //   MaterialPageRoute(
//           //     builder: (context) => authMetSetup(
//           //       jwtToken: "jwtToken",
//           //       tokenExpiry: "tokenExpiry",
//           //       userDetails: "userDetails",
//           //       accountId: "accountId",
//           //     ),
//           //   ),
//           // );
//           //Save data to session storage
//           final jwtToken = jsonResponse['resultData']['jwtToken'];
//           final tokenExpiry = jsonResponse['resultData']['tokenExpiry'];
//           final userDetails = jsonResponse['resultData']['user']['userid'];
//           final accountId = jsonResponse['resultData']['user']['accountid'];
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           prefs.setString('jwtToken', jwtToken);
//           prefs.setInt('tokenExpiry', tokenExpiry);
//           prefs.setString('userDetails', userDetails);
//           prefs.setString('accountId', accountId);
//           // Navigate to another page with data
//           // Navigator.pushReplacement(
//           //   context,
//           //   MaterialPageRoute(
//           //     builder: (context) => authMetSetup(
//           //       jwtToken: jwtToken,
//           //       tokenExpiry: tokenExpiry,
//           //       userDetails: userDetails,
//           //       accountId: accountId,
//           //     ),
//           //   ),
//           // );
//         } else {
//           showErrorDialog('$resultMessage');
//         }
//       } else {
//         print('POST request failed');
//         print('Status Code: ${response.statusCode}');
//         print('Response Body: ${response.body}');
//         showErrorDialog("${response.statusCode}");
//       }
//     } catch (e) {
//       print('Error: $e'); // Print the exception message for debugging

//       showErrorDialog("An error occurred. Please try again later.");
//     }
//   }

//   void showErrorDialog(String errorMessage) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Error"),
//           content: Text(errorMessage),
//           actions: <Widget>[
//             TextButton(
//               child: Text("OK"),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the error dialog
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     bool _isChecked = true;
//     bool _selectedLanguage = true;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//             child: Column(
//           children: [
//             SizedBox(
//               height: height * 0.04,
//             ),
//             Align(
//               alignment: Alignment.topLeft,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   "Add an Authentication App",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: height * 0.02,
//             ),
//             Align(
//               alignment: Alignment.topLeft,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: RichText(
//                   textAlign: TextAlign.center,
//                   text: TextSpan(
//                     style: TextStyle(fontSize: 20, color: Colors.black54),
//                     children: <TextSpan>[
//                       TextSpan(
//                         text:
//                             "Set up an authentication app to sign in using temporary security codes. ",
//                         style: TextStyle(
//                           fontSize: 18,
//                         ),
//                       ),
//                       TextSpan(
//                         text: "What is an authentication app?",
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.blue,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Column(
//               children: [
//                 // Padding(
//                 //   padding: const EdgeInsets.all(16.0),
//                 //   child: Column(
//                 //     children: [
//                 //       Row(
//                 //         children: [
//                 //           CustomBullet(number: '1'),
//                 //           Padding(
//                 //             padding: const EdgeInsets.only(left: 16),
//                 //             child: Align(
//                 //               alignment: Alignment.topLeft,
//                 //               child: Text("Give it a nickname",
//                 //                   style: TextStyle(
//                 //                       fontSize: 20,
//                 //                       color: Colors.black87,
//                 //                       fontWeight: FontWeight.bold)),
//                 //             ),
//                 //           ),
//                 //         ],
//                 //       ),
//                 //       Padding(
//                 //         padding: const EdgeInsets.all(16.0),
//                 //         child: Align(
//                 //           alignment: Alignment.topLeft,
//                 //           child: Text(
//                 //               "If you add more than one app, you'll know which one is which.",
//                 //               style: TextStyle(
//                 //                 fontSize: 16,
//                 //                 color: Colors.black54,
//                 //               )),
//                 //         ),
//                 //       ),
//                 //       Padding(
//                 //         padding: const EdgeInsets.all(16.0),
//                 //         child: TextFormField(
//                 //           decoration: InputDecoration(
//                 //             fillColor: Color.fromARGB(255, 182, 224, 242),
//                 //             //labelText: 'Email Address',
//                 //             //labelStyle: TextStyle(color: Colors.grey),
//                 //             enabledBorder: OutlineInputBorder(
//                 //               borderSide: BorderSide(
//                 //                   color:
//                 //                       const Color.fromARGB(255, 206, 205, 205)),
//                 //             ),
//                 //             focusedBorder: OutlineInputBorder(
//                 //               borderSide: BorderSide(
//                 //                   color: Color.fromARGB(255, 22, 103, 170)),
//                 //             ),
//                 //           ),
//                 //         ),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           CustomBullet(
//                             number: '1',
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 16),
//                             child: Align(
//                               alignment: Alignment.topLeft,
//                               child: Text("Open your authentication app",
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       color: Colors.black87,
//                                       fontWeight: FontWeight.bold)),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.04,
//                       ),
//                       Row(
//                         children: [
//                           CustomBullet(
//                             number: '2',
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 16),
//                             child: Align(
//                               alignment: Alignment.topLeft,
//                               child: Text("Scan this QR code with your app",
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       color: Colors.black87,
//                                       fontWeight: FontWeight.bold)),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Center(child: Image.asset("images/qr.png")),
//                       ),
//                       // Padding(
//                       //   padding: const EdgeInsets.all(16.0),
//                       //   child: Align(
//                       //     alignment: Alignment.topLeft,
//                       //     child: Text(
//                       //         "Or enter this code manually into your authentication app",
//                       //         style: TextStyle(
//                       //           fontSize: 16,
//                       //           color: Colors.black54,
//                       //         )),
//                       //   ),
//                       // ),
//                       // Padding(
//                       //   padding: const EdgeInsets.all(16.0),
//                       //   child: TextFormField(
//                       //     controller: _textEditingController,
//                       //     decoration: InputDecoration(
//                       //       fillColor: Color.fromARGB(255, 182, 224, 242),
//                       //       //labelText: 'Email Address',
//                       //       //labelStyle: TextStyle(color: Colors.grey),
//                       //       enabledBorder: OutlineInputBorder(
//                       //         borderSide: BorderSide(
//                       //             color:
//                       //                 const Color.fromARGB(255, 206, 205, 205)),
//                       //       ),
//                       //       focusedBorder: OutlineInputBorder(
//                       //         borderSide: BorderSide(
//                       //             color: Color.fromARGB(255, 22, 103, 170)),
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),
//                       // Padding(
//                       //   padding: const EdgeInsets.all(16.0),
//                       //   child: Align(
//                       //     alignment: Alignment.topLeft,
//                       //     child: ElevatedButton(
//                       //       style: ElevatedButton.styleFrom(
//                       //         backgroundColor: Colors.white, // Background color
//                       //         foregroundColor: Color.fromARGB(
//                       //             255, 22, 103, 170), // Text color
//                       //         side: BorderSide(
//                       //           color: Color.fromARGB(
//                       //               255, 22, 103, 170), // Outer border color
//                       //           width: 2.0,
//                       //         ),
//                       //       ),
//                       //       onPressed: () {
//                       //         String textToCopy = _textEditingController.text;
//                       //         if (textToCopy.isNotEmpty) {
//                       //           Clipboard.setData(
//                       //               ClipboardData(text: textToCopy));
//                       //           // Optionally, show a snackbar or toast to indicate text is copied.
//                       //         }

//                       //         print('Copy button pressed');
//                       //       },
//                       //       child: Row(
//                       //         mainAxisSize: MainAxisSize.min,
//                       //         children: [
//                       //           Icon(Icons.copy),
//                       //           SizedBox(
//                       //             width: 5,
//                       //           ),
//                       //           Text('Copy'),
//                       //         ],
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),
//                       // Row(
//                       //   children: [
//                       //     CustomBullet(
//                       //       number: '4',
//                       //     ),
//                       //     Padding(
//                       //       padding: const EdgeInsets.all(16.0),
//                       //       child: Align(
//                       //         alignment: Alignment.topLeft,
//                       //         child: Text(
//                       //             "Enter the temporary code from your app",
//                       //             style: TextStyle(
//                       //                 fontSize: 20,
//                       //                 color: Colors.black87,
//                       //                 fontWeight: FontWeight.bold)),
//                       //       ),
//                       //     ),
//                       //   ],
//                       // ),
//                       // Padding(
//                       //   padding: const EdgeInsets.only(left: 16.0),
//                       //   child: Align(
//                       //     alignment: Alignment.topLeft,
//                       //     child: Text("Example: 123456",
//                       //         style: TextStyle(
//                       //           fontSize: 16,
//                       //           color: Colors.black54,
//                       //         )),
//                       //   ),
//                       // ),
//                       // Padding(
//                       //   padding: const EdgeInsets.only(left: 16.0, top: 8),
//                       //   child: TextFormField(
//                       //     decoration: InputDecoration(
//                       //       fillColor: Color.fromARGB(255, 182, 224, 242),
//                       //       //labelText: 'Email Address',
//                       //       //labelStyle: TextStyle(color: Colors.grey),
//                       //       enabledBorder: OutlineInputBorder(
//                       //         borderSide: BorderSide(
//                       //             color:
//                       //                 const Color.fromARGB(255, 206, 205, 205)),
//                       //       ),
//                       //       focusedBorder: OutlineInputBorder(
//                       //         borderSide: BorderSide(
//                       //             color: Color.fromARGB(255, 22, 103, 170)),
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             // Align(
//             //   alignment: Alignment.topLeft,
//             //   child: Padding(
//             //     padding: const EdgeInsets.only(left: 16, top: 16),
//             //     child: Container(
//             //       padding: EdgeInsets.all(8.0),
//             //       decoration: BoxDecoration(
//             //         border: Border.all(
//             //           color: Color.fromARGB(255, 165, 205, 237),
//             //           width: 2.0,
//             //         ),
//             //         borderRadius: BorderRadius.circular(8.0),
//             //       ),
//             //       child: Row(
//             //         mainAxisAlignment: MainAxisAlignment.start,
//             //         mainAxisSize: MainAxisSize.min,
//             //         children: <Widget>[
//             //           Checkbox(
//             //             value: _isChecked,
//             //             onChanged: (bool? value) {
//             //               setState(() {
//             //                 _isChecked = !_isChecked;
//             //               });
//             //             },
//             //           ),
//             //           Padding(
//             //             padding: const EdgeInsets.all(8),
//             //             child: RichText(
//             //               textAlign: TextAlign.center,
//             //               text: TextSpan(
//             //                 style:
//             //                     TextStyle(fontSize: 20, color: Colors.black54),
//             //                 children: <TextSpan>[
//             //                   TextSpan(
//             //                     text: "Remember this browser",
//             //                     style: TextStyle(
//             //                       fontSize: 18,
//             //                     ),
//             //                   ),
//             //                 ],
//             //               ),
//             //             ),
//             //           ),
//             //           // Text(
//             //           //   'I read and accept the Login.gov',
//             //           //   style: TextStyle(color: Color.fromARGB(255, 91, 90, 90)),
//             //           // ),
//             //         ],
//             //       ),
//             //     ),
//             //   ),
//             // ),
//             SizedBox(
//               height: height * 0.05,
//             ),
//             Container(
//               height: height * 0.07,
//               width: width * 0.2,
//               // padding: EdgeInsets.all(8.0),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Color.fromARGB(255, 22, 103, 170),
//                   width: 2.0,
//                 ),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                   shape: RoundedRectangleBorder(
//                       //side: BorderSide.strokeAlignOutside,
//                       borderRadius: BorderRadius.all(Radius.circular(5))),
//                   backgroundColor: Colors.white,
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => authConfirm(),
//                     ),
//                   );
//                 },
//                 child: const Center(
//                     child: Text(
//                   "Submit",
//                   style: TextStyle(
//                       color: Color.fromARGB(255, 22, 103, 170),
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold),
//                 )),
//               ),
//             ),
//           ],
//         )),
//       ),
//     );
//   }
// }

// class CustomBullet extends StatelessWidget {
//   final String number;

//   const CustomBullet({required this.number});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 40,
//       height: 40,
//       child: CustomPaint(
//         painter: BulletPainter(number),
//       ),
//     );
//   }
// }

// class BulletPainter extends CustomPainter {
//   final String number;

//   BulletPainter(this.number);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = size.width / 2;

//     final paint = Paint()
//       ..color = Color.fromARGB(255, 22, 103, 170)
//       ..style = PaintingStyle.fill;

//     canvas.drawCircle(center, radius, paint);

//     final textPainter = TextPainter(
//       text: TextSpan(
//         text: number,
//         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//       ),
//       textDirection: TextDirection.ltr,
//     );

//     textPainter.layout(minWidth: 0, maxWidth: size.width);
//     final textX = center.dx - textPainter.width / 2;
//     final textY = center.dy - textPainter.height / 2;

//     textPainter.paint(canvas, Offset(textX, textY));
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

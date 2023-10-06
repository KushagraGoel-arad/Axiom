// import 'package:axiomapp/createAccount.dart';
// import 'package:axiomapp/signin.dart';
// import 'package:flutter/material.dart';

// class signinCreate extends StatefulWidget {
//   signinCreate({Key? key});

//   @override
//   State<signinCreate> createState() => _signinCreateState();
// }

// class _signinCreateState extends State<signinCreate> {
//   double width = 0.0;
//   double height = 0.0;
//   int _selectedIndex = 0;
//   List<bool> isSelected = [true, false];
//   final List<Color> _buttonColors = [
//     Color.fromARGB(255, 22, 103, 170),
//     Color.fromARGB(255, 22, 103, 170),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     width = MediaQuery.of(context).size.width;
//     height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 220, 232, 241),
//       body: Padding(
//         padding: EdgeInsets.only(top: 50, bottom: 50, left: 490, right: 490),
//         child: Container(
//           // height: height * 0.85,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: height * 0.05,
//               ),
//               Center(
//                 child: Image.asset(
//                   'images/axiom_login_logo.jpg',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(
//                 height: height * 0.02,
//               ),
//               RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                   style: TextStyle(
//                       fontSize: 25, color: Color.fromARGB(255, 22, 103, 170)),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: 'Axiom Protect 2.0 ',
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     TextSpan(
//                       text:
//                           'is using Login.gov to allow\n you to sign in to your account\n safely and securely.',
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: height * 0.1,
//               ),
//               Container(
//                 color: Colors.white,
//                 child: ToggleButtons(
//                   isSelected: isSelected,
//                   onPressed: (index) {
//                     setState(() {
//                       _selectedIndex = index;
//                       isSelected = [index == 0, index == 1];
//                     });
//                   },
//                   borderColor: Color.fromARGB(255, 22, 103, 170),
//                   selectedColor: Colors.white,
//                   color: isSelected[0]
//                       ? Colors.white
//                       : isSelected[1]
//                           ? Color.fromARGB(255, 22, 103, 170)
//                           : Colors.white,
//                   fillColor: isSelected[0] || isSelected[1]
//                       ? Color.fromARGB(
//                           255, 22, 103, 170) // Set the fill color here
//                       : Colors.white,
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderWidth: 2,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 24.0, vertical: 16.0),
//                       child: Text(
//                         'Sign In',
//                         style: TextStyle(
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 24.0, vertical: 16.0),
//                       child: Text(
//                         'Create an Account',
//                         style: TextStyle(
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold,
//                           color: isSelected[1]
//                               ? Colors.white
//                               : Color.fromARGB(255, 22, 103, 170),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               if (_selectedIndex == 0)
//                 Column(
//                   children: [
//                     signin(),
//                   ],
//                 )
//               else
//                 Column(
//                   children: [
//                     createAccount(),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:axiomapp/createAccount.dart';
// import 'package:axiomapp/signin.dart';
// import 'package:flutter/material.dart';

// class signinCreate extends StatefulWidget {
//   signinCreate({Key? key});

//   @override
//   State<signinCreate> createState() => _signinCreateState();
// }

// class _signinCreateState extends State<signinCreate> {
//   double width = 0.0;
//   double height = 0.0;
//   int _selectedIndex = 0;
//   List<bool> isSelected = [true, false];
//   final List<Color> _buttonColors = [
//     Color.fromARGB(255, 22, 103, 170),
//     Color.fromARGB(255, 22, 103, 170),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     width = MediaQuery.of(context).size.width;
//     height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 220, 232, 241),
//       body: Padding(
//         padding: EdgeInsets.symmetric(vertical: 50, horizontal: 490),
//         child: SingleChildScrollView(
//           child: Container(
//             // Remove the fixed height
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: height * 0.05,
//                 ),
//                 Center(
//                   child: Image.asset(
//                     'images/axiom_login_logo.jpg',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 SizedBox(
//                   height: height * 0.02,
//                 ),
//                 RichText(
//                   textAlign: TextAlign.center,
//                   text: TextSpan(
//                     style: TextStyle(
//                         fontSize: 25, color: Color.fromARGB(255, 22, 103, 170)),
//                     children: <TextSpan>[
//                       TextSpan(
//                           text: 'Axiom Protect 2.0 ',
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                       TextSpan(
//                         text:
//                             'is using Login.gov to allow\n you to sign in to your account\n safely and securely.',
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: height * 0.1,
//                 ),
//                 Container(
//                   color: Colors.white,
//                   child: ToggleButtons(
//                     isSelected: isSelected,
//                     onPressed: (index) {
//                       setState(() {
//                         _selectedIndex = index;
//                         isSelected = [index == 0, index == 1];
//                       });
//                     },
//                     borderColor: Color.fromARGB(255, 22, 103, 170),
//                     selectedColor: Colors.white,
//                     color: isSelected[0]
//                         ? Colors.white
//                         : isSelected[1]
//                             ? Color.fromARGB(255, 22, 103, 170)
//                             : Colors.white,
//                     fillColor: isSelected[0] || isSelected[1]
//                         ? Color.fromARGB(
//                             255, 22, 103, 170) // Set the fill color here
//                         : Colors.white,
//                     borderRadius: BorderRadius.circular(8.0),
//                     borderWidth: 2,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 24.0, vertical: 16.0),
//                         child: Text(
//                           'Sign In',
//                           style: TextStyle(
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 24.0, vertical: 16.0),
//                         child: Text(
//                           'Create an Account',
//                           style: TextStyle(
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                             color: isSelected[1]
//                                 ? Colors.white
//                                 : Color.fromARGB(255, 22, 103, 170),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 if (_selectedIndex == 0)
//                   Column(
//                     children: [
//                       signin(),
//                     ],
//                   )
//                 else
//                   Column(
//                     children: [
//                       createAccount(),
//                     ],
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:axiomapp/createAccount.dart';
// import 'package:axiomapp/signin.dart';
// import 'package:flutter/material.dart';

// class signinCreate extends StatefulWidget {
//   signinCreate({Key? key});

//   @override
//   State<signinCreate> createState() => _signinCreateState();
// }

// class _signinCreateState extends State<signinCreate> {
//   double width = 0.0;
//   double height = 0.0;
//   int _selectedIndex = 0;
//   List<bool> isSelected = [true, false];
//   final List<Color> _buttonColors = [
//     Color.fromARGB(255, 22, 103, 170),
//     Color.fromARGB(255, 22, 103, 170),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     width = MediaQuery.of(context).size.width;
//     height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 220, 232, 241),
//       body: Padding(
//         padding: EdgeInsets.symmetric(vertical: 50, horizontal: 490),
//         child: SingleChildScrollView(
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: height * 0.05,
//                 ),
//                 Center(
//                   child: Image.asset(
//                     'images/axiom_login_logo.jpg',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 SizedBox(
//                   height: height * 0.02,
//                 ),
//                 RichText(
//                   textAlign: TextAlign.center,
//                   text: TextSpan(
//                     style: TextStyle(
//                         fontSize: 25, color: Color.fromARGB(255, 22, 103, 170)),
//                     children: <TextSpan>[
//                       TextSpan(
//                           text: 'Axiom Protect 2.0 ',
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                       TextSpan(
//                         text:
//                             'is using Login.gov to allow\n you to sign in to your account\n safely and securely.',
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: height * 0.1,
//                 ),
//                 Container(
//                   color: Colors.white,
//                   child: ToggleButtons(
//                     isSelected: isSelected,
//                     onPressed: (index) {
//                       setState(() {
//                         _selectedIndex = index;
//                         isSelected = [index == 0, index == 1];
//                       });
//                     },
//                     borderColor: Color.fromARGB(255, 22, 103, 170),
//                     selectedColor: Colors.white,
//                     color: isSelected[0]
//                         ? Colors.white
//                         : isSelected[1]
//                             ? Color.fromARGB(255, 22, 103, 170)
//                             : Colors.white,
//                     fillColor: isSelected[0] || isSelected[1]
//                         ? Color.fromARGB(
//                             255, 22, 103, 170) // Set the fill color here
//                         : Colors.white,
//                     borderRadius: BorderRadius.circular(8.0),
//                     borderWidth: 2,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 24.0, vertical: 16.0),
//                         child: Text(
//                           'Sign In',
//                           style: TextStyle(
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 24.0, vertical: 16.0),
//                         child: Text(
//                           'Create an Account',
//                           style: TextStyle(
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                             color: isSelected[1]
//                                 ? Colors.white
//                                 : Color.fromARGB(255, 22, 103, 170),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 if (_selectedIndex == 0) signin() else createAccount(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:axiomapp/createAccount.dart';
import 'package:axiomapp/signin.dart';
import 'package:flutter/material.dart';

class signinCreate extends StatefulWidget {
  signinCreate({Key? key});

  @override
  State<signinCreate> createState() => _signinCreateState();
}

class _signinCreateState extends State<signinCreate> {
  double width = 0.0;
  double height = 0.0;
  int _selectedIndex = 0;
  List<bool> isSelected = [true, false];
  final List<Color> _buttonColors = [
    Color.fromARGB(255, 22, 103, 170),
    Color.fromARGB(255, 22, 103, 170),
  ];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 220, 232, 241),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 470),
          child: Container(
            // constraints: BoxConstraints(
            //     maxHeight: height * 0.85), // Add maxHeight constraint
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Center(
                  child: Image.asset(
                    'images/axiom_login_logo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 25, color: Color.fromARGB(255, 22, 103, 170)),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Axiom Protect 2.0 ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text:
                            'is using Login.gov to allow\n you to sign in to your account\n safely and securely.',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Container(
                  color: Colors.white,
                  child: ToggleButtons(
                    isSelected: isSelected,
                    onPressed: (index) {
                      setState(() {
                        _selectedIndex = index;
                        isSelected = [index == 0, index == 1];
                      });
                    },
                    borderColor: Color.fromARGB(255, 22, 103, 170),
                    selectedColor: Colors.white,
                    color: isSelected[0]
                        ? Colors.white
                        : isSelected[1]
                            ? Color.fromARGB(255, 22, 103, 170)
                            : Colors.white,
                    fillColor: isSelected[0] || isSelected[1]
                        ? Color.fromARGB(
                            255, 22, 103, 170) // Set the fill color here
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    borderWidth: 2,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        child: Text(
                          'Create an Account',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: isSelected[1]
                                ? Colors.white
                                : Color.fromARGB(255, 22, 103, 170),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                if (_selectedIndex == 0)
                  Container(height: height, child: signin())
                else
                  Container(height: height, child: createAccount()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

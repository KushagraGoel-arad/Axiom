// import 'package:flutter/material.dart';

// class dashboard1 extends StatefulWidget {
//   const dashboard1({Key? key});

//   @override
//   State<dashboard1> createState() => _dashboard1State();
// }

// class _dashboard1State extends State<dashboard1> {
//   int _selectedIndex = 0;

//   void _onNavItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     // Handle navigation or any other action here
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "AXIOM PROTECT 2.0",
//           style: TextStyle(
//             color: Color.fromARGB(255, 2, 21, 36),
//             fontSize: 30,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             _buildNavItem('Home', 0),
//             _buildNavItem('Search', 1),
//             _buildNavItem('Data Bank', 2),
//             _buildNavItem('Data Services', 3),
//             _buildNavItem('Help', 4),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildNavItem(String title, int index) {
//     return InkWell(
//       onTap: () => _onNavItemTapped(index),
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
//         decoration: BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               color: _selectedIndex == index ? Colors.grey : Colors.transparent,
//               width: 2,
//             ),
//           ),
//         ),
//         child: Text(
//           title,
//           style: TextStyle(
//             color: _selectedIndex == index ? Colors.grey : Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }

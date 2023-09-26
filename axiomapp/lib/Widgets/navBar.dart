// import 'package:flutter/material.dart';

// class Navbar extends StatefulWidget {
//   @override
//   _NavbarState createState() => _NavbarState();
// }

// class _NavbarState extends State<Navbar> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//       preferredSize: Size.fromHeight(kToolbarHeight),
//       child: AppBar(
//         backgroundColor: Colors.blue, // Customize your background color
//         title: Text('My App'),
//         actions: [
//           for (int i = 0; i < _navItems.length; i++)
//             _buildNavItem(i, _navItems[i]),
//         ],
//       ),
//     );
//   }

//   Widget _buildNavItem(int index, String title) {
//     return InkWell(
//       onTap: () {
//         setState(() {
//           _selectedIndex = index;
//         });
//         // Perform navigation here
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Text(
//           title,
//           style: TextStyle(
//             color: _selectedIndex == index ? Colors.white : Colors.grey,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }

//   final List<String> _navItems = [
//     'Home',
//     'Search',
//     'Data Bank',
//     'Data Services',
//     'Help'
//   ];
// }

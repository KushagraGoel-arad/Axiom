import 'package:flutter/material.dart';

class requestRole extends StatefulWidget {
  const requestRole({super.key});

  @override
  State<requestRole> createState() => _requestRoleState();
}

class _requestRoleState extends State<requestRole> {
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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Request Role (Optional)",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
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
            height: height * 0.02,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Request Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
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
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
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
      )),
    );
  }
}

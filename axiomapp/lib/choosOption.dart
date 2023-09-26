import 'package:axiomapp/enterEntityInfo.dart';
import 'package:flutter/material.dart';

class chooseOption extends StatefulWidget {
  const chooseOption({super.key});

  @override
  State<chooseOption> createState() => _chooseOptionState();
}

class _chooseOptionState extends State<chooseOption> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(
                      "Choose an Option",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black54),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'It looks like you don\'t intend to do business directly or indirectly with the U.S. federal government. We recommend you choose ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: 'Unique Entity ID Only.',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Expanded(
                  child: Container(
                      height: height * 0.8,
                      width: width * 0.5,
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: SingleChildScrollView(
                        child: Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  child: Column(children: [
                                    Text(
                                      "Recommend",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 12, 128, 217)),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 5, 53, 210),
                                        border: Border(),
                                      ),
                                      height: height * 0.07,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Unique Entity ID\nOnly",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 221, 228, 234),
                                  border: Border(
                                    top: BorderSide(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                height: height * 0.07,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "What you get:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.07,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            "Unique Entity ID",
                                            style: TextStyle(),
                                          ),
                                        ),
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors
                                              .blue, // You can customize the color
                                          size: 20, // You can adjust the size
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 50.0),
                                      child: Icon(
                                        Icons.check,
                                        color: Color.fromARGB(255, 6, 37,
                                            62), // You can customize the color
                                        size: 20, // You can adjust the size
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.07,
                                color: Color.fromARGB(255, 232, 246, 232),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            "Entity Available in Search",
                                            style: TextStyle(),
                                          ),
                                        ),
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors
                                              .blue, // You can customize the color
                                          size: 20, // You can adjust the size
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 50.0),
                                      child: Icon(
                                        Icons.check,
                                        color: Color.fromARGB(255, 6, 37,
                                            62), // You can customize the color
                                        size: 20, // You can adjust the size
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.07,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            "CAGE Code",
                                            style: TextStyle(),
                                          ),
                                        ),
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors
                                              .blue, // You can customize the color
                                          size: 20, // You can adjust the size
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 50.0),
                                      child: Icon(
                                        Icons.remove,
                                        color: Color.fromARGB(255, 6, 37,
                                            62), // You can customize the color
                                        size: 20, // You can adjust the size
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.07,
                                color: Color.fromARGB(255, 221, 228, 234),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "When you need it:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.07,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            "To receive an award from someone else receiving\nfederal funds",
                                            style: TextStyle(),
                                          ),
                                        ),
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors
                                              .blue, // You can customize the color
                                          size: 20, // You can adjust the size
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 50.0),
                                      child: Icon(
                                        Icons.check,
                                        color: Color.fromARGB(255, 6, 37,
                                            62), // You can customize the color
                                        size: 20, // You can adjust the size
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.07,
                                color: Color.fromARGB(255, 228, 248, 229),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            "To apply directly for federal grants or loans",
                                            style: TextStyle(),
                                          ),
                                        ),
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors
                                              .blue, // You can customize the color
                                          size: 20, // You can adjust the size
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 50.0),
                                      child: Icon(
                                        Icons.remove,
                                        color: Color.fromARGB(255, 6, 37,
                                            62), // You can customize the color
                                        size: 20, // You can adjust the size
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.07,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            "To bid on federal contracts(prime)",
                                            style: TextStyle(),
                                          ),
                                        ),
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors
                                              .blue, // You can customize the color
                                          size: 20, // You can adjust the size
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 50.0),
                                      child: Icon(
                                        Icons.remove,
                                        color: Color.fromARGB(255, 6, 37,
                                            62), // You can customize the color
                                        size: 20, // You can adjust the size
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.07,
                                color: Color.fromARGB(255, 221, 228, 234),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "What you must complete:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.07,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            "Entity Validation",
                                            style: TextStyle(),
                                          ),
                                        ),
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors
                                              .blue, // You can customize the color
                                          size: 20, // You can adjust the size
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 50.0),
                                      child: Icon(
                                        Icons.check,
                                        color: Color.fromARGB(255, 6, 37,
                                            62), // You can customize the color
                                        size: 20, // You can adjust the size
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.07,
                                color: Color.fromARGB(255, 220, 238, 229),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            "IRS Taxpayer Validation",
                                            style: TextStyle(),
                                          ),
                                        ),
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors
                                              .blue, // You can customize the color
                                          size: 20, // You can adjust the size
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 50.0),
                                      child: Icon(
                                        Icons.remove,
                                        color: Color.fromARGB(255, 6, 37,
                                            62), // You can customize the color
                                        size: 20, // You can adjust the size
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.07,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            "CAGE/NCAGE Validation ",
                                            style: TextStyle(),
                                          ),
                                        ),
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors
                                              .blue, // You can customize the color
                                          size: 20, // You can adjust the size
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 50.0),
                                      child: Icon(
                                        Icons.remove,
                                        color: Color.fromARGB(255, 6, 37,
                                            62), // You can customize the color
                                        size: 20, // You can adjust the size
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.07,
                                color: const Color.fromARGB(255, 231, 246, 232),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            "Level of Effort",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors
                                              .blue, // You can customize the color
                                          size: 20, // You can adjust the size
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 50.0),
                                      child: Text(
                                        "Lowest",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 10, 69, 12)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.07,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            "Expiration",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors
                                              .blue, // You can customize the color
                                          size: 20, // You can adjust the size
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 50.0),
                                      child: Icon(
                                        Icons.remove,
                                        color: Color.fromARGB(255, 6, 37,
                                            62), // You can customize the color
                                        size: 20, // You can adjust the size
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 90,
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(context,
                      MaterialPageRoute(builder: (context) => enterEntityInfo()));
                                            // Add your button click logic here
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 220, 237, 221),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      5), // Button border radius
                                              side: BorderSide(
                                                  color: Color.fromARGB(255, 90,
                                                      184, 93)), // Border color
                                            ),
                                          ),
                                          child: Text(
                                            'Select',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: const Color.fromARGB(
                                                    255, 5, 49, 86),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

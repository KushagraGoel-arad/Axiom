import 'package:axiomapp/authMethodConfirm.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class govtEmployeeCard extends StatefulWidget {
  const govtEmployeeCard({super.key});

  @override
  State<govtEmployeeCard> createState() => _govtEmployeeCardState();
}

class _govtEmployeeCardState extends State<govtEmployeeCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool _isChecked = true;
    bool _selectedLanguage = true;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 235, 243),
      body: Center(
        child: Container(
            width: width * 0.5,
            height: height * 1,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Add your PIV or CAC",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  "Set up your PIV or CAC as a two-factor authentication method so you can use it to sign in. ",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CustomBullet(number: '1'),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text("Give it a nickname",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                    "If you add more than one PIV/CAC, you'll know which one is which.",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  fillColor: Color.fromARGB(255, 182, 224, 242),
                                  //labelText: 'Email Address',
                                  //labelStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 206, 205, 205)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 22, 103, 170)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CustomBullet(
                                  number: '2',
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        "Insert your PIV/CAC into your card reader",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            Row(
                              children: [
                                CustomBullet(
                                  number: '3',
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text("Add your PIV/CAC",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "You'll need to ",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "choose a certificate",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text:
                                            "(the right one likely has your name in it) and ",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "enter your PIN",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text:
                                            "(your PIN was created when you set up your PIV/CAC)",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: width * 0.3,
                      height: height * 0.1,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            backgroundColor: Color.fromARGB(255, 22, 103, 170),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => authConfirm(),
                              ),
                            );
                          },
                          child: const Center(
                              child: Text(
                            "Add PIV/CAC card",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.grey.withOpacity(0.6),
                          Colors.transparent
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Choose another authentication method',
                            style: TextStyle(
                              fontSize: 14,
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
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class CustomBullet extends StatelessWidget {
  final String number;

  const CustomBullet({required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: CustomPaint(
        painter: BulletPainter(number),
      ),
    );
  }
}

class BulletPainter extends CustomPainter {
  final String number;

  BulletPainter(this.number);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint = Paint()
      ..color = Color.fromARGB(255, 22, 103, 170)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, paint);

    final textPainter = TextPainter(
      text: TextSpan(
        text: number,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(minWidth: 0, maxWidth: size.width);
    final textX = center.dx - textPainter.width / 2;
    final textY = center.dy - textPainter.height / 2;

    textPainter.paint(canvas, Offset(textX, textY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

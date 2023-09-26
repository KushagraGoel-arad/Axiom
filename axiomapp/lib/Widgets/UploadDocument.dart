import 'package:flutter/material.dart';

class DocumentUploadScreen extends StatefulWidget {
  @override
  _DocumentUploadScreenState createState() => _DocumentUploadScreenState();
}

class _DocumentUploadScreenState extends State<DocumentUploadScreen> {
  bool _isFileUploaded = false;
  String _selectedFileName = '';

  void _uploadDocument(String fileName) {
    setState(() {
      _isFileUploaded = true;
      _selectedFileName = fileName;
    });
  }

  void _changeFile() {
    setState(() {
      _isFileUploaded = false;
      _selectedFileName = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomPaint(
                painter: DashedBorderPainter(),
                child: _isFileUploaded
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Selected file:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(_selectedFileName),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: _changeFile,
                            child: Text('Change File'),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.cloud_upload, size: 40),
                          SizedBox(height: 16),
                          Text('Drag and drop a file here\nor click to select a file'),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              _uploadDocument('example_document.pdf');
                            },
                            child: Text('Upload File'),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    
    final dashWidth = 5;
    final dashSpace = 5;
    
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}



import 'package:flutter/material.dart';
import 'face_id_scan.dart';

class FaceIDNoticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Face ID Notice Page'), 
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to face id scan page'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FaceIDScanPage()),
            );
          },
        ),
      ),
    );
  }
}
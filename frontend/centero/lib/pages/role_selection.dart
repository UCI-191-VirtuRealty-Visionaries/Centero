import 'package:flutter/material.dart';
import 'face_id_notice.dart';

class RoleSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Role Selection Page'), 
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to face id notice page'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FaceIDNoticePage()),
            );
          },
        ),
      ),
    );
  }
}
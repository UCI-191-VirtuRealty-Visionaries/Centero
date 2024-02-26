import 'package:flutter/material.dart';
import 'end_contact.dart';

class CallInterfacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call Interface Page'), 
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to end contact page'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EndContactPage()),
            );
          },
        ),
      ),
    );
  }
}
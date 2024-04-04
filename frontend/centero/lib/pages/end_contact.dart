import 'package:flutter/material.dart';
import 'home.dart';

class EndContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('End Contact Page'), 
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Return to home page'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'call_interface.dart';

class ResidentCallOptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resident Call Options Page'), 
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to call interface page'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CallInterfacePage()),
            );
          },
        ),
      ),
    );
  }
}
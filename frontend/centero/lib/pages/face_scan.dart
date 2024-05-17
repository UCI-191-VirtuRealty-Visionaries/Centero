import 'package:flutter/material.dart';
import 'resident_call_options.dart';

class FaceScan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Face ID Scan Page'), 
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to resident call options page'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PageResidentCallOptions()),
            );
          },
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'role_selection.dart';

class AgePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          child: Text('Go to role selection page'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RoleSelectionPage()),
            );
          },
        ),
    );
  }
}
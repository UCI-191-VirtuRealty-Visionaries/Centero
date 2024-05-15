import 'package:centero/widgets/debug_page_placeholder.dart';
import 'package:centero/widgets/button_secondary.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';
import 'welcome_home.dart';

class PageCallRegularLoading extends StatelessWidget {
  // Move to welcome screen
  void goToWelcomeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PageWelcomeHome()),
    );
  }

  // Cancel Button
  Widget cancelButton(BuildContext context) {
    return ButtonSecondary(
      width: 1500,
      onPressed: () {goToWelcomeScreen(context);}, 
      child: Text('Cancel', style: TextStyle(fontSize: 80)));
  }

  @override
  Widget build(BuildContext context) {
    final content = Column(children: [
      SizedBox(height: 600),
      Text("Connecting you now...", 
        style: TextStyle(fontSize: 140, color: Colors.white, fontFamily: 'Josefin', fontWeight: FontWeight.bold)),
      cancelButton(context)
      ]
    );

    return PageFrame(
      child: content
    );
  }
}

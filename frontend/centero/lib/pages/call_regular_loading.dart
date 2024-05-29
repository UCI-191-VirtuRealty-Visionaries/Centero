import 'package:centero/styles/text_styles.dart';
import 'package:centero/widgets/button_secondary.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'welcome_home.dart';
import 'call_regular_confirmation.dart';

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
      child: Text('Cancel', style: MyTextStyle.btnTxt2));
  }

  // Loading Circle
  final spinkit = const SpinKitFadingCircle(
            color: Colors.green,
            size: 500
          );

  @override
  Widget build(BuildContext context) {
    final content = GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageCallRegularConfirmation()),
        );
      }, 
      child: Column(
        children: [
          SizedBox(height: 550),
          Text("Connecting you now...", 
            style: MyTextStyle.heading),
          SizedBox(height: 200),
          spinkit,
          SizedBox(height: 200),
          cancelButton(context)
        ]
      )
    );

    return PageFrame(
      child: content
    );
  }
}

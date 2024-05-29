//import 'package:centero/widgets/debug_page_placeholder.dart';
import 'package:centero/styles/text_styles.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:centero/widgets/button_primary.dart';
import 'package:centero/widgets/button_danger.dart';
import 'package:flutter/material.dart';
import 'welcome_home.dart';

class PageFeedbackGood extends StatelessWidget {
  // Move to welcome home screen
  void nextScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PageWelcomeHome()),
    );
  }

  // Yes Button
  Widget yesButton(BuildContext context) {
    return ButtonPrimary(
      width: 1200,
      onPressed: () {nextScreen(context);},
      child: Text('Yes', style: TextStyle(fontSize: 80, fontFamily: 'Josefin',))
    );
  }


  // No, Return Home Button
  Widget returnHomeButton(BuildContext context) {
    return ButtonDanger(
    width: 1200,
    onPressed: () {nextScreen(context);},
    child: Text('No, Return Home', style: TextStyle(fontSize: 80, fontFamily: 'Josefin'))
    );
  }

  // Build column of buttons
  Widget buildButtonColumn(BuildContext context) {
    return Column(children: [yesButton(context), SizedBox(height: 80), returnHomeButton(context)]);
  }

  @override
  Widget build(BuildContext context) {
    final content = Container(
      width: 1500,
      child: Column(children: [
        SizedBox(height: 550),
        Text("We're glad we helped!",
          textAlign: TextAlign.center,
          style: MyTextStyle.heading),
        SizedBox(height: 70),
        Text("Do you want to record a message and share more about our conversation?",
          textAlign: TextAlign.center,
          style: MyTextStyle.subheading),
        SizedBox(height: 70),
        buildButtonColumn(context),
      ])
    );

    return PageFrame(
      child: content,
    );
  }
}
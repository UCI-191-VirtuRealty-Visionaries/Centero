import 'package:centero/styles/text_styles.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:centero/widgets/button_primary.dart';
import 'package:centero/widgets/button_danger.dart';
import 'package:flutter/material.dart';
import 'welcome_home.dart';

class PageFeedbackBadEnd extends StatelessWidget {
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
      child: Text('Yes', style: MyTextStyle.btnTxt2)
    );
  }


  // No, Return Home Button
  Widget returnHomeButton(BuildContext context) {
    return ButtonDanger(
    width: 1200,
    onPressed: () {nextScreen(context);},
    child: Text('No, Return Home', style: MyTextStyle.btnTxtLong)
    );
  }

  // Build column of buttons
  Widget buildButtonColumn(BuildContext context) {
    return Column(children: [yesButton(context), SizedBox(height: 80), returnHomeButton(context), SizedBox(height: 80)]);
  }

  @override
  Widget build(BuildContext context) {
    final content = Container(
      width: 1500,
      child: Column(children: [
        SizedBox(height: 780),
        Text("Sorry we couldn't help.",
          textAlign: TextAlign.center,
          style: MyTextStyle.heading),
        SizedBox(height: 70),
        Text("Do you want to record a message and share more about our conversation?",
          textAlign: TextAlign.center,
          style: MyTextStyle.subheading),
        SizedBox(height: 100),
        buildButtonColumn(context),
      ])
    );

    return PageFrame(
      child: content,
    );
  }
}
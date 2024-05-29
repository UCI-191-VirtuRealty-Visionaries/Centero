import 'package:centero/styles/text_styles.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';
import 'call_regular.dart';
import 'feedback_bad.dart'; // delete later

class PageCallRegularConfirmation extends StatelessWidget {
  // Move to call regular screen
  void nextScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PageCallRegular()),
      // update to PageCallRegular() when complete
    );
  }

  // Green checkmark PNG
  Widget callConnected() {
    return Image.asset(
      'assets/call_confirmed.png',
      width: 400,
      height: 400,
    );
  }

  @override
  // Build column
  Widget build(BuildContext context) {
    final content = GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageCallRegular()),
        );
      },
      child: Column(
        children: <Widget>[
          SizedBox(height: 550),
          Text("Ready to chat!",
              style: MyTextStyle.heading),
          RichText(
            text: TextSpan(
              text: 'Connecting you now to ',
              style: MyTextStyle.subheading,
              children: const <TextSpan>[
                TextSpan(
                    text: 'Marcus Bennett...',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          
          SizedBox(height: 100),
          callConnected(),
        ],
      ),
    );

    return PageFrame(child: content);
  }
}

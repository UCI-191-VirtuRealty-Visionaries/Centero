import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';
// import 'call_regular.dart';
import 'feedback_bad.dart'; // delete later

class PageCallRegularConfirmation extends StatelessWidget {
  // Move to call regular screen
  void nextScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PageFeedbackBad()),
      // update to PageCallRegular() when complete
    );
  }

  // Green checkmark PNG
  Widget callConnected () { 
    return Image.asset(
      'assets/call_confirmed.png',
      width: 500,
      height: 500,
    );
  }

  @override
  // Build column
  Widget build(BuildContext context) {
    final content = GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageFeedbackBad()),
        );
      },
      child: Column(
        children: <Widget>[
          SizedBox(height: 600),
          Text("Ready to Chat!",
            style: TextStyle(fontSize: 140, color: Colors.white, fontFamily: 'Josefin', fontWeight: FontWeight.bold)),
          Text("Connecting you now to Mark Smith...",
            style: TextStyle(fontSize: 80, color: Colors.white, fontFamily: 'Josefin', fontWeight: FontWeight.bold)),
          SizedBox(height: 200),
          callConnected(),
        ],
      ),
    );

    return PageFrame(
      child: content
    );
  }
}
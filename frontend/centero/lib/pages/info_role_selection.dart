import 'package:centero/widgets/page_frame2.dart';
import 'package:centero/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'faceid_notice.dart';

class PageInfoRoleSelection extends StatelessWidget {
  // Move to face id notice screen
  void nextScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FaceIDNotice()),
    );
  }

  // Resident Button
  Widget residentButton(BuildContext context) {
    return ButtonPrimary(
      width: 1200,
      onPressed: () {nextScreen(context);}, 
      child: Text('Resident', style: TextStyle(fontSize: 80)));
  }

  // Nonresident Button
  Widget nonresidentButton(BuildContext context) {
    return ButtonPrimary(
      width: 1200,
      onPressed: () {nextScreen(context);}, 
      child: Text('Non-Resident', style: TextStyle(fontSize: 80)));
  }

  // Build column of buttons
  Widget buildButtonColumn(BuildContext context) {
    return Column(children: [residentButton(context), SizedBox(height: 80), nonresidentButton(context)]);
  }

  @override
  Widget build(BuildContext context) {
    final content = Container(
      width: 1500,
      child: Column(children: [
        SizedBox(height: 780),
        Text("Please tell us who we are talking with?",
          textAlign: TextAlign.center, 
          style: TextStyle(fontSize: 150, color: Colors.white, fontFamily: 'Josefin', fontWeight: FontWeight.bold)),
        SizedBox(height: 170),
        buildButtonColumn(context),
        SizedBox(height: 170),
        Text("Have an emergency? Please call 911.", 
          style: TextStyle(fontSize: 80, color: Colors.white, fontFamily: 'Josefin', fontWeight: FontWeight.bold)),
      ])
    );

    return PageFrame(
      child: content,
    );
  }
}
import 'package:centero/pages/faceid_notice.dart';
import 'package:centero/widgets/debug_page_placeholder.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:centero/widgets/button_primary.dart';
import 'package:centero/widgets/button_secondary_small.dart';
import 'package:flutter/material.dart';
import 'package:centero/styles/app_theme.dart';
import 'call_regular_loading.dart';
import 'welcome_home.dart';

class PageInfoRoleSelection extends StatelessWidget {
  // Move to call regular loading screen
  void nextScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PageCallRegularLoading()),
    );
  }

  // Move to welcome screen
  void goToWelcomeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PageWelcomeHome()),
    );
  }

  // Work Orders Button
  Widget workOrderButton(BuildContext context) {
    return ButtonPrimary(
      width: 1200,
      onPressed: () {nextScreen(context);}, 
      child: Text('Work Orders', style: TextStyle(fontSize: 80)));
  }

  // Amenity Info Button
  Widget amenityInfoButton(BuildContext context) {
    return ButtonPrimary(
      width: 1200,
      onPressed: () {nextScreen(context);}, 
      child: Text('Amenity Info', style: TextStyle(fontSize: 80)));
  }

  // Local Events Button
  Widget localEventsButton(BuildContext context) {
    return ButtonPrimary(
      width: 1200,
      onPressed: () {nextScreen(context);}, 
      child: Text('Local Events', style: TextStyle(fontSize: 80)));
  }

  // Your Lease Button
  Widget yourLeaseButton(BuildContext context) {
    return ButtonPrimary(
      width: 1200,
      onPressed: () {nextScreen(context);}, 
      child: Text('Your Lease', style: TextStyle(fontSize: 80)));
  }

  // Other Button
  Widget otherButton(BuildContext context) {
    return ButtonPrimary(
      width: 1200,
      onPressed: () {nextScreen(context);}, 
      child: Text('Other', style: TextStyle(fontSize: 80)));
  }

  // Exit Button
  Widget exitButton(BuildContext context) {
    return Container(
      width: 1800,
      child: Row(
        children: [
          ButtonSecondarySmall(
            width: 1500,
            onPressed: () {goToWelcomeScreen(context);}, 
            child: Text('Exit', style: TextStyle(fontSize: 45))),
          Expanded(child: Container())
        ]
      )
    );
  }

  // Build column of buttons
  Widget buildButtonColumn(BuildContext context) {
    return Column(children: [workOrderButton(context), SizedBox(height: 60), amenityInfoButton(context), SizedBox(height: 60), 
    localEventsButton(context), SizedBox(height: 60), yourLeaseButton(context), SizedBox(height: 60), 
    otherButton(context), SizedBox(height: 60), exitButton(context)]);
  }

  @override
  Widget build(BuildContext context) {
    final content = Column(children: [
      SizedBox(height: 600),
      Text("Hello, Resident!", 
        style: TextStyle(fontSize: 200, color: Colors.white, fontFamily: 'Josefin', fontWeight: FontWeight.bold)),
      Text("What would you like to chat about?", 
        style: TextStyle(fontSize: 80, color: Colors.white, fontFamily: 'Josefin', fontWeight: FontWeight.bold)),
      SizedBox(height: 150),
      buildButtonColumn(context)
    ]);

    return PageFrame(
      child: content,
    );
  }
}
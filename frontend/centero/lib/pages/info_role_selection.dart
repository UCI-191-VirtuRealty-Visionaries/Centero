import 'package:centero/widgets/debug_page_placeholder.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:centero/widgets/button_primary.dart';
import 'package:centero/widgets/button_secondary.dart';
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
  Widget WorkOrderButton(BuildContext context) {
    return ButtonPrimary(
      width: 1200,
      onPressed: () {nextScreen(context);}, 
      child: Text('Work Orders', style: TextStyle(fontSize: 80)));
  }

  // Amenity Info Button
  Widget AmenityInfoButton(BuildContext context) {
    return ButtonPrimary(
      width: 1200,
      onPressed: () {nextScreen(context);}, 
      child: Text('Amenity Info', style: TextStyle(fontSize: 80)));
  }

  // Local Events Button
  Widget LocalEventsButton(BuildContext context) {
    return ButtonPrimary(
      width: 1200,
      onPressed: () {nextScreen(context);}, 
      child: Text('Local Events', style: TextStyle(fontSize: 80)));
  }

  // Your Lease Button
  Widget YourLeaseButton(BuildContext context) {
    return ButtonPrimary(
      width: 1200,
      onPressed: () {nextScreen(context);}, 
      child: Text('Your Lease', style: TextStyle(fontSize: 80)));
  }

  // Other Button
  Widget OtherButton(BuildContext context) {
    return ButtonPrimary(
      width: 1200,
      onPressed: () {nextScreen(context);}, 
      child: Text('Other', style: TextStyle(fontSize: 80)));
  }

  // Exit Button
  Widget ExitButton(BuildContext context) {
    return Container(
      width: 1800,
      child: Row(
        children: [
          ButtonSecondary(
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
    return Column(children: [WorkOrderButton(context), SizedBox(height: 60), AmenityInfoButton(context), SizedBox(height: 60), LocalEventsButton(context), SizedBox(height: 60), YourLeaseButton(context), SizedBox(height: 60), OtherButton(context), SizedBox(height: 60), ExitButton(context)]);
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

import 'package:centero/pages/face_scan_nonresident.dart';
import 'package:centero/widgets/page_frame2.dart';
import 'package:centero/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'faceid_notice.dart';

class PageInfoNonResidentRoleSelection extends StatelessWidget {
  // Move to nonresident flow
  void nonresidentFaceScan(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PageFaceScanNonresident()),
    );
  }

  // Associate Button
  Widget associateButton(BuildContext context) {
    return ButtonPrimary(
      width: 1200,
      onPressed: () {nonresidentFaceScan(context);}, 
      child: Text('Associate', style: TextStyle(fontSize: 80)));
  }

  // Prospective Resident Button
  Widget prospectiveResidentButton(BuildContext context) {
    return ButtonPrimary(
      width: 1200,
      onPressed: () {nonresidentFaceScan(context);}, 
      child: Text('Prospective Resident', style: TextStyle(fontSize: 80), textAlign: TextAlign.center));
  }

  // Prospective Resident Button
  Widget otherButton(BuildContext context) {
    return ButtonPrimary(
      width: 1200,
      onPressed: () {nonresidentFaceScan(context);}, 
      child: Text('Other', style: TextStyle(fontSize: 80)));
  }

  // Build column of buttons
  Widget buildButtonColumn(BuildContext context) {
    return Column(children: [associateButton(context), SizedBox(height: 80), prospectiveResidentButton(context), 
      SizedBox(height: 80), otherButton(context)]);
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

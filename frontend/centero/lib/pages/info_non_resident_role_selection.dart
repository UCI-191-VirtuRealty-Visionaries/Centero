import 'package:centero/styles/text_styles.dart';
import 'package:centero/widgets/page_frame2.dart';
import 'package:centero/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'faceid_notice.dart';

class PageInfoNonResidentRoleSelection extends StatelessWidget {
  // Move to nonresident flow
  void nonresidentFaceScan(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FaceIDNotice()),
    );
  }

  // Associate Button
  Widget associateButton(BuildContext context) {
    return ButtonPrimary(
      width: 1200,
      onPressed: () {nonresidentFaceScan(context);}, 
      child: Text('Associate', style: MyTextStyle.btnTxt2));
  }

  // Prospective Resident Button
  Widget prospectiveResidentButton(BuildContext context) {
    return ButtonPrimary(
      width: 1200,
      onPressed: () {nonresidentFaceScan(context);}, 
      child: Text('Prospective Resident', style: MyTextStyle.btnTxtLong));
  }

  // Prospective Resident Button
  Widget otherButton(BuildContext context) {
    return ButtonPrimary(
      width: 1200,
      onPressed: () {nonresidentFaceScan(context);}, 
      child: Text('Other', style: MyTextStyle.btnTxt2));
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
        SizedBox(height: 550),
        Text("Please tell us who we are talking with?",
          textAlign: TextAlign.center, 
          style: MyTextStyle.heading),
        SizedBox(height: 70),
        buildButtonColumn(context),
        SizedBox(height: 70),
        Text("Have an emergency? Please call 911.", 
          style: MyTextStyle.body),
      ])
    );

    return PageFrame(
      child: content,
    );
  }
}

import 'package:centero/pages/info_non_resident_role_selection.dart';
import 'package:centero/styles/text_styles.dart';
import 'package:centero/widgets/page_frame2.dart';
import 'package:centero/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'faceid_notice.dart';

class PageInfoRoleSelection extends StatelessWidget {
  // Move to face id notice screen
  void residentFaceScan(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FaceIDNotice(
                previousPage: 'role selection',
              )),
    );
  }

  // Move to nonresident flow
  void nonresidentFaceScan(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PageInfoNonResidentRoleSelection()),
    );
  }

  // Resident Button
  Widget residentButton(BuildContext context) {
    return ButtonPrimary(
        width: 1200,
        onPressed: () {
          residentFaceScan(context);
        },
        child: Text('Resident', style: MyTextStyle.btnTxt2));
  }

  // Nonresident Button
  Widget nonresidentButton(BuildContext context) {
    return ButtonPrimary(
        width: 1200,
        onPressed: () {
          nonresidentFaceScan(context);
        },
        child: Text('Non-Resident', style: MyTextStyle.btnTxt2));
  }

  // Build column of buttons
  Widget buildButtonColumn(BuildContext context) {
    return Column(children: [
      residentButton(context),
      SizedBox(height: 80),
      nonresidentButton(context)
    ]);
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
          SizedBox(height: 100),
          Text("Have an emergency? Please call 911.",
              style: MyTextStyle.subheading),
        ]));

    return PageFrame(
      child: content,
    );
  }
}

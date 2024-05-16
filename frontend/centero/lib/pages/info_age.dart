import 'package:centero/styles/text_styles.dart';
import 'package:centero/widgets/button_danger.dart';
import 'package:centero/widgets/button_primary.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';
import 'faceid_notice.dart';
import 'welcome_home.dart';

class PageInfoAge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ----- Widgets -----

    Widget headerText() {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("You must be at least 18",
            style: TextStyle(
              fontSize: 120,
              color: Colors.white,
              fontFamily: 'Josefin',
              fontWeight: FontWeight.bold,
            )),
        Text("to proceed.",
            style: TextStyle(
              fontSize: 120,
              color: Colors.white,
              fontFamily: 'Josefin',
              fontWeight: FontWeight.bold,
            )),
      ]);
    }

    Widget btnProceed() {
      return ButtonPrimary(
        width: 1200,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FaceIDNotice()),
          );
        },
        child: Text(
          'I am 18+',
          style: MyTextStyle.btnTxt,
        ),
      );
    }

    Widget btnReturn() {
      return ButtonDanger(
        width: 1200,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageWelcomeHome()),
          );
        },
        child: Text(
          'I am NOT 18+',
          style: MyTextStyle.btnTxt,
        ),
      );
    }

    // ----- Structure -----

    return PageFrame(
      child: Center(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(
              top: 1000,
            )
            ),
            // padding above header text
            headerText(),
            Padding(
                padding: EdgeInsets.only(
              top: 100,
            )
            ),
            // padding above first button
            btnProceed(),
            Padding(
                padding: EdgeInsets.only(
              top: 75,
            )
            ),
            // padding above second button
            btnReturn(),
          ],
        ),
      ),
    );
  }
}
import 'package:centero/styles/text_styles.dart';
import 'package:centero/widgets/button_danger.dart';
import 'package:centero/widgets/button_primary.dart';
import 'package:centero/widgets/page_frame2.dart';
import 'package:flutter/material.dart';
import 'welcome_home.dart';
import 'info_role_selection.dart';

class PageInfoAge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ----- Widgets -----

    Widget headerText() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You must be at least ",
            style: MyTextStyle.heading,
            textAlign: TextAlign.center,
          ),
          RichText(
            text: TextSpan(
              /*defining default style is optional */
              children: <TextSpan>[
                TextSpan(
                    text: '18 to proceed.',
                    style: TextStyle(
                      color: const Color.fromRGBO(67, 176, 42, 1),
                      fontFamily: 'Josefin',
                      fontWeight: FontWeight.bold,
                      fontSize: 130,
                    ),),
               
              ],
            ),
          ),
        ],
      );
    }

    Widget btnProceed() {
      return ButtonPrimary(
        width: 800,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageInfoRoleSelection()),
          );
        },
        child: Text(
          'I Am 18+',
          style: MyTextStyle.btnTxt,
        ),
      );
    }

    Widget btnReturn() {
      return ButtonDanger(
        width: 1000,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageWelcomeHome()),
          );
        },
        child: Text(
          'I Am NOT 18+',
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
              top: 550,
            )),
            // padding above header text
            Container(
              margin: EdgeInsets.only(
                  left: 200, right: 200), // Add margin around the Text widget
              child: headerText(),
            ),
            Padding(
                padding: EdgeInsets.only(
              top: 120,
            )),

            // padding above first buttons
            btnProceed(),
            Padding(
                padding: EdgeInsets.only(
              top: 75,
            )),
            // padding above second button
            btnReturn(),
          ],
        ),
      ),
    );
  }
}

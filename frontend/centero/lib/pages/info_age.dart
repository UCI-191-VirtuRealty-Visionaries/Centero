import 'package:centero/styles/text_styles.dart';
import 'package:centero/widgets/button_danger.dart';
import 'package:centero/widgets/button_primary.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';
import 'info_role_selection.dart';

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
            )),
        Text("to proceed.",
            style: TextStyle(
              fontSize: 120,
              color: Colors.white,
            )),
      ]);
    }

    Widget btnProceed() {
      return ButtonPrimary(
        width: 1200,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageInfoRoleSelection()),
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
        onPressed: () {},
        child: Text(
          'I am NOT 18+',
          style: TextStyle(
            fontSize: 80,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      );
    }
/*
    Widget navigateToNextPage() {
      return ElevatedButton(
        child: Text('Go to role selection page',
            style: TextStyle(
              fontSize: 120,
            )),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageInfoRoleSelection()),
          );
        },
      );
    }
    Don't need this button to move to next page anymore
*/
    // ----- Structure -----

    return PageFrame(
      child: Center(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(
              top: 1000,
            )),
            headerText(),
            btnProceed(),
            btnReturn(),
          ],
        ),
      ),
    );
  }
}

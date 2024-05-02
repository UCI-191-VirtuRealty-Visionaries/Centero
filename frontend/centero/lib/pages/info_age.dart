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
    return Text(
      'You must be at least 18 to proceed.',
     // style: MyTextStyle.heading
    );
  }

  Widget btnProceed() {
    return ButtonPrimary(
      onPressed: () {},
      child: Text('I am 18+',
    //  style: MyTextStyle.btnTxt
      ),
    );
  }

  Widget btnReturn() {
    return ButtonDanger(
      onPressed: () {},
      child: Text('I am NOT 18+',
      style: TextStyle(
        fontSize: 200,
        color: const Color.fromARGB(255, 132, 0, 0),
      ),
      ),
    );
  }

  Widget navigateToNextPage() {
    return ElevatedButton(
      child: Text('Go to role selection page'),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageInfoRoleSelection()),
        );
      },
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
            )),
            headerText(),
            btnProceed(),
            btnReturn(),
            navigateToNextPage(),
          ],
        ),
      ),
    );
  }
}

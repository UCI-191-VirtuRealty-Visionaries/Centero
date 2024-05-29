import 'package:centero/pages/faceid_notice.dart';
import 'package:centero/widgets/button_secondary.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'welcome_home.dart';

class FaceScanFail extends StatelessWidget {
  //Stack
  @override
  Widget build(BuildContext context) {
    //Widgets
    Widget buildBackground() {
    return Image.asset(
      'assets/altlogin.png', // background image of apartment buildings
      fit: BoxFit.cover, // cover whole screen
      width: double.infinity, // image take up whole width
      height: double.infinity, // image take up whole height
    );
  }

    Widget headerText() {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Scan Unsuccessful.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Josefin',
              fontWeight: FontWeight.normal,
              fontSize: 80,
              color: Color.fromARGB(255, 220, 55, 71),
            )),
      ]);
    }

    Widget scanFailure() {
      return Image.asset(
        'assets/scanfail.png',
        width: 500, // logical pixels
        height: 500, // logical pixels
      );
    }

    Widget btnRetry() {
      return ButtonSecondary(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FaceIDNotice()),
          );
        },
        child: Text(
          'Try Again',
          style: TextStyle(
            fontSize: 80,
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'Josefin',
          ),
        ),
      );
    }

    Widget btnExit() {
      return ButtonSecondary(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageWelcomeHome()),
          );
        },
        child: Text(
          'Nevermind, Exit.',
          style: TextStyle(
            fontSize: 80,
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'Josefin',
          ),
        ),
      );
    }

    return PageFrame(
      child: Stack(
        alignment: Alignment(0, -0.6),
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
            top: 80,
          )),
          //btnProceed(),
          Positioned(top: 650, child: buildBackground()),
          Column(
            children: <Widget>[
              SizedBox(height: 800),
              Container(
                margin: EdgeInsets.only(
                    left: 750, right: 750), // Add margin around the Text widget
                child: headerText(),
              ),
              SizedBox(height: 50),
              scanFailure(),
              SizedBox(height: 350),
              btnRetry(),
              SizedBox(height: 100),
              btnExit(),
            ],
          ),
        ],
      ),
    );
  }
}

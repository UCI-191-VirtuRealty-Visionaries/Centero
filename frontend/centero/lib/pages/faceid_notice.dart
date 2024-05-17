import 'package:centero/widgets/button_secondary.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:centero/widgets/button_danger.dart';
import 'package:centero/widgets/button_primary.dart';
import 'face_scan.dart';
import 'resident_call_options.dart';
import 'welcome_home.dart';

class FaceIDNotice extends StatelessWidget {
  //Stack
  @override
  Widget build(BuildContext context) {
    //Widgets
    Widget faceScanner() {
      return SvgPicture.asset(
        'assets/face_scan_reticle.svg',
        width: 1000,
        height: 1000,
      );
    }

    Widget headerText() {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Please look at the top of the device while we verify identity.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Josefin',
              fontWeight: FontWeight.normal,
              fontSize: 60,
              color: Colors.white,
            )),
      ]);
    }

    Widget btnReturn() {
      return ButtonDanger(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageWelcomeHome()),
          );
        },
        child: Text(
          'No thanks, exit',
          style: TextStyle(
            fontSize: 80,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      );
    }

    Widget btnProceed() {
      return ButtonPrimary(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FaceScan()),
          );
        },
        child: Text(
          'Get Started',
          style: TextStyle(
            fontSize: 80,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      );
    }

    Widget btnAlternate() {
      return ButtonSecondary(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FaceScan()),
          );
        },
        child: Text(
          'Alternate Log In',
          style: TextStyle(
            fontSize: 80,
            color: Color.fromARGB(255, 255, 255, 255),
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
          Positioned(top: 650, child: faceScanner()),
          Column(
            children: <Widget>[
              SizedBox(height: 950),
              Container(
                margin:
                    EdgeInsets.only(left: 750, right: 750), // Add margin around the Text widget
                child: headerText(),
              ),
              SizedBox(height: 100),
              btnProceed(),
              SizedBox(height: 300),
              btnAlternate(),
              SizedBox(height: 100),
              btnReturn(),
            ],
          ),
        ],
      ),
    );
  }
}

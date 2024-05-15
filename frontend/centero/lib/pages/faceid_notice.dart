import 'package:centero/widgets/button_secondary.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:centero/widgets/button_danger.dart';
import 'package:centero/widgets/button_primary.dart';
import 'face_scan.dart';
import 'info_role_selection.dart';

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
              fontSize: 75,
              color: Colors.white,
            )),
      ]);
    }

    Widget btnReturn() {
      return ButtonDanger(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FaceScan()),
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
          'LETS GOOOO',
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

/*
    return PageFrame(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(
            top: 580,
          )),
          faceScanner(),
          headerText(),
          btnReturn(),
        ],
      ),
    );
  }
} */
    return PageFrame(
      child: Stack(
        alignment: Alignment(0, -0.6),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
            top: 80,
          )),
          //btnProceed(),
          Positioned(top: 550, child: faceScanner()),
          Column(
            children: <Widget>[
              SizedBox(height: 650),
              Container(
                margin:
                    EdgeInsets.only(left: 50, right: 50), // Add margin around the Text widget
                child: headerText(),
              ),
              btnProceed(),
              SizedBox(height: 400),
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

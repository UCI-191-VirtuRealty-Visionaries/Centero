import 'package:centero/pages/faceid_notice.dart';
import 'package:centero/widgets/button_secondary.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'welcome_home.dart';

class EndCall extends StatelessWidget {
  //Stack
  @override
  Widget build(BuildContext context) {
    //Widgets

    Widget scanFailure() {
      return Image.asset(
        'assets/propertymanagerguy.png',
        width: 500, // logical pixels
        height: 500, // logical pixels
      );
    }

    Widget headerText() {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Thanks for chatting!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Josefin',
              fontWeight: FontWeight.bold,
              fontSize: 100,
              color: Color.fromARGB(255, 255, 255, 255),
            )),
      ]);
    }
    Widget subText() {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Did Mark Smith resolve your issue?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Josefin',
              fontWeight: FontWeight.normal,
              fontSize: 65,
              color: Color.fromARGB(255, 255, 255, 255),
            )),
      ]);
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

          Column(
            children: <Widget>[
              SizedBox(height: 500),
              scanFailure(),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.only(
                    left: 450, right: 450), // Add margin around the Text widget
                child: headerText(), 
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(
                    left: 450, right: 450), // Add margin around the Text widget
                child: subText(), 
              ),
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

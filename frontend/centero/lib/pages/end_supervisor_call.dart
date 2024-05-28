import 'package:centero/pages/faceid_notice.dart';
import 'package:centero/widgets/button_secondary.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'welcome_home.dart';

class EndSupervisorCall extends StatelessWidget {
  //Stack
  @override
  Widget build(BuildContext context) {
    //Widgets

    Widget scanFailure() {
      return Image.asset(
        'assets/cindykim.png',
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
              fontSize: 130,
              color: Color.fromARGB(255, 255, 255, 255),
            )),
      ]);
    }

    Widget subText() {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Did Cindy Kim resolve your issue?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Josefin',
              fontWeight: FontWeight.normal,
              fontSize: 65,
              color: Color.fromARGB(255, 255, 255, 255),
            )),
      ]);
    }

    Widget thumbsUpBtn() {
      return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageWelcomeHome()),
          );
        },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
        ),
        child: Ink(
          decoration: BoxDecoration(
            image: DecorationImage(
                //Put image inside button
                image: AssetImage('assets/thumbsupbutton.png'),
                fit: BoxFit.cover), //Make image fill button
          ),
          child: Container(
            width: 300, // Specify the width of the button
            height: 300, // Specify the height of the button
          ),
        ),
      );
    }

    Widget thumbsDownBtn() {
      return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageWelcomeHome()),
          );
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
        ),
        child: Ink(
          decoration: BoxDecoration(
            image: DecorationImage(
                //Put image inside button
                image: AssetImage('assets/thumbsdownbutton.png'),
                fit: BoxFit.cover), //Make image fill button
          ),
          child: Container(
            width: 300, // Specify the width of the button
            height: 300, // Specify the height of the button
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
              SizedBox(height: 480),
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
              SizedBox(height: 50),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    thumbsUpBtn(),
                    SizedBox(width: 100),
                    thumbsDownBtn(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

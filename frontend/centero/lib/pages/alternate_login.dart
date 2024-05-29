import 'package:centero/widgets/button_secondary_small.dart';
import 'package:centero/widgets/button_secondary.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'welcome_home.dart';

class AlternateLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Widgets
    final content = GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageWelcomeHome()),
        );
      },
    );

    //Stack
    Widget buildBackground() {
      return Image.asset(
        'assets/altlogin1.png', // background image of apartment buildings
        fit: BoxFit.cover, // cover whole screen
        width: double.infinity, // image take up whole width
        height: double.infinity, // image take up whole height
      );
    }

    Widget btnAlternate() {
      return ButtonSecondary(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AlternateLogin()),
          );
        },
        child: Text(
          'Back',
          style: TextStyle(
            fontSize: 45,
            fontFamily: 'Josefin',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      );
    }

// Exit Button
    Widget exitButton(BuildContext context) {
      return Container(
          width: 1800,
          child: Row(children: [
            ButtonSecondarySmall(
                width: 500,
                
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageWelcomeHome()),
                  );
                },
                child: Text('Exit', style: TextStyle(fontSize: 45))),
            Expanded(child: Container())
          ]));
    }

    return PageFrame(
      child: Stack(
        alignment: Alignment(0, -0.6),
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
            top: 200,
          )),
          buildBackground(),
          SizedBox(height: 800),
          Positioned(child: btnAlternate()),
          SizedBox(height: 900),
          Padding(
              padding: EdgeInsets.only(
            top: 200,
          )),
          exitButton(context),
          /* Padding(
            padding: EdgeInsets.only(
            top: 80,
          )), */
          //btnProceed(),
          //  Positioned(top: 0, child: buildBackground()),
          Column(
            children: <Widget>[],
          ),
        ],
      ),
    );
  }
}

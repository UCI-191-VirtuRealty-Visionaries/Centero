import 'package:centero/widgets/page_frame2.dart';
import 'package:flutter/material.dart';
import 'info_age.dart';

class PageWelcomeHome extends StatefulWidget {
  @override
  State<PageWelcomeHome> createState() => _PageWelcomeHomeState();
}

class _PageWelcomeHomeState extends State<PageWelcomeHome> {
  void showPopup(text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  // Build background widget
  Widget buildBackground() {
    return Image.asset(
      'assets/apt_building_bg.jpg', // background image of apartment buildings
      fit: BoxFit.cover, // cover whole screen
      width: double.infinity, // image take up whole width
      height: double.infinity, // image take up whole height
    );
  }

  // Build Centero logo
  Widget buildCenteroLogo() {
    return Image.asset(
      'assets/centero_logo.png',
      width: 420, // logical pixels
      height: 420, // logical pixels
    );
  }

  // Build Centero card content
  Widget buildCenteroCardContent() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildCenteroLogo(),
      SizedBox(height: 20),
      Text("CENTERO",
          style: TextStyle(
              fontFamily: 'Josefin',
              fontSize: 220,
              fontWeight: FontWeight.bold)),
      Text("Would you like to chat?",
          style: TextStyle(
              fontFamily: 'Josefin',
              fontSize: 120,
              fontWeight: FontWeight.normal)),
      SizedBox(height: 55),
      Text("TOUCH SCREEN TO START",
          style: TextStyle(
              fontFamily: 'Josefin', fontSize: 75, fontWeight: FontWeight.bold))
    ]);
  }

  // Build Centero card
  Widget buildCenteroCard() {
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(
          top: 500,
        ), // add padding above the Opacity widget
        child: Container(
          width: double.infinity, // card take up whole width
          height: 1600,
          color: Colors.white.withOpacity(0.6),
          child: buildCenteroCardContent(),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final content = GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageInfoAge()),
        );
      },
      child: Stack(
        children: [
          buildBackground(),
          Center(child: buildCenteroCard()),
        ],
      ),
    );

    return PageFrame(
      //enableWatchdogTimer: false,
      child: content,
    );
  }
}

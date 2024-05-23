import 'package:flutter/material.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'resident_call_options.dart';
import 'welcome_home.dart';

class FaceScan extends StatelessWidget {
  Widget headerText() {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Ensure that your face is completely within frame.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Josefin',
              fontWeight: FontWeight.bold,
              fontSize: 60,
              color: Colors.white,
            )),
      ]);
  }

  Widget faceScanner() {
      return SvgPicture.asset(
        'assets/face_scan_reticle.svg',
        width: 1000,
        height: 1000,
      );
  }

  Widget residentBackground() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 1400,
          height: 1700,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 3.0)),
          child: SvgPicture.asset(
            'assets/confident_woman.svg',
            fit: BoxFit.cover)
        ), 
        Positioned(
          top: 100,
          child: faceScanner())
      ]
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final content = GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageWelcomeHome()),
        );
      },
      child: Column(children: [
        SizedBox(height: 650),
        headerText(),
        SizedBox(height: 100),
        residentBackground()
      ])
    );

    return PageFrame(
      child: content,
    );
  }
}
import 'package:centero/widgets/debug_page_placeholder.dart';
import 'package:centero/widgets/face_scan.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FaceIDNotice extends StatelessWidget {
  Widget faceScanner() {
    return SvgPicture.asset(
      'assets/face_scan_reticle.svg',
      width: 1200,
      height: 1300,
    );
  }

  Widget headerText() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("Please look at the top of the device while we verify identity.",
          style: TextStyle(
            fontSize: 100,
            color: Colors.white,
          )),
    ]);
  }

  //Stack
  @override
  Widget build(BuildContext context) {
    return PageFrame(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(
            top: 1000,
          )),
          faceScanner(),
          headerText(),
        ],
      ),
    );
  }
}


/*
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
      child: content,
    );
  }
}

    */
import 'package:flutter/material.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'resident_call_options.dart';

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

  
  
  @override
  Widget build(BuildContext context) {
    final content = Column(children: [
      SizedBox(height: 650),
      headerText(),
      faceScanner()
    ]);

    return PageFrame(
      child: content,
    );
  }
}
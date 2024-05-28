import 'package:flutter/material.dart';
import 'package:centero/widgets/page_frame2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'face_scan_success.dart';

class PageFaceScanNonresident extends StatelessWidget {
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
        width: 900,
        height: 900,
      );
  }

  Widget nonresidentBackground() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/nonresident_woman.png',
          width: 1400,
          height: 1850,
          fit: BoxFit.cover,
        ),
        // Container(
        //   width: 1400,
        //   height: 1850,
        //   decoration: BoxDecoration(
        //     border: Border.all(color: Colors.white, width: 3.0)),
        //   // child: SvgPicture.asset(
        //   //   'assets/confident_woman.svg',
        //   //   fit: BoxFit.cover)
        // ), 
        Positioned(
          top: 120,
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
          MaterialPageRoute(builder: (context) => FaceScanSuccess()),
        );
      },
      child: Column(children: [
        SizedBox(height: 650),
        headerText(),
        SizedBox(height: 100),
        nonresidentBackground()
      ])
    );

    return PageFrame(
      child: content,
    );
  }
}
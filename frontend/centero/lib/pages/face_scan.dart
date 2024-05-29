import 'package:flutter/material.dart';
import 'package:centero/widgets/page_frame2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'face_scan_success.dart';

class FaceScan extends StatelessWidget {
    final String? previousPage; 

  // Constructor
    const FaceScan({Key? key, this.previousPage}) : super(key: key);

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

  Widget residentBackground() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/confident_woman.png',
          width: 1400,
          height: 1850,
          fit: BoxFit.cover,
        ),
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
          MaterialPageRoute(builder: (context) => FaceScanSuccess(previousPage: previousPage,)),
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
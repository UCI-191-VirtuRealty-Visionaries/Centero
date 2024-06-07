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
        width: 1000,
        height: 1000,
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
          MaterialPageRoute(builder: (context) => FaceScanSuccess(previousPage: 'nonresident',)),
        );
      },
      child: Stack(
        alignment: Alignment(0, -0.6),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
            top: 80,
          )),
          Positioned(top: 450, child: nonresidentBackground()),
          Positioned(top: 550, child: faceScanner()),
          
          Column(
            children: <Widget>[
              SizedBox(height: 1650),
              Container(
                margin:
                    EdgeInsets.only(left: 550, right: 550), // Add margin around the Text widget
                
                child: headerText(),
              ),
              
            ],
          ),
        ],
      )
    );

    return PageFrame(
      child: content,
    );
  }
}
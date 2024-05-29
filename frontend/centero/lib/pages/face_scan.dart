import 'package:centero/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:centero/widgets/page_frame2.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'face_scan_success.dart';

class FaceScan extends StatelessWidget {
  final String? previousPage;

  // Constructor
  const FaceScan({Key? key, this.previousPage}) : super(key: key);

  Widget headerText() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("Ensure that your face is completely within frame.",
          textAlign: TextAlign.center, style: MyTextStyle.subheading),
    ]);
  }

  Widget faceScanner() {
    return SvgPicture.asset(
      'assets/face_scan_reticle.svg',
      width: 900,
      height: 900,
    );
  }

  Widget lady() {
    return Image.asset(
      'assets/confident_woman.png',
     
      width: 1400,
      height: 1850,
      fit: BoxFit.cover,
    );
  }

  Widget residentBackground() {
    return Stack(alignment: Alignment.center, children: [
      
      Positioned(top: 0, child: lady()),
      Positioned(top: 0, child: faceScanner())
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final content = GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FaceScanSuccess(
                      previousPage: previousPage,
                    )),
          );
        },
        child: Stack(
        alignment: Alignment(0, -0.6),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
            top: 80,
          )),
          Positioned(top: 450, child: lady()),
          Positioned(top: 550, child: faceScanner()),
          
          Column(
            children: <Widget>[
              SizedBox(height: 1550),
              Container(
                margin:
                    EdgeInsets.only(left: 550, right: 550), // Add margin around the Text widget
                child: headerText(),
              ),
              SizedBox(height: 100),
            ],
          ),
        ],
      ));

    return PageFrame(
      child: content,
    );
  }
}

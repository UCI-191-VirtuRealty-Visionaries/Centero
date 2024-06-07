import 'package:centero/styles/text_styles.dart';
import 'package:centero/widgets/page_frame2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'resident_call_options.dart';
import 'nonresident_call_options.dart';

class FaceScanSuccess extends StatelessWidget {
  final String? previousPage; 

  // Constructor
  const FaceScanSuccess({Key? key, this.previousPage}) : super(key: key);

  Widget faceScanner() {
    return SvgPicture.asset(
      'assets/face_scan_reticle.svg',
      width: 1000,
      height: 1000,
    );
  }



  Widget scanSuccess() {
    return Image.asset(
      'assets/scansuccess.png',
      width: 500, // logical pixels
      height: 500, // logical pixels
    );
  }

  Widget headerText() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("Authentication Success! We will connect you now!",
          textAlign: TextAlign.center,
          style: MyTextStyle.heading,
          ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    //Widgets
    final content = GestureDetector(
      onTap: () {
        if (previousPage == 'nonresident') {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageNonResidentCallOptions()));
        } else {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageResidentCallOptions()));
        }
      },
      child: Stack(
        alignment: Alignment(0, -0.6),
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
            top: 80,
          )),
          Positioned(top: 650, child: faceScanner()),
          Column(
            children: <Widget>[
              SizedBox(height: 800),
              Container(
                margin: EdgeInsets.only(
                    left: 750, right: 750), // Add margin around the Text widget
                child: headerText(),
              ),
              SizedBox(height: 50),
              scanSuccess(),
             
            ],
          ),
        ],
      ),
    );
    return PageFrame(
      child: content,
      );
  }
}

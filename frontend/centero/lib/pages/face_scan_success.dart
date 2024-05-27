import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'resident_call_options.dart';

class FaceScanSuccess extends StatefulWidget {
  //Stack
  @override
  State<FaceScanSuccess> createState() => _FaceScanSuccessState();
}
  
class _FaceScanSuccessState extends State<FaceScanSuccess> {
  void showPopup(text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

Widget faceScanner() {
      return SvgPicture.asset(
        'assets/face_scan_reticle.svg',
        width: 1000,
        height: 1000,
      );
    }

    Widget headerText() {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Scan Successful!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Josefin',
              fontWeight: FontWeight.normal,
              fontSize: 80,
              color: Color.fromARGB(255, 59, 189, 15),
            )),
      ]);
    }

    Widget scanSuccess() {
      return Image.asset(
        'assets/scansuccess.png',
        width: 500, // logical pixels
        height: 500, // logical pixels
      );
    }

    Widget bottomText() {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("We will connect you now!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Josefin',
              fontWeight: FontWeight.normal,
              fontSize: 60,
              color: Colors.white,
            )),
      ]);
    }

  @override
  Widget build(BuildContext context) {
    //Widgets
    final content = GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageResidentCallOptions()),
        );
      },
      child: Stack(
        alignment: Alignment(0, -0.6),
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
            top: 80,
          )),
          //btnProceed(),
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
              SizedBox(height: 300),
              bottomText()
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

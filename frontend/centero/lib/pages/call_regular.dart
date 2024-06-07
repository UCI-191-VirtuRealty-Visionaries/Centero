import 'package:centero/pages/end_call.dart';
import 'package:centero/styles/text_styles.dart';
import 'package:centero/widgets/name_header.dart';
import 'package:centero/widgets/page_frame_rcall.dart';
import 'package:centero/widgets/button_end_call.dart';
import 'package:centero/widgets/button_mute.dart';
import 'package:flutter/material.dart';


class PageCallRegular extends StatelessWidget {
  
  void swapButton() {}
  @override
  Widget build(BuildContext context) {
    void nextScreen(BuildContext context) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EndCall()));
    }

    Widget muteButton() {
      return ButtonMute(
          onPressed: () {
          }, child: Icon(Icons.mic_rounded, size: 190));
    }

    Widget unmuteButton() {
      return ButtonMute(
          onPressed: () {}, child: Icon(Icons.mic_off, size: 190));
    }

    Widget endCallButton() {
      return ButtonEndCall(
          onPressed: () {
            nextScreen(context);
          },
          child: Icon(Icons.call_end_rounded, size: 190));
    }

    Widget nameHeader() {
      return NameHeader(
          child: Text('You are speaking with: Marcus Bennett',
              style: MyTextStyle.subheading2, textAlign: TextAlign.center));
    }

    final content = Column(children: [
      SizedBox(height: 150),
      nameHeader(),

      //Column to hold the 2 buttons and place them to the right
      Column(
        children: [
          SizedBox(height: 750),
          Container(
            margin: EdgeInsets.only(
                left: 1400), // Add margin around the Text widget
            child: muteButton(),
          ),
          SizedBox(height: 100),
          Container(
            margin: EdgeInsets.only(
                left: 1400), // Add margin around the Text widget
            child: endCallButton(),
          ),
          
        ],
      ),
      // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // children: [muteButton(), endCallButton()])
    ]);

    return PageFrame(child: content);
  }
}

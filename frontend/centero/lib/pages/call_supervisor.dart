import 'package:centero/widgets/name_header.dart';
import 'package:centero/widgets/page_frame_ecall.dart';
import 'package:centero/widgets/button_end_call.dart';
import 'package:centero/widgets/button_mute.dart';
import 'end_supervisor_call.dart';
import 'package:flutter/material.dart';

class PageCallSupervisor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void nextScreen(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EndSupervisorCall()),
      );
    }

    Widget muteButton() {
      return ButtonMute(
        onPressed: () {}, 
        child: Icon(Icons.mic_rounded, size: 190));
    }

    Widget endCallButton() {
      return ButtonEndCall(
        onPressed: () {nextScreen(context);},
        child: Icon(Icons.call_end_rounded, size: 190));
    }

    Widget escalatedCallHeader() {
      return Text('Escalated Supervisor Call', 
          style: TextStyle(fontSize: 70, fontFamily: 'Josefin', fontWeight: FontWeight.bold,  color: Colors.white), 
          textAlign: TextAlign.center);
    }

    Widget nameHeader() {
      return NameHeader(
        child: Text('You are speaking with: Cindy Kim', 
          style: TextStyle(fontSize: 80, fontFamily: 'Josefin', fontWeight: FontWeight.bold), 
          textAlign: TextAlign.center));
    }

    final content = Column(children: [
      SizedBox(height: 50),
      escalatedCallHeader(),
      SizedBox(height: 50),
      nameHeader(),
      SizedBox(height: 2000),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [muteButton(), endCallButton()])
      ]);
  
    return PageFrame(
      child: content
    );
  }
}

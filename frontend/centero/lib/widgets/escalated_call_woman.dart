import 'package:flutter/material.dart';

class EscalatedCallWoman extends StatelessWidget {
  EscalatedCallWoman({
    super.key,
  });

   @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/escalated_call.jpg', // background image of woman
      fit: BoxFit.cover, // cover whole screen
      width: double.infinity, // image take up whole width
      height: double.infinity, // image take up whole height
    ); 
  }
}
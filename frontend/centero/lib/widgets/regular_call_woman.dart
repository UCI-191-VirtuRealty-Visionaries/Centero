import 'package:flutter/material.dart';

class RegularCallWoman extends StatelessWidget {
  RegularCallWoman({
    super.key,
  });

   @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/regular_call_woman.png', // background image of woman
      fit: BoxFit.cover, // cover whole screen
      width: double.infinity, // image take up whole width
      height: double.infinity, // image take up whole height
    ); 
  }
}
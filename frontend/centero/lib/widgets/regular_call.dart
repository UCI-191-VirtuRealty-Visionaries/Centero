import 'package:flutter/material.dart';

class RegularCall extends StatelessWidget {
  RegularCall({
    super.key,
  });

   @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/property_manager_guy_call.png', // background image of guy
      fit: BoxFit.cover, // cover whole screen
      width: double.infinity, // image take up whole width
      height: double.infinity, // image take up whole height
    ); 
  }
}
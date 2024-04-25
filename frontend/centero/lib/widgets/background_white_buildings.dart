import 'package:flutter/material.dart';

class BackgroundWhiteBuildings extends StatelessWidget {
  BackgroundWhiteBuildings({
    super.key,
  });

   @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/apt_building_bg.jpg', // background image of white apartment buildings
      fit: BoxFit.cover, // cover whole screen
      width: double.infinity, // image take up whole width
      height: double.infinity, // image take up whole height
    ); 
  }
}
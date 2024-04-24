import 'package:flutter/material.dart';

class BackgroundRedBuildings extends StatelessWidget {
  BackgroundRedBuildings({
    super.key,
  });

   @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/red_apt_buildings_bg.png', // background image of white apartment buildings
      fit: BoxFit.cover, // cover whole screen
      width: double.infinity, // image take up whole width
      height: double.infinity, // image take up whole height
    ); 
  }
}
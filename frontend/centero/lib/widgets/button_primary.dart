import 'package:flutter/material.dart';

class ButtonPrimary extends ElevatedButton {
  ButtonPrimary({
    super.key,
    required super.onPressed,
    required super.child,
    double width = double.infinity, // Default width to infinity
    
  })  : super(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            maximumSize: Size(width, 100), // Set the width
            textStyle: TextStyle(
              fontSize: 250, // Text size 
              
            ),
          ),
        );

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.green,
    );
  }
}

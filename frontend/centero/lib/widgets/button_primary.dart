import 'package:flutter/material.dart';

class ButtonPrimary extends OutlinedButton {
  ButtonPrimary({
    super.key,
    required super.onPressed,
    required super.child,
    double width = double.infinity, // Default width to infinity
  })  : super(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            side: BorderSide(width: 5.0, color: Colors.white),
            //maximumSize: Size(width, 100), // Set the width
            //minimumSize: const Size(64, 36),
            //maximumSize: Size.infinite,
            textStyle: TextStyle(
              fontSize: 250, // Text size 
              
            ),
          ),
        );

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.green,
      fixedSize: const Size(850, 200),
    );
  }
}

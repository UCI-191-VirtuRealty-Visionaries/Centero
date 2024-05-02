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
            minimumSize: Size(width, 128), // Set the width
            textStyle: TextStyle(
              color: Colors.yellow, // Text color
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

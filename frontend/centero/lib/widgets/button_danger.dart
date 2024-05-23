import 'package:flutter/material.dart';

class ButtonDanger extends ElevatedButton {
  ButtonDanger({
    super.key,
    required super.onPressed,
    required super.child,
    double width = double.infinity, // Default width to infinity

  })  : super(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            side: BorderSide(width: 5.0, color: Colors.white),
            //maximumSize: Size(width, 100), // Set the width
            textStyle: TextStyle(
              fontSize: 250, // Text size 
              
            ),
          ),
        );

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.red,
      fixedSize: const Size(750, 190),
    );
  }
}

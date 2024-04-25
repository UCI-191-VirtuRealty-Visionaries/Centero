import 'package:flutter/material.dart';

class ButtonDanger extends ElevatedButton {
  ButtonDanger({
    super.key,
    required super.onPressed,
    required super.child,
  });

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.red,
      
    );
  }
}

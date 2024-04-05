import 'package:flutter/material.dart';

class ButtonSecondary extends ElevatedButton {
  ButtonSecondary({
    super.key,
    required super.onPressed,
    required super.child,
  });

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.grey.shade300,
    );
  }
}

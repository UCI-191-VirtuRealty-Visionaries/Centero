import 'package:flutter/material.dart';

class ButtonSecondary extends ElevatedButton {
  ButtonSecondary({
    super.key,
    required super.onPressed,
    required super.child,
    double width = double.infinity,
  });

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.grey.shade300.withOpacity(0.25),
      side: BorderSide(width: 5.0, color: Colors.white),
      fixedSize: const Size(350, 120),
    );
  }
}

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
      backgroundColor: const Color.fromRGBO(57, 57, 57, 1),
    );
  }
}

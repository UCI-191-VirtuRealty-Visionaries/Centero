import 'package:flutter/material.dart';

class ButtonPrimary extends ElevatedButton {
  ButtonPrimary({
    super.key,
    required super.onPressed,
    required super.child,
  });

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color.fromRGBO(67, 176, 42, 1),
    );
  }
}

import 'package:flutter/material.dart';  

class ButtonMute extends ElevatedButton {
  ButtonMute({
    super.key,
    super.onPressed,
    required super.child
  });

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return ElevatedButton.styleFrom(
      shape: CircleBorder(),
      fixedSize: Size(350, 350),
      padding: EdgeInsets.all(50),
      backgroundColor: Colors.grey.withOpacity(0.7),
      foregroundColor: Colors.white,
    );
  }
} 
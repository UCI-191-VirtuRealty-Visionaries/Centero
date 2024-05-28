import 'package:flutter/material.dart';  

class NameHeader extends OutlinedButton {
  NameHeader({
    super.key,
    super.onPressed,
    required super.child
  });

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(70)
      ),
      side: BorderSide(color: Colors.black.withOpacity(0.8)),
      fixedSize: Size(1500, 140),
      padding: EdgeInsets.all(20),
      backgroundColor: Colors.white.withOpacity(0.75),
      foregroundColor: Colors.black,
    );
  }
} 
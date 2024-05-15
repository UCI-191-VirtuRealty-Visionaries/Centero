import 'package:flutter/material.dart';

class DebugPagePlaceholder extends StatelessWidget {
  final String message;

  const DebugPagePlaceholder({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final content = Text(
      message,
      style: TextStyle(
        color: Colors.white,
        fontSize: 40,
      ),
    );

    return Center(
      child: content,
    );
  }
}

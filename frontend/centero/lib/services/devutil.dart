import 'package:flutter/material.dart';

class DevUtil {
  static Widget buildTextBlob(Iterable<String> entries) {
    final inner = entries.map((e) => Text(e));

    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Column(
        children: List.from(inner),
      ),
    );
  }

  static Widget buildButton(String text, void Function() onPressed) {
    return TextButton(onPressed: onPressed, child: Text(text));
  }

  static Widget buildButtonStack(
    String header,
    String text,
    void Function() onPressed,
  ) {
    return Column(
      children: [
        Text(header),
        TextButton(onPressed: onPressed, child: Text(text)),
        SizedBox(height: 10),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class DevUtil {
  static Widget surroundWithOutline(Widget content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0x2E000000)),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: content,
      ),
    );
  }

  static Widget buildTextBlob(Iterable<String> entries) {
    final inner = entries.map((e) => Text(e));
    final content = Column(children: List.from(inner));

    return surroundWithOutline(content);
  }

  static Widget buildButton(String text, void Function() onPressed) {
    return FilledButton.tonal(onPressed: onPressed, child: Text(text));
  }

  static Widget buildButtonStack(
    String header,
    String text,
    void Function() onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Text(header),
          buildButton(text, onPressed),
        ],
      ),
    );
  }
}

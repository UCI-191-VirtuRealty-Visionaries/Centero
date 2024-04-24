import 'package:flutter/material.dart';

class WidgetUtil {
  static List<Widget> fromVisibilityMap(Map<Widget, bool> map) {
    final List<Widget> ret = [];
    map.forEach((widget, visible) {
      if (visible) {
        ret.add(widget);
      }
    });
    return ret;
  }
}

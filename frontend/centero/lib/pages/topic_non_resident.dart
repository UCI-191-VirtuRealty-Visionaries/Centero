import 'package:centero/widgets/debug_page_placeholder.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';

class PageTopicNonResident extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageFrame(
      child: DebugPagePlaceholder(message: toString()),
    );
  }
}

import 'package:centero/subwidgets/subwidget_factory_base.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';

// ==================================================
// Page Frame
// ==================================================

class PageFrameSubwidgets extends SubwidgetFactory<PageFrame> {
  PageFrameSubwidgets({required super.context});

  Widget buildBackground() {
    // TODO: Create
    return Text('Unfinished!');
  }

  Widget buildSafeAreaOverlay() {
    // ----- Widgets -----

    // TODO: Fix sizing
    final debugFigure = SizedBox(
      child: Image.asset('debug_person_overlay.png'),
    );

    // ----- Structure -----

    return Container(
      child: debugFigure,
    );
  }
}

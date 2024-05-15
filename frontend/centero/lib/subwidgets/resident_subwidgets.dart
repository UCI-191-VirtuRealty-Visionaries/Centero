import 'package:centero/subwidgets/subwidget_factory_base.dart';
import 'package:centero/widgets/background_red_buildings.dart';
import 'package:centero/widgets/background_white_buildings.dart';
import 'package:centero/widgets/button_secondary.dart';
import 'package:centero/widgets/logo_footer.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';

// ==================================================
// Page Frame
// ==================================================

class PageFrameSubwidgets extends SubwidgetFactory<PageFrame> {
  PageFrameSubwidgets({required super.context});

  Widget buildRedBackground() {
    // Should take up full frame

    return BackgroundRedBuildings();
  }

  Widget buildWhiteBackground() {
    // Should take up full frame

    return BackgroundWhiteBuildings();
  }

  Widget buildSafeAreaOverlay() {
    // Should take up full frame

    final debugFigure = SizedBox(
      height: 150,
      width: 400,
      child: Image.asset('assets/debug_person_overlay.png'),
    );

    final content = Opacity(
      opacity: 0.5,
      child: debugFigure,
    );

    return Positioned.fill(
      bottom: 0,
      child: content,
    );
  }

  Widget buildToggleButtonForSafeOverlay({
    required void Function() onClick,
  }) {
    // Should take up full frame

    final btnToggle = ButtonSecondary(
      onPressed: onClick,
      child: Text('Toggle Overlay'),
    );

    final content = Opacity(
      opacity: 0.5,
      child: btnToggle,
    );

    return Positioned(
      bottom: 10,
      left: 0,
      height: 30,
      child: content,
    );
  }

  Widget buildFooterLogo() {
    // Should take up full frame

    final footer = SizedBox(
      height: 120,
      child: LogoFooter(),
    );

    return Positioned(
      bottom: 20,
      height: 70,
      child: footer,
    );
  }
}

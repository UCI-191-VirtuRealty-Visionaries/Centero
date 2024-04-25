import 'package:centero/subwidgets/subwidget_factory_base.dart';
import 'package:centero/widgets/background_red_buildings.dart';
import 'package:centero/widgets/button_secondary.dart';
import 'package:centero/widgets/logo_footer.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';

// ==================================================
// Page Frame
// ==================================================

class PageFrameSubwidgets extends SubwidgetFactory<PageFrame> {
  PageFrameSubwidgets({required super.context});

  Widget buildBackground() {
    // Should take up full frame

    return BackgroundRedBuildings();
  }

  Widget buildSafeAreaOverlay() {
    // Should take up full frame

    final debugFigure = SizedBox(
      height: 150,
      width: 400,
      child: Image.asset('debug_person_overlay.png'),
    );

    return Positioned.fill(
      bottom: 0,
      child: debugFigure,
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

    return Positioned.fill(
      bottom: 20,
      left: 20,
      child: btnToggle,
    );
  }

  Widget buildFooterLogo() {
    // Should take up full frame

    final footer = SizedBox(
      height: 120,
      child: LogoFooter(),
    );

    return Container(
      alignment: AlignmentDirectional.bottomCenter,
      child: footer,
    );
  }
}

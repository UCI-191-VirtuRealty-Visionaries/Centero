import 'package:centero/global_config.dart';
import 'package:centero/services.dart';
import 'package:centero/services/watchdog_timer.dart';
import 'package:centero/services/widget_util.dart';
import 'package:centero/subwidgets/resident_subwidgets.dart';
import 'package:centero/widgets/logo_footer.dart';
import 'package:flutter/material.dart';

class PageFrame extends StatefulWidget {
  final Widget content;
  final Duration maxIdleTimeBeforeLogout;

  const PageFrame({
    super.key,
    required this.content,
    this.maxIdleTimeBeforeLogout = GlobalConfig.standardIdleTimeout,
  });

  @override
  State<PageFrame> createState() => _PageFrameState();
}

class _PageFrameState extends State<PageFrame> {
  late WatchdogTimer watchdogTimer;
  bool overlayVisible = false;

  @override
  void initState() {
    super.initState();
    watchdogTimer = WatchdogTimer(name: 'PageFrame.WatchdogTimer');
    watchdogTimer.start(widget.maxIdleTimeBeforeLogout, () {
      Services.nav.resetToWelcome(context);
    });
  }

  void toggleOverlay() {
    setState(() {
      overlayVisible = !overlayVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ----- Support -----

    final subwidgets = PageFrameSubwidgets(context: context);

    // ----- Widgets -----

    final background = subwidgets.buildBackground();

    final content = widget.content;

    final btnToggleSafeArea = FilledButton.tonal(
      onPressed: toggleOverlay,
      child: Text(overlayVisible ? 'Hide Overlay' : 'Show Overlay'),
    );

    final safeArea = subwidgets.buildSafeAreaOverlay();

    final footer = LogoFooter();

    // ----- Structure -----

    Map<Widget, bool> visMap = {
      background: true,
      content: true,
      btnToggleSafeArea: true,
      safeArea: overlayVisible,
      footer: true,
    };

    return Stack(
      children: WidgetUtil.fromVisibilityMap(visMap),
    );
  }
}

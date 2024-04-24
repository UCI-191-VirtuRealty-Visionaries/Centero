import 'package:centero/global_config.dart';
import 'package:centero/services.dart';
import 'package:centero/services/watchdog_timer.dart';
import 'package:centero/services/widget_util.dart';
import 'package:centero/subwidgets/resident_subwidgets.dart';
import 'package:centero/widgets/logo_footer.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class PageFrame extends StatefulWidget {
  final Widget child;
  final Duration maxIdleTimeBeforeLogout;

  const PageFrame({
    super.key,
    required this.child,
    this.maxIdleTimeBeforeLogout = GlobalConfig.standardIdleTimeout,
  });

  @override
  State<PageFrame> createState() => _PageFrameState();
}

class _PageFrameState extends State<PageFrame> {
  final logger = Logger('PageFrame');
  late WatchdogTimer watchdogTimer;
  bool overlayVisible = false;

  @override
  void initState() {
    super.initState();
    watchdogTimer = WatchdogTimer(name: 'PageFrame.WatchdogTimer');

    watchdogTimer.start(widget.maxIdleTimeBeforeLogout, () {
      if (GlobalConfig.enableIdleLogout) {
        Services.nav.resetToWelcome(context);
      } else {
        logger.fine('Idle timeout elapsed but suppressed with global config.');
      }
    });
  }

  void toggleOverlay() {
    overlayVisible = !overlayVisible;

    if (overlayVisible) {
      watchdogTimer.pause();
    } else {
      watchdogTimer.unpause();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // ----- Support -----

    final subwidgets = PageFrameSubwidgets(context: context);

    // ----- Widgets -----

    final background = subwidgets.buildBackground();

    final content = widget.child;

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
      safeArea: overlayVisible,
      btnToggleSafeArea: true,
      footer: true,
    };

    return Scaffold(
      body: Stack(
        children: WidgetUtil.fromVisibilityMap(visMap),
      ),
    );
  }
}

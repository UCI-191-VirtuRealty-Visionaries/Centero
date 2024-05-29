import 'package:centero/global_config.dart';
import 'package:centero/services.dart';
import 'package:centero/util/watchdog_timer.dart';
import 'package:centero/util/widget_util.dart';
import 'package:centero/subwidgets/resident_subwidgets.dart';
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
    watchdogTimer = WatchdogTimer(logger: Logger('PageFrame.WatchdogTimer'));

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

    final background = subwidgets.buildEscalatedCallBackground();

    final content = widget.child;

    final btnToggleSafeArea = subwidgets.buildToggleButtonForSafeOverlay(
      onClick: toggleOverlay,
    );

    final safeArea = subwidgets.buildSafeAreaOverlay();

    final footer = subwidgets.buildFooterLogo();

    // ----- Structure -----

    Map<Widget, bool> visMap = {
      background: true,
      content: true,
      safeArea: overlayVisible,
      btnToggleSafeArea: GlobalConfig.isDevMode,
      footer: false,
    };

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: WidgetUtil.fromVisibilityMap(visMap),
      ),
    );
  }
}
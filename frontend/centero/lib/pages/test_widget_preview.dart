import 'package:centero/widgets/button_alternate.dart';
import 'package:centero/widgets/button_danger.dart';
import 'package:centero/widgets/button_primary.dart';
import 'package:centero/widgets/button_secondary.dart';
import 'package:centero/widgets/face_scan.dart';
import 'package:centero/widgets/logo_footer.dart';
import 'package:centero/widgets/logo_minimal.dart';
import 'package:centero/widgets/mock_face_scan.dart';
import 'package:centero/widgets/test_logout.dart';
import 'package:centero/widgets/video_call.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class TestWidgetPreviewPage extends StatelessWidget {
  final logger = Logger('WidgetPreview');

  @override
  Widget build(BuildContext context) {
    // ----- Children -----

    final btnPrimary = ButtonPrimary(
      onPressed: () => logger.info('Pressed primary button'),
      child: const Text('Button Primary'),
    );

    final btnDanger = ButtonDanger(
      onPressed: () => logger.info('Pressed danger button'),
      child: const Text('Button Danger'),
    );

    final btnSecondary = ButtonSecondary(
      onPressed: () => logger.info('Pressed secondary button'),
      child: const Text('Button Secondary'),
    );

    final btnAlternate = ButtonAlternate(
      onPressed: () => logger.info('Pressed alternate button'),
      child: const Text('Button Alternate'),
    );

    final logoMinimal = LogoMinimal();

    final logoFooter = LogoFooter();

    final testLogOut = TestLogOut();

    final faceScan = FaceScanWidget(
      onValidated: () => logger.info('Received validated callback.'),
    );

    final mockFaceScan = MockFaceScanWidget();

    final videoCall = VideoCallWidget(
      onHangup: () => logger.info('Received hang-up callback.'),
    );

    // ----- Builder -----

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        title: const Text('Widget Preview (Dev Only)'),
      ),
      body: Center(
        child: Row(
          children: [
            Column(
              children: [
                btnPrimary,
                btnDanger,
                btnSecondary,
                btnAlternate,
                logoMinimal,
                logoFooter,
                testLogOut,
              ],
            ),
            Column(children: [faceScan, mockFaceScan]),
            Column(children: [videoCall]),
          ],
        ),
      ),
    );
  }
}

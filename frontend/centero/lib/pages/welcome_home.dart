import 'package:centero/widgets/mock_face_scan.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';

class PageWelcomeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageFrame(
      maxIdleTimeBeforeLogout: Duration(seconds: 10),
      child: MockFaceScanWidget(),
    );
  }
}

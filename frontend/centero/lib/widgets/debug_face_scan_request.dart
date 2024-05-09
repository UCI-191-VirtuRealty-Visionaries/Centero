import 'package:centero/services.dart';
import 'package:centero/util/dev_util.dart';
import 'package:flutter/material.dart';

class DebugFaceScanRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final header = Text('Face Scan Test');

    final btnSend = DevUtil.buildButton('Send Request', () async {
      Services.backend.authenticateResidentFaceScan();
    });

    final content = Column(
      children: [
        header,
        btnSend,
      ],
    );

    return DevUtil.surroundWithOutline(content);
  }
}

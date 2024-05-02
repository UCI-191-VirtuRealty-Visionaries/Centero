import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logging/logging.dart';

class FaceScanWidget extends StatefulWidget {
  FaceScanWidget({
    super.key,
    required this.onValidated,
  });

  final Function onValidated;

  @override
  State<StatefulWidget> createState() {
    return FaceScanWidgetState();
  }
}

class FaceScanWidgetState extends State<FaceScanWidget> {
  final Logger logger = Logger('FaceScanWidget');
  bool validated = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(children: [
        const Text('Face Scan'),
        SizedBox(
          width: 200,
          height: 200,
          child: SvgPicture.asset('assets/face_scan_reticle.svg'),
        ),
        validated ? const Text('<Validated>') : const Text('<Pending>'),
        ElevatedButton(
          onPressed: _onValidated,
          child: const Text('Mark Complete'),
        ),
      ]),
    );
  }

  void _onValidated() {
    setState(() {
      logger.info('Marking face scan as validated.');
      validated = true;
      widget.onValidated.call();
    });
  }
}

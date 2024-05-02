import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class VideoCallWidget extends StatefulWidget {
  VideoCallWidget({
    super.key,
    required this.onHangup,
  });

  final Function onHangup;

  @override
  State<StatefulWidget> createState() {
    return VideoCallWidgetState();
  }
}

class VideoCallWidgetState extends State<VideoCallWidget> {
  final Logger logger = Logger('VideoCallWidget');
  bool completed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(children: [
        const Text('Video Call'),
        SizedBox(
          width: 200,
          height: 260,
          child: Image.asset('video_call_placeholder.png'),
        ),
        completed ? const Text('<Completed>') : const Text('<In Progress>'),
        ElevatedButton(
          onPressed: _onHangUp,
          child: const Text('Hang Up'),
        ),
      ]),
    );
  }

  void _onHangUp() {
    setState(() {
      logger.info('Marking video call as completed.');
      completed = true;
      widget.onHangup.call();
    });
  }
}

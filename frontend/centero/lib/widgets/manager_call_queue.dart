import 'dart:async';
import 'package:centero/services/backend.dart';
import 'package:centero/services/devutil.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class ManagerCallQueue extends StatefulWidget {
  const ManagerCallQueue({
    super.key,
  });

  @override
  State<ManagerCallQueue> createState() => _ManagerCallQueueState();
}

class _ManagerCallQueueState extends State<ManagerCallQueue> {
  static const refreshDelay = Duration(seconds: 30);

  final Logger logger = Logger('Manager.CallQueue');

  List<QueuedUserInfo> queue = [];
  Timer refreshTimer = Timer(refreshDelay, () {});

  @override
  void initState() {
    super.initState();
    // refreshTimer = Timer.periodic(refreshDelay, (timer) => fetchLatestQueue());
    fetchLatestQueue();
  }

  @override
  void dispose() {
    refreshTimer.cancel();
    super.dispose();
  }

  void showPopup(text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  void fetchLatestQueue() async {
    final newQueue = await Backend.getCallQueue(logInfo: false);

    setState(() {
      if (newQueue == null) {
        queue.clear();
      } else {
        queue = newQueue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Call Queue'),
        DevUtil.buildButton('Fetch', fetchLatestQueue),
        DevUtil.buildTextBlob(queue.map((e) => e.userid)),
      ],
    );
  }
}

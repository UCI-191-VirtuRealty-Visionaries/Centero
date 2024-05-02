import 'dart:async';
import 'package:centero/services.dart';
import 'package:centero/services/backend_service.dart';
import 'package:centero/util/dev_util.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class ManagerAvailableStaff extends StatefulWidget {
  const ManagerAvailableStaff({
    super.key,
  });

  @override
  State<ManagerAvailableStaff> createState() => _ManagerAvailableStaffState();
}

class _ManagerAvailableStaffState extends State<ManagerAvailableStaff> {
  static const refreshDelay = Duration(seconds: 30);

  final Logger logger = Logger('Manager.AvailableStaff');

  List<ManagerInfo> managers = [];
  Timer refreshTimer = Timer(refreshDelay, () {});

  @override
  void initState() {
    super.initState();
    // refreshTimer = Timer.periodic(refreshDelay, (timer) => fetchLatestData());
    fetchLatestData();
  }

  @override
  void dispose() {
    refreshTimer.cancel();
    super.dispose();
  }

  void fetchLatestData() async {
    final cur = await Services.backend.getAvailableManagers();
    logger.fine('New data $cur');

    setState(() {
      managers = cur;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Available Staff'),
        DevUtil.buildButton('Fetch', fetchLatestData),
        DevUtil.buildTextBlob(managers.map((e) => e.name)),
      ],
    );
  }
}

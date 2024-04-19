import 'package:centero/widgets/admin_appbar.dart';
import 'package:centero/widgets/admin_call_queue.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ----- App Bar -----

    final appBar = PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: AdminAppBar(),
    );

    // ----- Widgets -----

    final callQueue = AdminCallQueue();

    // ----- Columns -----

    final col1 = Column(
      children: [
        callQueue,
      ],
    );

    final col2 = Column(
      children: [
        Text('...'),
      ],
    );

    final col3 = Column(
      children: [
        Text('...'),
      ],
    );

    // ----- Structure -----

    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [col1, col2, col3],
        ),
      ),
    );
  }
}


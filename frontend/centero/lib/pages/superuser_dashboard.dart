import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class PageSuperuserDashboard extends StatefulWidget {
  PageSuperuserDashboard({super.key});

  @override
  State<PageSuperuserDashboard> createState() => _PageSuperuserDashboardState();
}

class _PageSuperuserDashboardState extends State<PageSuperuserDashboard> {
  Logger logger = Logger('SuperUser');

  void resetDatabase() {
    logger.warning('!!! Resetting the database !!!');
  }

  @override
  Widget build(BuildContext context) {
    // ----- App Bar -----

    final appBar = AppBar(
      title: Text('/sudo'),
      backgroundColor: Color.fromARGB(255, 214, 136, 34),
      foregroundColor: Colors.white,
    );

    // ----- Widgets -----

    final btnReset = TextButton(
      onPressed: resetDatabase,
      child: Row(children: [
        Icon(Icons.delete),
        Text('Reset Database'),
      ]),
    );

    final formCreateUser = Column(
      children: [
        Text('Create User'),
        Text('(wip)'),
      ],
    );

    // ----- Columns -----

    final col1 = Column(
      children: [
        btnReset,
      ],
    );

    final col2 = Column(
      children: [
        formCreateUser,
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

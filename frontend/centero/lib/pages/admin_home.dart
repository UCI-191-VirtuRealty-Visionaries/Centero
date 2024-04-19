import 'package:centero/services/backend.dart';
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

    final loginButton = Column(
      children: [
        Text('Login Tools'),
        TextButton(
            onPressed: () {
              Backend.authManager(
                  company: 'UC Irvine', username: 'mvp_user', password: '1234');
            },
            child: Text('Log in as mvp_user')),
      ],
    );

    // ----- Columns -----

    final col1 = Column(
      children: [
        loginButton,
      ],
    );

    final col2 = Column(
      children: [
        callQueue,
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

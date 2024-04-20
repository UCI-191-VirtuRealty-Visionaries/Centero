import 'package:centero/services/backend.dart';
import 'package:centero/services/devutil.dart';
import 'package:centero/widgets/admin_appbar.dart';
import 'package:centero/widgets/admin_call_queue.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

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

    final logoutButton = DevUtil.buildButtonStack(
      'Logout Tools',
      'Log out',
      () {
        Logger('AdminHome').info('Signed out');
        FirebaseAuth.instance.signOut();
      },
    );

    final loginButton = DevUtil.buildButtonStack(
      'Logout Tools',
      'Log in as mvp_user',
      () {
        Backend.authManager(
            company: 'UC Irvine', username: 'mvp_user', password: '1234');
      },
    );

    // ----- Columns -----

    final col1 = Column(
      children: [
        loginButton,
        logoutButton,
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

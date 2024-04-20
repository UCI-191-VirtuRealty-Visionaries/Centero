import 'package:centero/services/backend.dart';
import 'package:centero/services/devutil.dart';
import 'package:centero/widgets/admin_appbar.dart';
import 'package:centero/widgets/admin_available_staff.dart';
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
      preferredSize: Size.fromHeight(51),
      child: AdminAppBar(),
    );

    // ----- Widgets -----

    final logoutButton = DevUtil.buildButtonStack(
      'Logout Tools',
      'Log out',
      () async {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await Backend.removeManagerFromAvailableStaff(user.uid);
        }
        await FirebaseAuth.instance.signOut();
        Logger('AdminHome').info('Signed out');
      },
    );

    final loginButton = DevUtil.buildButtonStack(
      'Login Tools',
      'Log in as mvp_user',
      () async {
        await Backend.authenticateManager(
          company: 'UC Irvine',
          username: 'mvp_user',
          password: '1234',
        );

        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await Backend.addManagerToAvailableStaff(user.uid);
        }
      },
    );

    final badLoginButton = DevUtil.buildButtonStack(
      'Error Check Tools Tools',
      'Try log in as mvp_user',
      () {
        Backend.authenticateManager(
          company: 'UC Irvine',
          username: 'mvp_user',
          password: '12345',
        );
      },
    );

    final callQueue = AdminCallQueue();

    final availableStaff = AdminAvailableStaff();

    // ----- Columns -----

    final col1 = Column(
      children: [
        loginButton,
        logoutButton,
        badLoginButton,
      ],
    );

    final col2 = Column(
      children: [
        callQueue,
        availableStaff,
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

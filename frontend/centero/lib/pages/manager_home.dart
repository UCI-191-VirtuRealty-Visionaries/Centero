import 'package:centero/services.dart';
import 'package:centero/util/dev_util.dart';
import 'package:centero/widgets/manager_appbar.dart';
import 'package:centero/widgets/manager_available_staff.dart';
import 'package:centero/widgets/manager_call_queue.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class ManagerHomePage extends StatelessWidget {
  const ManagerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ----- App Bar -----

    final appBar = PreferredSize(
      preferredSize: Size.fromHeight(51),
      child: ManagerAppBar(),
    );

    // ----- Widgets -----

    final logoutButton = DevUtil.buildButtonStack(
      'Logout Tools',
      'Log out',
      () async {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await Services.backend.removeManagerFromAvailableStaff(user.uid);
        }
        await FirebaseAuth.instance.signOut();
        Logger('ManagerHome').info('Signed out');
      },
    );

    final loginButton = DevUtil.buildButtonStack(
      'Login Tools',
      'Log in as mvp_user',
      () async {
        await Services.backend.authenticateManager(
          company: 'UC Irvine',
          username: 'mvp_user',
          password: '1234',
        );

        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await Services.backend.addManagerToAvailableStaff(user.uid);
        }
      },
    );

    final badLoginButton = DevUtil.buildButtonStack(
      'Error Check Tools Tools',
      'Try log in as mvp_user',
      () {
        Services.backend.authenticateManager(
          company: 'UC Irvine',
          username: 'mvp_user',
          password: '12345',
        );
      },
    );

    final callQueue = ManagerCallQueue();

    final availableStaff = ManagerAvailableStaff();

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

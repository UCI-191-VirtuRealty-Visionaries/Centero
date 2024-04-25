import 'dart:async';
import 'package:centero/services/backend.dart';
import 'package:centero/subwidgets/manager_subwidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class ManagerUserProfile extends StatefulWidget {
  ManagerUserProfile({super.key});

  @override
  State<ManagerUserProfile> createState() => _ManagerUserProfileState();
}

class _ManagerUserProfileState extends State<ManagerUserProfile> {
  ManagerInfo? info;
  StreamSubscription? authListener;
  final logger = Logger('Manager.UserProfile');

  @override
  void initState() {
    super.initState();
    authListener =
        FirebaseAuth.instance.authStateChanges().listen(onAuthStateChanged);
  }

  @override
  void dispose() {
    super.dispose();
    authListener?.cancel();
  }

  void onAuthStateChanged(User? user) async {
    if (user == null) {
      setState(() {
        info = null;
      });
      logger.info('Cleared user profile info');
      return;
    }

    final newProfile = await Backend.getManagerProfile(user.uid);

    setState(() {
      info = newProfile;
    });
    logger.info('Added new user profile data');
  }

  @override
  Widget build(BuildContext context) {
    final subwidget = ManagerUserProfileSubwidgets(context: context);

    if (FirebaseAuth.instance.currentUser == null) {
      return subwidget.buildUserProfileLoggedOut();
    }

    return subwidget.buildUserProfileActive(
      username: info?.name ?? 'Unknown',
      userStatus: 'Online',
    );
  }
}

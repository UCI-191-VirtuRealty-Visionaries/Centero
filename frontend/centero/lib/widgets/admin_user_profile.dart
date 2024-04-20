import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminUserProfile extends StatefulWidget {
  AdminUserProfile({super.key});

  @override
  State<AdminUserProfile> createState() => _AdminUserProfileState();
}

class _AdminUserProfileState extends State<AdminUserProfile> {
  String username = '';
  StreamSubscription? authListener;

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
        username = '';
      });
    }

    if (user != null) {
      final info = await FirebaseFirestore.instance
          .collection('ManagerProfiles')
          .doc(user.uid)
          .get();

      final newUsername = info.data()?['name'];

      setState(() {
        username = newUsername;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      return _SubwidgetLoggedOut();
    }

    return _SubwidgetActive(
      userName: username,
      userStatus: 'Online',
    );
  }
}

// ==================================================
// Subwidgets
// ==================================================

class _SubwidgetActive extends StatelessWidget {
  const _SubwidgetActive({
    required this.userName,
    required this.userStatus,
  });

  final String userName;
  final String userStatus;

  @override
  Widget build(BuildContext context) {
    final name = Text(userName);
    final status = Text(userStatus);

    final avatar = CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage('avatar_admin_generic.png'),
      child: Text(userName.characters.firstOrNull ?? ''),
    );

    return Row(
      children: [
        Column(children: [name, status]),
        avatar,
      ],
    );
  }
}

class _SubwidgetLoggedOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('(Logged Out)');
  }
}

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
  String username = 'Unknown';
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
    var newUsername = '(hidden)';

    // if (user != null) {
    //   final info = await FirebaseFirestore.instance
    //       .collection('Users')
    //       .doc(user.uid)
    //       .get();
    //   newUsername = info.data()?['name'] ?? '(hidden)';
    // }

    setState(() {
      if (user == null) {
        username = 'Unknown';
      } else {
        username = newUsername;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final name = Text(username);
    final status = Text('Online');

    final profile = CircleAvatar(
      radius: 50,
      // foregroundImage: Image.asset('profile_austin.png'),
    );

    return Row(
      children: [
        Column(children: [name, status]),
        profile,
      ],
    );
  }
}

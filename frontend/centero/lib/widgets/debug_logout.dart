import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DebugLogOut extends StatefulWidget {
  @override
  State<DebugLogOut> createState() => _DebugLogOutState();
}

class _DebugLogOutState extends State<DebugLogOut> {
  late StreamSubscription<User?> authSubscription;

  @override
  void initState() {
    super.initState();
    authSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      return Text('(Not logged in)');
    } else {
      return FilledButton.tonal(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
        },
        child: Text('Log Out'),
      );
    }
  }
}

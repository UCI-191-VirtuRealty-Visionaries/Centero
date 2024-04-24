import 'package:centero/services/service_base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavUtil extends ServiceBase {
  NavUtil({
    super.name = 'NavUtil',
  });

  void resetToWelcome(BuildContext context) {
    logger.info('Returning to welcome screen.');
    FirebaseAuth.instance.signOut();
    GoRouter.of(context).go('/');
  }

  void next(BuildContext context, Widget page) {
    logger.fine('Moving to page $page');
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}

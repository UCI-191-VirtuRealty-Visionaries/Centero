import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

class NavService {
  final logger = Logger('Service.Nav');

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

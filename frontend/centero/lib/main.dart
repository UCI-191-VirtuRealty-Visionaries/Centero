import 'package:centero/routes.dart';
import 'package:centero/global_config.dart';
import 'package:centero/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:url_strategy/url_strategy.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: firebaseOptionsWeb);

  if (GlobalConfig.isDevMode) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
    FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }

  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((LogRecord record) {
    final timeStr = DateFormat('kk:mm:ss').format(record.time);
    print(
        '[$timeStr] [${record.level.name}] [${record.loggerName}] ${record.message}');
  });

  setPathUrlStrategy();
  runApp(const MyApp());
  Services.initialize();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GoRouter _createRouter() {
    final routes = <RouteBase>[];

    routes.addAll(PublicRouteConfig.routes);
    routes.addAll(PublicRouteConfig.redirects);

    if (GlobalConfig.isDevMode) {
      routes.addAll(DevRouteConfig.routes);
      routes.addAll(DevRouteConfig.redirects);
    }

    return GoRouter(
      initialLocation: '/',
      routes: routes,
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _createRouter(),
      title: 'Centero',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF47A92C)),
        useMaterial3: true,
      ),
    );
  }
}

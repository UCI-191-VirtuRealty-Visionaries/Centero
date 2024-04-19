import 'package:centero/pages/admin_home.dart';
import 'package:centero/pages/superuser_home.dart';
import 'package:centero/pages/widget_preview.dart';
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
import 'pages/home.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  if (const String.fromEnvironment('mode') == 'dev') {
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
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GoRouter _createRouter() {
    final routes = <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/admin',
        builder: (context, state) => AdminHomePage(),
      ),
    ];

    if (const String.fromEnvironment('mode') == 'dev') {
      routes.add(
        GoRoute(
          path: '/widgets',
          builder: (context, state) => WidgetPreviewPage(),
        ),
      );

      routes.add(
        GoRoute(
          path: '/sudo',
          builder: (context, state) => SuperUserHomePage(),
        ),
      );
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

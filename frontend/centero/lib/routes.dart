import 'package:centero/pages/manager_home.dart';
import 'package:centero/pages/home.dart';
import 'package:centero/pages/superuser_home.dart';
import 'package:centero/pages/debug_widget_preview.dart';
import 'package:centero/pages/welcome_home.dart';
import 'package:go_router/go_router.dart';

// ==================================================
// Public
// ==================================================

class PublicRouteConfig {
  static final routes = <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/manager',
      builder: (context, state) => ManagerHomePage(),
    ),
  ];

  static final redirects = <RouteBase>[
    GoRoute(
      path: '/m',
      redirect: (context, state) => '/manager',
    ),
  ];
}

// ==================================================
// Development Only
// ==================================================

class DevRouteConfig {
  static final routes = <RouteBase>[
    GoRoute(
      path: '/widgets',
      builder: (context, state) => DebugWidgetPreviewPage(),
    ),
    GoRoute(
      path: '/sudo',
      builder: (context, state) => SuperUserHomePage(),
    ),
    GoRoute(
      path: '/newhome',
      builder: (context, state) => PageWelcomeHome(),
    ),
  ];

  static final redirects = <RouteBase>[
    GoRoute(
      path: '/w',
      redirect: (context, state) => '/widgets',
    ),
    GoRoute(
      path: '/sd',
      redirect: (context, state) => '/sudo',
    ),
  ];
}

import 'package:centero/pages/admin_home.dart';
import 'package:centero/pages/home.dart';
import 'package:centero/pages/superuser_home.dart';
import 'package:centero/pages/widget_preview.dart';
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
      path: '/admin',
      builder: (context, state) => AdminHomePage(),
    ),
  ];

  static final redirects = <RouteBase>[
    GoRoute(
      path: '/a',
      redirect: (context, state) => '/admin',
    ),
    GoRoute(
      path: '/pm',
      redirect: (context, state) => '/admin',
    ),
    GoRoute(
      path: '/manager',
      redirect: (context, state) => '/admin',
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
      builder: (context, state) => WidgetPreviewPage(),
    ),
    GoRoute(
      path: '/sudo',
      builder: (context, state) => SuperUserHomePage(),
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

import 'package:centero/pages/debug_portal.dart';
import 'package:centero/pages/info_age.dart';
import 'package:centero/pages/info_non_resident_role_selection.dart';
import 'package:centero/pages/info_role_selection.dart';
import 'package:centero/pages/manager_dashboard.dart';
import 'package:centero/pages/welcome_home.dart';
import 'package:centero/pages/superuser_dashboard.dart';
import 'package:centero/pages/debug_widget_preview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ==================================================
// Public
// ==================================================

class PublicRouteConfig {
  static final routes = <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => PageWelcomeHome(),
    ),
    GoRoute(
      path: '/manager',
      builder: (context, state) => PageManagerDashboard(),
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
      builder: (context, state) => PageDebugWidgetPreviewPage(),
    ),
    GoRoute(
      path: '/sudo',
      builder: (context, state) => PageSuperuserDashboard(),
    ),
    GoRoute(
      path: '/p/:name',
      builder: (context, state) => _getPage(state.pathParameters['name'] ?? ''),
    )
  ];

  static Widget _getPage(String name) {
    switch (name) {
      case 'WelcomeHome': return PageWelcomeHome();
      case 'InfoAge': return PageInfoAge();
      case 'InfoRoleSelection': return PageInfoRoleSelection();
      case 'InfoNonResidentRoleSelection': return PageInfoNonResidentRoleSelection();
      default: return PageDebugPortal();
    }
  }

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

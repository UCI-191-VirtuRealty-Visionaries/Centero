import 'dart:async';
import 'package:centero/services.dart';
import 'package:centero/services/backend_service.dart';
import 'package:centero/widgets/button_primary.dart';
import 'package:centero/widgets/debug_logout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logging/logging.dart';

class MockFaceScanWidget extends StatefulWidget {
  MockFaceScanWidget({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return MockFaceScanWidgetState();
  }
}

class MockFaceScanWidgetState extends State<MockFaceScanWidget> {
  final Logger logger = Logger('FaceScanWidget_MOCK');
  late StreamSubscription<User?> authSubscription;
  ResidentInfo? info;

  @override
  void initState() {
    super.initState();
    authSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user != null) {
        info = await Services.backend.getResidentProfile(user.uid);
      } else {
        info = null;
      }
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
    return _MockFaceScanSubwidgets.buildMain(
      authenticationSuccessful: FirebaseAuth.instance.currentUser != null,
      loginTip: 'Login as Austin',
      onLoginButton: () => login(),
      userInfo: info != null
          ? '${info!.name} at ${info!.property}'
          : '(no user info)',
    );
  }

  void login() {
    Services.backend.authenticateResidentManual(
      username: 'austin',
      password: 'austin',
    );
  }
}

// ----- Subwidgets -----

class _MockFaceScanSubwidgets {
  static Widget buildMain({
    required bool authenticationSuccessful,
    required String loginTip,
    required void Function() onLoginButton,
    required String userInfo,
  }) {
    // ----- Widgets ----
    final header = Text('Mock Face Scan');

    final image = SizedBox(
      width: 200,
      height: 200,
      child: SvgPicture.asset('face_scan_reticle.svg'),
    );

    final authStatusTooltip = authenticationSuccessful
        ? const Text('<Authenticated>')
        : const Text('<Waiting>');

    final info = Text(userInfo);

    final btnLogin = ButtonPrimary(
      onPressed: onLoginButton,
      child: Text(loginTip),
    );

    final btnLogout = DebugLogOut();

    // ----- Styling -----

    final decorationFilled = BoxDecoration(
      color: Color(0xffeeeeee),
      borderRadius: BorderRadius.circular(8.0),
    );

    // ----- Structure -----

    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: decorationFilled,
      child: Column(
        children: [
          header,
          image,
          authStatusTooltip,
          info,
          btnLogin,
          btnLogout,
        ],
      ),
    );
  }
}

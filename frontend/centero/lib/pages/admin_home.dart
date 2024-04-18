import 'package:centero/widgets/admin_appbar.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ----- App Bar -----

    final appBar = PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: AdminAppBar(),
    );

    // ----- Widgets -----

    // ----- Structure -----

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: const Text('Admin Dashboard Contents'),
      ),
    );
  }
}

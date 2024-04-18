import 'package:centero/widgets/button_danger.dart';
import 'package:centero/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'role_selection.dart';

class AgePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ----- Widgets -----

    final headerText = Text(
      'You must be at least 18 to proceed.',
      style: TextStyle(
        fontFamily: 'Montserrat',
      ),
    );

    final btnProceed = ButtonPrimary(
      onPressed: () {},
      child: Text('I am 18+'),
    );

    final btnReturn = ButtonDanger(
      onPressed: () {},
      child: Text('I am NOT 18+'),
    );

    final navigateToNextPage = ElevatedButton(
      child: Text('Go to role selection page'),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RoleSelectionPage()),
        );
      },
    );

    // ----- Structure -----

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            headerText,
            btnProceed,
            btnReturn,
            navigateToNextPage,
          ],
        ),
      ),
    );
  }
}

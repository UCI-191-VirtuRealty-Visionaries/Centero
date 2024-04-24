import 'package:centero/widgets/manager_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logging/logging.dart';

class ManagerAppBar extends StatefulWidget {
  ManagerAppBar({super.key});

  @override
  State<ManagerAppBar> createState() => _ManagerAppBarState();
}

class _ManagerAppBarState extends State<ManagerAppBar> {
  Logger logger = Logger('Manager.AppBar');

  @override
  Widget build(BuildContext context) {
    // ----- Styling -----

    const linkStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      
      fontFamily: 'Josefin',
    );

    // ----- Logo -----

    final logo = SizedBox(
      height: 40,
      width: 40,
      child: SvgPicture.asset('centero_logo_white.svg'),
    );

    // ----- Links -----

    final linkCallLog = TextButton(
      onPressed: () {
        logger.info('Pressed call log.');
      },
      child: Text(
        'CALL LOG',
        style: linkStyle,
      ),
    );

    final linkRecordings = TextButton(
      onPressed: () {
        logger.info('Pressed recordings.');
      },
      child: Text(
        'RECORDINGS',
        style: linkStyle,
      ),
    );

    final links = Row(
      children: [
        linkCallLog,
        linkRecordings,
      ],
    );

    // ----- User -----

    final user = ManagerUserProfile();

    // ----- Scaffold -----

    return Container(
      color: Colors.green,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          logo,
          links,
          user,
        ],
      ),
    );
  }
}

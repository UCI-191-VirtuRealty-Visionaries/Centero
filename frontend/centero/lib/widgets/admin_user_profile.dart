import 'package:flutter/material.dart';

class AdminUserProfile extends StatelessWidget {
  AdminUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final name = Text('UserName');
    final status = Text('Online');

    final profile = CircleAvatar(
      radius: 50,
      // foregroundImage: Image.asset('profile_austin.png'),
    );

    return Row(
      children: [
        Column(children: [name, status]),
        profile,
      ],
    );
  }
}

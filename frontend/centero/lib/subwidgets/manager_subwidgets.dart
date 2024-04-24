import 'package:flutter/material.dart';

class ManagerSubwidgets {
  // ==================================================
  // Manager - User Profile
  // ==================================================

  static buildUserProfileActive({
    required String username,
    required String userStatus,
  }) {
    final name = Text(username);
    final status = Text(userStatus);

    final avatar = CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage('avatar_admin_generic.png'),
      child: Text(username.characters.firstOrNull ?? ''),
    );

    return Row(
      children: [
        Column(children: [name, status]),
        avatar,
      ],
    );
  }

  static buildUserProfileLoggedOut() {
    return Text('(Logged Out)');
  }
}

import 'package:centero/subwidgets/subwidget_factory_base.dart';
import 'package:centero/widgets/manager_user_profile.dart';
import 'package:flutter/material.dart';

// ==================================================
// Manager - User Profile
// ==================================================

class ManagerUserProfileSubwidgets
    extends SubwidgetFactory<ManagerUserProfile> {
  ManagerUserProfileSubwidgets({
    required super.context,
  });

  Widget buildUserProfileActive({
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

  Widget buildUserProfileLoggedOut() {
    return Text('(Logged Out)');
  }
}
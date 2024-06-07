import 'package:flutter/material.dart';

class LogoFooter extends StatelessWidget {
  LogoFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final logo = SizedBox(
      width: 3000,
      height: 3000,
      child: Image.asset('assets/centerologogreen.png'),
    );

    return Row(
      children: [logo],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoMinimal extends StatelessWidget {
  LogoMinimal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 120,
        height: 120,
        child: SvgPicture.asset('assets/centero_logo.svg'),
      ),
    );
  }
}

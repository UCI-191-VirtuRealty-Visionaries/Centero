import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoFooter extends StatelessWidget {
  LogoFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final logo = SizedBox(
      width: 64,
      height: 64,
      child: SvgPicture.asset('assets/centero_logo.svg'),
    );

    const topTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w300,
      fontSize: 16,
      fontFamily: 'Montserrat',
    );

    const bottomTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w300,
      fontSize: 30,
      fontFamily: 'Montserrat',
    );

    final text = Column(
      children: [
        const Text('POWERED BY', style: topTextStyle),
        const Text('CENTERO', style: bottomTextStyle),
      ],
    );

    return Row(
      children: [logo, SizedBox(width: 10), text],
    );
  }
}

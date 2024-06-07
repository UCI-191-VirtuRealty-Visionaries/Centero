import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

    // const topTextStyle = TextStyle(
    //   color: Colors.white,
    //   fontWeight: FontWeight.w300,
    //   fontSize: 16,
    //   fontFamily: 'Montserrat',
    // );

    // const bottomTextStyle = TextStyle(
    //   color: Colors.white,
    //   fontWeight: FontWeight.w300,
    //   fontSize: 30,
    //   fontFamily: 'Montserrat',
    // );

    // final text = Column(
    //   children: [
    //     const Text('POWERED BY', style: topTextStyle),
    //     const Text('CENTERO', style: bottomTextStyle),
    //   ],
    // );

    return Row(
      children: [logo],
    );
  }
}

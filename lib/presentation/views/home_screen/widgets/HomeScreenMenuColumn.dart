import 'package:flutter/material.dart';
import 'package:betchya/presentation/styles.dart';

class HomeScreenMenuColumn extends StatelessWidget {
  const HomeScreenMenuColumn(
      {Key? key,
      required this.screenHeight,
      required this.icon,
      required this.text})
      : super(key: key);

  final double screenHeight;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: screenHeight * .037,
        ),
        Text(
          text,
          style: menuLabel,
        ),
      ],
    );
  }
}

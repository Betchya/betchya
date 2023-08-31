import 'package:betchya/presentation/styles.dart';
import 'package:flutter/material.dart';

class HomeScreenMenuColumn extends StatelessWidget {
  const HomeScreenMenuColumn({
    super.key,
    required this.screenHeight,
    required this.icon,
    required this.text,
  });

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

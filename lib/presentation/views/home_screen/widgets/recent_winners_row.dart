import 'package:flutter/material.dart';

class RecentWinnersRow extends StatelessWidget {
  const RecentWinnersRow({
    super.key,
    required this.nameText,
    required this.moneyText,
  });
  final String nameText;
  final String moneyText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          nameText,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          moneyText,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

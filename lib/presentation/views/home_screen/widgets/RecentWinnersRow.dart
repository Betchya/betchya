import 'package:flutter/material.dart';

class RecentWinnersRow extends StatelessWidget {
  final String nameText;
  final String moneyText;

  const RecentWinnersRow(
      {Key? key, required this.nameText, required this.moneyText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          nameText,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          moneyText,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

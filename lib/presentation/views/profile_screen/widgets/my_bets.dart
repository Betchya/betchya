import 'package:betchya/presentation/views/sports_book_screen/widgets/bets_widget.dart';
import 'package:flutter/material.dart';

class MyBets extends StatelessWidget {
  const MyBets({super.key, required this.filter});
  final String filter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          '$filter Bets',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).maybePop(),
            icon: const Icon(
              Icons.close,
              color: Color(0xFFA0A0A0),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 5, 18, 5),
        child: BetsWidget(filter: filter),
      ),
    );
  }
}

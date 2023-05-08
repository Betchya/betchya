import 'package:betchya/presentation/views/sports_book_screen/widgets/BetsWidget.dart';
import 'package:flutter/material.dart';

class MyBets extends StatelessWidget {
  final String filter;
  MyBets({
    Key? key,
    required this.filter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "$filter Bets",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700),
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Navigator.of(context).maybePop(),
                icon: const Icon(
                  Icons.close,
                  color: Color(0xFFA0A0A0),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(18, 5, 18, 5),
          child: BetsWidget(filter: filter),
        ));
  }
}

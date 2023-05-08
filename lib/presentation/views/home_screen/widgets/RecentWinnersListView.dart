import 'package:flutter/material.dart';
import 'ListViewContainer.dart';
import 'RecentWinnersRow.dart';

class RecentWinnersListView extends StatefulWidget {
  @override
  _RecentWinnersListViewState createState() => _RecentWinnersListViewState();
}

class _RecentWinnersListViewState extends State<RecentWinnersListView> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * .20,
      margin: EdgeInsets.only(left: screenWidth * .043),
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListViewContainer(
                    offsetDy: .5,
                    blurRadius: 10,
                    imageUrl: 'assets/images/recent_winner_13.png'),
                RecentWinnersRow(
                  nameText: 'Kirsten - ',
                  moneyText: '\$11,328',
                ),
              ],
            );
          } else if (index == 1) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListViewContainer(
                    offsetDy: .5,
                    blurRadius: 10,
                    imageUrl: 'assets/images/recent_winner_12.png'),
                RecentWinnersRow(
                  nameText: 'Bhartiben - ',
                  moneyText: '\$11,012',
                ),
              ],
            );
          } else if (index == 2) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListViewContainer(
                    offsetDy: .5,
                    blurRadius: 10,
                    imageUrl: 'assets/images/recent_winner_11.png'),
                RecentWinnersRow(
                  nameText: 'Ed and Sally - ',
                  moneyText: '\$14,000',
                ),
              ],
            );
          } else if (index == 3) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListViewContainer(
                    offsetDy: .5,
                    blurRadius: 10,
                    imageUrl: 'assets/images/recent_winner_10.png'),
                RecentWinnersRow(
                  nameText: 'Courtney - ',
                  moneyText: '\$11,017',
                ),
              ],
            );
          }
          return Container();
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: screenWidth * .032,
          );
        },
      ),
    );
  }
}

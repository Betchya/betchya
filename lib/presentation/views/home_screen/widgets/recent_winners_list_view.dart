import 'package:betchya/presentation/views/home_screen/widgets/list_view_container.dart';
import 'package:betchya/presentation/views/home_screen/widgets/recent_winners_row.dart';
import 'package:flutter/material.dart';

class RecentWinnersListView extends StatefulWidget {
  const RecentWinnersListView({super.key});

  @override
  State<RecentWinnersListView> createState() => _RecentWinnersListViewState();
}

class _RecentWinnersListViewState extends State<RecentWinnersListView> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * .20,
      margin: EdgeInsets.only(left: screenWidth * .043),
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListViewContainer(
                  offsetDy: .5,
                  blurRadius: 10,
                  imageUrl: '',
                ),
                RecentWinnersRow(
                  nameText: 'Kirsten - ',
                  moneyText: r'$11,328',
                ),
              ],
            );
          } else if (index == 1) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListViewContainer(
                  offsetDy: .5,
                  blurRadius: 10,
                  imageUrl: '',
                ),
                RecentWinnersRow(
                  nameText: 'Bhartiben - ',
                  moneyText: r'$11,012',
                ),
              ],
            );
          } else if (index == 2) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListViewContainer(
                  offsetDy: .5,
                  blurRadius: 10,
                  imageUrl: '',
                ),
                RecentWinnersRow(
                  nameText: 'Ed and Sally - ',
                  moneyText: r'$14,000',
                ),
              ],
            );
          } else if (index == 3) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListViewContainer(
                  offsetDy: .5,
                  blurRadius: 10,
                  imageUrl: '',
                ),
                RecentWinnersRow(
                  nameText: 'Courtney - ',
                  moneyText: r'$11,017',
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

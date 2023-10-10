import 'package:betchya/presentation/views/home_screen/widgets/list_view_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventsHorizontalListView extends StatefulWidget {
  const EventsHorizontalListView({super.key});

  @override
  State<EventsHorizontalListView> createState() =>
      _EventsHorizontalListViewState();
}

class _EventsHorizontalListViewState extends State<EventsHorizontalListView> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * .17,
      margin: EdgeInsets.only(left: screenWidth * .043),
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const ListViewContainer(
              offsetDy: 4,
              blurRadius: 4,
              imageUrl: 'assets/images/star-gazing-gifts.png',
            );
          } else if (index == 1) {
            return const ListViewContainer(
              offsetDy: 4,
              blurRadius: 4,
              imageUrl: 'assets/images/star-gazing-gifts1.png',
            );
          } else if (index == 2) {
            return const ListViewContainer(
              offsetDy: 4,
              blurRadius: 4,
              imageUrl: 'assets/images/star-gazing-gifts2.png',
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

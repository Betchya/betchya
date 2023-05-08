import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ListViewContainer.dart';

class EventsHorizontalListView extends StatefulWidget {
  @override
  _EventsHorizontalListViewState createState() =>
      _EventsHorizontalListViewState();
}

class _EventsHorizontalListViewState extends State<EventsHorizontalListView> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * .17,
      margin: EdgeInsets.only(left: screenWidth * .043),
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          if (index == 0) {
            return ListViewContainer(
                offsetDy: 4,
                blurRadius: 4,
                imageUrl: 'assets/images/star-gazing-gifts.png');
          } else if (index == 1) {
            return ListViewContainer(
                offsetDy: 4,
                blurRadius: 4,
                imageUrl: 'assets/images/star-gazing-gifts1.png');
          } else if (index == 2) {
            return ListViewContainer(
                offsetDy: 4,
                blurRadius: 4,
                imageUrl: 'assets/images/star-gazing-gifts2.png');
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

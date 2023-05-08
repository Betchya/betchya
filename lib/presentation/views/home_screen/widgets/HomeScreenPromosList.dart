import 'package:betchya/presentation/views/home_screen/widgets/ListViewContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ListViewContainer.dart';

class HomeScreenPromosList extends StatefulWidget {
  @override
  _HomeScreenPromosListState createState() => _HomeScreenPromosListState();
}

class _HomeScreenPromosListState extends State<HomeScreenPromosList> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * .25,
      margin: EdgeInsets.only(left: screenWidth * .043),
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListViewContainer(
                    screenHeight: screenHeight * .172,
                    offsetDy: 6,
                    blurRadius: 5,
                    imageUrl: 'assets/images/promo_1.png'),
                SizedBox(
                  height: screenHeight * .02,
                ),
                Text(
                  'Host a Special Event!',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Are you in charge of planning an important \nconference, trade show meeting, or special event?',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            );
          } else if (index == 1) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListViewContainer(
                    screenHeight: screenHeight * .18,
                    offsetDy: .5,
                    blurRadius: 10,
                    imageUrl: 'assets/images/promo_2.png'),
                SizedBox(
                  height: screenHeight * .01,
                ),
                Text(
                  'Gift Shop',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'This one-of-a-kind shop specializes in products \ndesigned and made in the USA.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            );
          } else if (index == 2) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListViewContainer(
                    screenHeight: screenHeight * .172,
                    offsetDy: 6,
                    blurRadius: 5,
                    imageUrl: 'assets/images/promo_3.png'),
                SizedBox(
                  height: screenHeight * .02,
                ),
                Text(
                  'Plan a Trip to Grande Ronde, Oregon!',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'We invite you to visit Grande Ronde, only 65-mile \ndrive from Portland.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
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

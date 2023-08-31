import 'package:betchya/presentation/views/home_screen/widgets/list_view_container.dart';
import 'package:flutter/material.dart';

class BarsHorizontalListView extends StatefulWidget {
  const BarsHorizontalListView({super.key});

  @override
  State<BarsHorizontalListView> createState() => _BarsHorizontalListViewState();
}

class _BarsHorizontalListViewState extends State<BarsHorizontalListView> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * .298,
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
                const ListViewContainer(
                  offsetDy: .5,
                  blurRadius: 4,
                  imageUrl: 'assets/images/north-bar.png',
                ),
                SizedBox(
                  height: screenHeight * .02,
                ),
                const Text(
                  'North Bar',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Serving mixed drinks and beer on tap right in the \nheart '
                  'of the action.',
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
                const ListViewContainer(
                  offsetDy: .5,
                  blurRadius: 4,
                  imageUrl: 'assets/images/sips-hero.png',
                ),
                SizedBox(
                  height: screenHeight * .01,
                ),
                const Text(
                  'SIPS',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Enjoy your favorite glass of wine or try a new one! \nSips '
                  'has a special beverage for everyone.',
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
                const ListViewContainer(
                  offsetDy: .5,
                  blurRadius: 4,
                  imageUrl: 'assets/images/mountain-view-bar.png',
                ),
                SizedBox(
                  height: screenHeight * .01,
                ),
                const Text(
                  'Mountain View Bar',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Our great bar menu features burgers, buffalo wings, '
                  '\nnachos, NW micro-brews on tap.',
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

import 'package:betchya/presentation/views/home_screen/widgets/list_view_container.dart';
import 'package:flutter/material.dart';
// import 'ListViewContainer.dart';

class HomeScreenPromosList extends StatefulWidget {
  const HomeScreenPromosList({super.key});

  @override
  State<HomeScreenPromosList> createState() => _HomeScreenPromosListState();
}

class _HomeScreenPromosListState extends State<HomeScreenPromosList> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
                  imageUrl: '',
                ),
                SizedBox(
                  height: screenHeight * .02,
                ),
                const Text(
                  'Host a Special Event!',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Are you in charge of planning an important \nconference, '
                  'trade show meeting, or special event?',
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
                  imageUrl: '',
                ),
                SizedBox(
                  height: screenHeight * .01,
                ),
                const Text(
                  'Gift Shop',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'This one-of-a-kind shop specializes in products \ndesigned '
                  'and made in the USA.',
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
                  imageUrl: '',
                ),
                SizedBox(
                  height: screenHeight * .02,
                ),
                const Text(
                  'Plan a Trip to Grande Ronde, Oregon!',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'We invite you to visit Grande Ronde, only 65-mile \ndrive '
                  'from Portland.',
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

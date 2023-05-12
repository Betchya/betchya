import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/points/points_cubit.dart';
import '../../rewards/rewards_screen.dart';
import 'NameWidget.dart';

class UserRewardsWidget extends StatelessWidget {
  const UserRewardsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      height: screenHeight * .375,
      color: const Color(0xff2C1D57),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FirstNameWidget(prefix: "Welcome, "),
              Container(
                height: screenHeight * .04,
                width: screenWidth * .23,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xff00B498),
                ),
                child: TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RewardsScreen())),
                  child: const Text(
                    'Redeem',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * .04, bottom: screenHeight * .01),
            child: const Text(
              'Points available',
              style: TextStyle(fontSize: 11, color: Color(0xffB2B2B4)),
            ),
          ),
          Row(
            children: [
              BlocBuilder<PointsCubit, int>(
                builder: (context, state) {
                  return Text(
                    '$state ',
                    style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  );
                },
              ),
              const Icon(
                Icons.star,
                color: Color(0xffFCCB00),
                size: 15,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 20),
            child: SizedBox(
              height: screenHeight * .024,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BlocBuilder<PointsCubit, int>(
                  builder: (context, state) {
                    final progress = state / 250;

                    return LinearProgressIndicator(
                      backgroundColor: const Color(0xffDADADA),
                      value: progress > 1 ? 1 : progress,
                      color: const Color(0xff00836E),
                    );
                  },
                ),
              ),
            ),
          ),
          const Text(
            'Get rewarded for simply playing your favorite games. '
            'Earn more points to reach the next tier for addtional '
            'benefits!',
            maxLines: 2,
            style: TextStyle(
              color: Color(0xffC4C4C4),
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 15),
            child: SizedBox(
              height: screenHeight * .04,
              child: _horizontalCategoryList(screenHeight, screenWidth),
            ),
          )
        ],
      ),
    );
  }

  ListView _horizontalCategoryList(double screenHeight, double screenWidth) {
    final listHeight = screenHeight * 0.04;

    return ListView.separated(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: const Color(0xFF94A3B8).withOpacity(0.50),
            ),
            child: IconButton(
              iconSize: 23,
              color: Colors.white,
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          );
        } else if (index == 1) {
          return Container(
            height: listHeight,
            width: screenWidth * .212,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(listHeight),
              color: const Color(0xFF94A3B8).withOpacity(0.50),
            ),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Details',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
          );
        } else if (index == 2) {
          return Container(
            height: listHeight,
            width: screenWidth * .212,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(listHeight),
              color: const Color(0xFF94A3B8).withOpacity(0.50),
            ),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Dining',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
          );
        } else if (index == 3) {
          return Container(
            height: listHeight,
            width: screenWidth * .212,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(listHeight),
              color: const Color(0xFF94A3B8).withOpacity(0.50),
            ),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Casino',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
          );
        } else if (index == 4) {
          return Container(
            height: listHeight,
            width: screenWidth * .212,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(listHeight),
              color: const Color(0xFF94A3B8).withOpacity(0.50),
            ),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Events',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
          );
        }
        return Container();
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          width: screenWidth * .032,
        );
      },
    );
  }
}

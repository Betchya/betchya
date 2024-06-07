import 'package:betchya/logic/games/game_category.dart';
import 'package:betchya/presentation/custom_icons.dart';
import 'package:betchya/presentation/views/profile_screen/widgets/my_bets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserRewardsWidget extends StatefulWidget {
  const UserRewardsWidget({super.key, required this.changeCategory});

  final void Function() changeCategory;

  @override
  State<UserRewardsWidget> createState() => _UserRewardsWidgetState();
}

class _UserRewardsWidgetState extends State<UserRewardsWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * .3,
      width: screenWidth,
      padding: const EdgeInsets.only(top: 10),
      color: const Color(0xff2C1D57),
      child: Column(
        children: [
          Stack(
            children: [
              Align(
                child: SizedBox(
                  width: screenWidth * .3,
                  child: const Icon(CustomIcons.betchyalogo, size: 55),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: screenHeight * .046,
                  width: screenWidth * .2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff00B498),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<MyBets>(
                          builder: (context) => const MyBets(filter: 'All'),
                        ),
                      );
                    },
                    child: const Text(
                      'My Bets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Popular',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Text(
                'All Sports ',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 17, 0, 0),
            child: SizedBox(
              height: screenHeight * .15,
              child: ListView.separated(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        SizedBox(
                          height: screenHeight * .09,
                          width: screenWidth * .15,
                          child: OutlinedButton(
                            onPressed: () {
                              gameCategory = '';
                              widget.changeCategory();
                            },
                            style: OutlinedButton.styleFrom(
                              shape: const CircleBorder(),
                              side: const BorderSide(
                                width: 2,
                                color: Colors.white,
                              ),
                            ),
                            child: const Icon(
                              Icons.camera,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'Live',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    );
                  } else if (index == 1) {
                    return Column(
                      children: [
                        SizedBox(
                          height: screenHeight * .09,
                          width: screenWidth * .15,
                          child: OutlinedButton(
                            onPressed: () {
                              gameCategory = 'EPL';
                              widget.changeCategory();
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: gameCategory == 'EPL'
                                  ? Colors.white
                                  : const Color(0xff2C1D57),
                              shape: const CircleBorder(),
                              side: const BorderSide(
                                width: 2,
                                color: Colors.white,
                              ),
                            ),
                            child: SvgPicture.asset(
                              'assets/logos/epl/epl_logo.svg',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'EPL',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    );
                  } else if (index == 2) {
                    return Column(
                      children: [
                        SizedBox(
                          height: screenHeight * .09,
                          width: screenWidth * .15,
                          child: OutlinedButton(
                            onPressed: () {
                              gameCategory = 'MLB';
                              widget.changeCategory();
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: gameCategory == 'MLB'
                                  ? Colors.white
                                  : const Color(0xff2C1D57),
                              shape: const CircleBorder(),
                              side: const BorderSide(
                                width: 2,
                                color: Colors.white,
                              ),
                            ),
                            child: SvgPicture.asset(
                              'assets/logos/mlb/mlb_logo.svg',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'MLB',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    );
                  } else if (index == 3) {
                    return Column(
                      children: [
                        SizedBox(
                          height: screenHeight * .09,
                          width: screenWidth * .15,
                          child: OutlinedButton(
                            onPressed: () {
                              gameCategory = 'NBA';
                              widget.changeCategory();
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: gameCategory == 'NBA'
                                  ? Colors.white
                                  : const Color(0xff2C1D57),
                              shape: const CircleBorder(),
                              side: const BorderSide(
                                width: 2,
                                color: Colors.white,
                              ),
                            ),
                            child: SvgPicture.asset(
                              'assets/logos/nba/nba_logo.svg',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'NBA',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    );
                  } else if (index == 4) {
                    return Column(
                      children: [
                        SizedBox(
                          height: screenHeight * .09,
                          width: screenWidth * .15,
                          child: OutlinedButton(
                            onPressed: () {
                              gameCategory = 'NFL';
                              widget.changeCategory();
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: gameCategory == 'NFL'
                                  ? Colors.white
                                  : const Color(0xff2C1D57),
                              shape: const CircleBorder(),
                              side: const BorderSide(
                                width: 2,
                                color: Colors.white,
                              ),
                            ),
                            child: SvgPicture.asset(
                              'assets/logos/nfl/nfl_logo.svg',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'NFL',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    );
                  } else if (index == 5) {
                    return Column(
                      children: [
                        SizedBox(
                          height: screenHeight * .09,
                          width: screenWidth * .15,
                          child: OutlinedButton(
                            onPressed: () {
                              gameCategory = 'ML5';
                              widget.changeCategory();
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: gameCategory == 'ML5'
                                  ? Colors.white
                                  : const Color(0xff2C1D57),
                              shape: const CircleBorder(),
                              side: const BorderSide(
                                width: 2,
                                color: Colors.white,
                              ),
                            ),
                            child: Icon(
                              Icons.sports_esports,
                              color: gameCategory == 'ML5'
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'ML5',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    );
                  } else if (index == 6) {
                    return Column(
                      children: [
                        SizedBox(
                          height: screenHeight * .09,
                          width: screenWidth * .15,
                          child: OutlinedButton(
                            onPressed: () {
                              gameCategory = 'Esport';
                              widget.changeCategory();
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: gameCategory == 'Esport'
                                  ? Colors.white
                                  : const Color(0xff2C1D57),
                              shape: const CircleBorder(),
                              side: const BorderSide(
                                width: 2,
                                color: Colors.white,
                              ),
                            ),
                            child: Icon(
                              Icons.sports_gymnastics,
                              color: gameCategory == 'Esport'
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'Esport',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
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
            ),
          ),
        ],
      ),
    );
  }
}

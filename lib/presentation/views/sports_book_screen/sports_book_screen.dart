import 'package:betchya/logic/games/game_category.dart';
import 'package:betchya/presentation/views/sports_book_screen/widgets/games_widget.dart';
import 'package:betchya/presentation/views/sports_book_screen/widgets/user_rewards_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SportsbookScreen extends StatefulWidget {
  const SportsbookScreen({super.key});

  @override
  State<SportsbookScreen> createState() => _SportsbookScreenState();
}

class _SportsbookScreenState extends State<SportsbookScreen> {
  int activeIndex = 0;
  List<Image> urlImages = [
    const Image(
      image: AssetImage('assets/images/promo_3.png'),
      fit: BoxFit.fill,
    ),
    const Image(
      image: AssetImage('assets/images/promo_1.png'),
      fit: BoxFit.fill,
    ),
    const Image(
      image: AssetImage('assets/images/promo_2.png'),
      fit: BoxFit.fill,
    ),
  ];
  String currentCategory = '';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: const Color(0xff2C1D57),
              toolbarHeight: screenHeight * .3,
              title: UserRewardsWidget(
                changeCategory: () {
                  setState(() {
                    currentCategory = gameCategory;
                  });
                },
              ),
              automaticallyImplyLeading: false,
              floating: true,
              snap: true,
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * .015,
              ),
              SizedBox(
                height: screenHeight * .17,
                width: screenWidth * .9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: const Image(
                    image: AssetImage('assets/images/star-gazing-gifts2.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * .015,
              ),
              Center(
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        viewportFraction: 1,
                        height: screenHeight * .17,
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                      ),
                      itemCount: urlImages.length,
                      itemBuilder: (context, index, realIndex) {
                        final urlImage = urlImages[index];
                        return SizedBox(
                          width: screenWidth * .9,
                          // color: Colors.grey,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: urlImage,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: urlImages.length,
                      effect: const ScrollingDotsEffect(
                        dotHeight: 9,
                        dotWidth: 9,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  height: screenHeight * .06,
                  color: Colors.black12,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      screenWidth * .043,
                      0,
                      screenWidth * .043,
                      0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$gameCategory Games',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'More $gameCategory',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * .75,
                child: const GamesWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:betchya/presentation/styles.dart';
import 'package:betchya/presentation/views/promotions_screen/widgets/promotions_tab_container.dart';
import 'package:flutter/material.dart';

class PromotionsTabBar extends StatefulWidget {
  const PromotionsTabBar({super.key});

  @override
  State<PromotionsTabBar> createState() => _PromotionsTabBarState();
}

class _PromotionsTabBarState extends State<PromotionsTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: screenHeight * .016,
        ),
        DecoratedBox(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xffA0A0A0),
                width: 2,
              ),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            width: screenWidth * .9,
            child: TabBar(
              labelPadding: EdgeInsets.zero,
              controller: _tabController,
              labelStyle: selectedTabText,
              unselectedLabelStyle: tabText,
              unselectedLabelColor: const Color(0xffA0A0A0),
              labelColor: const Color(0xff00B498),
              indicatorColor: const Color(0xff00B498),
              tabs: const [
                Tab(
                  text: 'All (4)',
                ),
                Tab(
                  text: 'Food & Drink',
                ),
                Tab(
                  text: 'Casino',
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * .016,
        ),
        SizedBox(
          height: screenHeight * .5,
          width: screenWidth * .914,
          child: TabBarView(
            controller: _tabController,
            children: [
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return PromotionsTabContainer(
                        screenHeight: screenHeight,
                        imageAsset: 'assets/images/food_promo_1.png',
                      );
                    } else if (index == 1) {
                      return PromotionsTabContainer(
                        screenHeight: screenHeight,
                        imageAsset: 'assets/images/casino_promo_1.png',
                      );
                    } else if (index == 2) {
                      return PromotionsTabContainer(
                        screenHeight: screenHeight,
                        imageAsset: 'assets/images/casino_promo_2.png',
                      );
                    } else if (index == 3) {
                      return PromotionsTabContainer(
                        screenHeight: screenHeight,
                        imageAsset: 'assets/images/casino_promo_3.png',
                      );
                    } else {
                      return Container();
                    }
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: screenHeight * .00,
                    );
                  },
                ),
              ),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return PromotionsTabContainer(
                        screenHeight: screenHeight,
                        imageAsset: 'assets/images/food_promo_1.png',
                      );
                    } else {
                      return Container();
                    }
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: screenHeight * .00,
                    );
                  },
                ),
              ),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return PromotionsTabContainer(
                        screenHeight: screenHeight,
                        imageAsset: 'assets/images/casino_promo_1.png',
                      );
                    } else if (index == 1) {
                      return PromotionsTabContainer(
                        screenHeight: screenHeight,
                        imageAsset: 'assets/images/casino_promo_2.png',
                      );
                    } else if (index == 2) {
                      return PromotionsTabContainer(
                        screenHeight: screenHeight,
                        imageAsset: 'assets/images/casino_promo_3.png',
                      );
                    } else {
                      return Container();
                    }
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: screenHeight * .00,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

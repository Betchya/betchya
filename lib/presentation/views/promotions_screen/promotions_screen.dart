import 'package:flutter/material.dart';

import '../../styles.dart';
import 'widgets/PromotionsTabBar.dart';

class PromotionsScreen extends StatelessWidget {
  const PromotionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
                left: screenWidth * .056, right: screenWidth * .05, top: 10),
            height: screenHeight * .29,
            width: screenWidth,
            color: const Color(0xff2C1D57),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Flexible(
                    child: FractionallySizedBox(
                  heightFactor: 0.95,
                )),
                Text(
                  'Promotions',
                  style: header2,
                ),
                Flexible(
                  child: FractionallySizedBox(
                    heightFactor: 0.5,
                  ),
                ),
                Text(
                  'Enhance your stay with our rewarding promotions or special'
                  ' events. Our Promotional events help make your visit an'
                  ' engaging and interactive experience. Tap a promotion to'
                  ' view details.',
                  style: subHeader2,
                )
              ],
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: PromotionsTabBar(),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
        ],
      ),
    );
  }
}

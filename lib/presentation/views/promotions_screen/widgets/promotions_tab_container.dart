import 'package:flutter/material.dart';

class PromotionsTabContainer extends StatelessWidget {
  const PromotionsTabContainer({
    super.key,
    required this.screenHeight,
    required this.imageAsset,
  });

  final double screenHeight;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * .02),
      height: screenHeight * .218,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(0, 6),
            blurRadius: 4,
            color: Colors.black.withOpacity(.25),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imageAsset,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

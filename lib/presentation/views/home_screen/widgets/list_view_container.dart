import 'package:flutter/material.dart';

class ListViewContainer extends StatelessWidget {
  const ListViewContainer({
    super.key,
    this.screenHeight,
    required this.offsetDy,
    required this.blurRadius,
    required this.imageUrl,
  });
  final double? screenHeight;
  final double offsetDy;
  final double blurRadius;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(0, offsetDy),
            blurRadius: blurRadius,
            color: Colors.black.withOpacity(.25),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

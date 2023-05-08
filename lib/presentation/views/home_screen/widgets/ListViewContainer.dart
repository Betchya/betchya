import 'package:flutter/material.dart';

class ListViewContainer extends StatelessWidget {
  final double? screenHeight;
  final double offsetDy;
  final double blurRadius;
  final String imageUrl;

  const ListViewContainer({
    Key? key,
    this.screenHeight,
    required this.offsetDy,
    required this.blurRadius,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight != null ? screenHeight : null,
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

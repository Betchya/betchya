// import 'package:flutter/cupertino.dart';
import 'package:betchya/presentation/views/home_screen/widgets/HomeScreenMenuColumn.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HomeScreenMenu extends StatefulWidget {
  const HomeScreenMenu({super.key});

  @override
  _HomeScreenMenuState createState() => _HomeScreenMenuState();
}

class _HomeScreenMenuState extends State<HomeScreenMenu> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * .12,
      child: Container(
        margin:
            EdgeInsets.fromLTRB(screenWidth * .043, 0, screenWidth * .043, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeScreenMenuColumn(
                    screenHeight: screenHeight,
                    icon: LineAwesomeIcons.utensils,
                    text: 'Dining'),
                HomeScreenMenuColumn(
                    screenHeight: screenHeight,
                    icon: LineAwesomeIcons.city,
                    text: 'Amenities'),
                HomeScreenMenuColumn(
                    screenHeight: screenHeight,
                    icon: LineAwesomeIcons.dice,
                    text: 'Casino'),
                HomeScreenMenuColumn(
                    screenHeight: screenHeight,
                    icon: LineAwesomeIcons.users,
                    text: 'Family'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [dividerLine(context)],
            ),
          ],
        ),
      ),
    );
  }

  Widget dividerLine(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return (Container(
      height: 3,
      width: screenWidth * .91,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            // spreadRadius: 5,
            blurRadius: 2,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Divider(
        height: 1,
        thickness: 1,
        indent: 0,
        endIndent: 0,
        color: Color(0xffC4C4C4),
      ),
    ));
  }
}

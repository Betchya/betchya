import 'package:flutter/material.dart';

import 'widgets/UserRewardsWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: const Color(0xff2C1D57),
                  toolbarHeight: screenHeight * .375,
                  title: const UserRewardsWidget(),
                  automaticallyImplyLeading: false,
                  floating: true,
                  snap: true,
                )
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Container(
                      height: screenHeight * .44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: const Offset(0, 6),
                            blurRadius: 4,
                            color: Colors.black.withOpacity(.25),
                          ),
                        ],
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 3),
                              child: Text('Live Event',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500)),
                            ),
                            SizedBox(
                              height: screenHeight * .29,
                              width: screenWidth * .8997,
                              child: const Image(
                                image: AssetImage(
                                    "assets/images/star-gazing-gifts1.png"),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Flexible(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 60, 10),
                                      child: Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do trdwasrewam yooa dasder, asdas',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(fontSize: 14)),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: TextButton(
                                      child: const Text('Details',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.w600)),
                                      onPressed: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              height: screenHeight * .9,
                                              color: Colors.amber,
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    const Text(
                                                        'Modal BottomSheet'),
                                                    ElevatedButton(
                                                      child: const Text(
                                                          'Close BottomSheet'),
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * .02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Container(
                      height: screenHeight * .44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: const Offset(0, 6),
                            blurRadius: 4,
                            color: Colors.black.withOpacity(.25),
                          ),
                        ],
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 3),
                              child: Text('Live Event',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500)),
                            ),
                            SizedBox(
                              height: screenHeight * .29,
                              width: screenWidth * .8997,
                              child: const Image(
                                image: AssetImage(
                                    "assets/images/star-gazing-gifts1.png"),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Flexible(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 60, 10),
                                      child: Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do trdwasrewam yooa dasder, asdas',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(fontSize: 14)),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: TextButton(
                                      child: const Text('Details',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.w600)),
                                      onPressed: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              height: screenHeight * .9,
                                              color: Colors.amber,
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    const Text(
                                                        'Modal BottomSheet'),
                                                    ElevatedButton(
                                                      child: const Text(
                                                          'Close BottomSheet'),
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * .02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Container(
                      height: screenHeight * .44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: const Offset(0, 6),
                            blurRadius: 4,
                            color: Colors.black.withOpacity(.25),
                          ),
                        ],
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 3),
                              child: Text('Live Event',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500)),
                            ),
                            SizedBox(
                              height: screenHeight * .29,
                              width: screenWidth * .8997,
                              child: const Image(
                                image: AssetImage(
                                    "assets/images/star-gazing-gifts1.png"),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Flexible(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 60, 10),
                                      child: Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do trdwasrewam yooa dasder, asdas',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(fontSize: 14)),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: TextButton(
                                      child: const Text('Details',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.w600)),
                                      onPressed: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              height: screenHeight * .9,
                                              color: Colors.amber,
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    const Text(
                                                        'Modal BottomSheet'),
                                                    ElevatedButton(
                                                      child: const Text(
                                                          'Close BottomSheet'),
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

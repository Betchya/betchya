// import 'package:betchya/other_models/bets.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BetsWidget extends StatefulWidget {
  const BetsWidget({super.key, required this.filter});

  final String filter;

  @override
  State<BetsWidget> createState() => _BetsWidgetState();
}

class _BetsWidgetState extends State<BetsWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder<List<dynamic>>(
      future: Future.delayed(const Duration(seconds: 3)),
      // APIGetBets().getBetList(widget.filter),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              // final bet = snapshot.data![index];
              return Card(
                elevation: 5,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * .01,
                    ),
                    // TODO: update date
                    Text(
                      DateFormat.yMMMMd('en_US').format(DateTime.now()),
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF00B498),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox.square(
                          dimension: screenWidth * .2,
                          // child: CachedNetworkImage(
                          //   imageUrl: '', // bet.teamLogo1,
                          //   progressIndicatorBuilder:
                          //       (context, url, progress) => Center(
                          //     child: CircularProgressIndicator(
                          //       value: progress.progress,
                          //     ),
                          //   ),
                          //   errorWidget: (context, url, error) =>
                          //       const Icon(Icons.error),
                          //   height: screenHeight * .1,
                          //   fit: BoxFit.contain,
                          // ),
                          child: const Card(color: Colors.purple,),
                        ),
                        const Text('VS'),
                        SizedBox.square(
                          dimension: screenWidth * .2,
                          // child: CachedNetworkImage(
                          //   imageUrl: '', // bet.teamLogo2,
                          //   progressIndicatorBuilder:
                          //       (context, url, progress) => Center(
                          //     child: CircularProgressIndicator(
                          //       value: progress.progress,
                          //     ),
                          //   ),
                          //   errorWidget: (context, url, error) =>
                          //       const Icon(Icons.error),
                          //   height: screenHeight * .1,
                          //   fit: BoxFit.contain,
                          // ),
                          child: const Card(color: Colors.purple,),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * .01,
                    ),
                    const Text('bet.description'),
                    SizedBox(
                      height: screenHeight * .01,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Betting Line: ${'bet.betLine'} ',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                        Text(
                          'Amount: \u0024${'bet.amount'}',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

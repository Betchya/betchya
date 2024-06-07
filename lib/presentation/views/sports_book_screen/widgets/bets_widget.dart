import 'package:betchya/logic/games/game_list.dart';
import 'package:betchya/logic/teams/teams.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

// TODO(jsrockett): old widget, might be useful in the future as only a temp widget is being use to showcase all bets

class BetsWidget extends StatefulWidget {
  const BetsWidget({super.key, required this.filter});

  final String filter;

  @override
  State<BetsWidget> createState() => _BetsWidgetState();
}

class _BetsWidgetState extends State<BetsWidget> {

  // Format DateTime type into a more readable String
  String formattedDateTime(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    final dateFormat = DateFormat('E h:mm a');
    final formattedDate = dateFormat.format(dateTime);
    return '$formattedDate ET';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
      shrinkWrap: true,
      itemCount: gameList?.length,
      itemBuilder: (context, index) {
        final game = gameList?[index];

        return Card(
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * .01,
                ),
                // Shows team names and logos
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          const Center(
                            child: Text(
                              'Home',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * .01,
                          ),
                          SizedBox.square(
                            dimension: screenWidth * .2,
                            child: SvgPicture.asset(
                              'assets/logos/${game.GameCategory.toLowerCase()}/${game.HomeTeamName.toLowerCase()}.svg',
                            ),
                          ),
                          Center(
                            child: Text(
                              getTeamName(game.GameCategory as String, game.HomeTeamName as String?)!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: Center(
                        child: Text('VS'),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          const Center(
                            child: Text(
                              'Away',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * .01,
                          ),
                          SizedBox.square(
                            dimension: screenWidth * .2,
                            child: SvgPicture.asset(
                              'assets/logos/${game.GameCategory.toLowerCase()}/${game.AwayTeamName.toLowerCase()}.svg',
                            )
                          ),
                          Center(
                            child: Text(
                              getTeamName(game.GameCategory as String, game.AwayTeamName as String?) as String,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * .01,
                ),
                Text(
                  formattedDateTime(game.DateTime as String),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Divider(),
                SizedBox(
                  height: screenHeight * .01,
                ),
                Text(
                  game.BetType as String,
                  style: const TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
                ),
                Text(
                  'AMOUNT: ${game.Amount} - PAYOUT: ${game.Payout}',
                  style: const TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
                ),
                Text(
                  'PROFIT: ${int.parse(game.Payout as String) - int.parse(game.Amount as String)}',
                  style: const TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: screenHeight * .01,
                ),
              ],
            ),
          ),
        );  
      },
    );

    /*
    return FutureBuilder<List<Bet>>(
      future: Future.delayed(const Duration(seconds: 3)),
      // APIGetBets().getBetList(widget.filter),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              final bet = snapshot.data![index];
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
                    Text(
                      DateFormat.yMMMMd('en_US').format(bet.date),
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
                          child: CachedNetworkImage(
                            imageUrl: bet.teamLogo1,
                            progressIndicatorBuilder:
                                (context, url, progress) => Center(
                              child: CircularProgressIndicator(
                                value: progress.progress,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            height: screenHeight * .1,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const Text('VS'),
                        SizedBox.square(
                          dimension: screenWidth * .2,
                          child: CachedNetworkImage(
                            imageUrl: bet.teamLogo2,
                            progressIndicatorBuilder:
                                (context, url, progress) => Center(
                              child: CircularProgressIndicator(
                                value: progress.progress,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            height: screenHeight * .1,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * .01,
                    ),
                    Text(bet.description),
                    SizedBox(
                      height: screenHeight * .01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Betting Line: ${bet.betLine} ',
                          style: const TextStyle(color: Colors.deepPurple),
                        ),
                        Text(
                          'Amount: \u0024${bet.amount}',
                          style: const TextStyle(color: Colors.deepPurple),
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
    */
  }
}

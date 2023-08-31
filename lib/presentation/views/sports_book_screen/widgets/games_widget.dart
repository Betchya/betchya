// import 'package:betchya/logic/api/api_addBets.dart';
import 'package:betchya/logic/api/api_get_games.dart';
import 'package:betchya/logic/games/game_category.dart';
import 'package:betchya/other_models/games.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GamesWidget extends StatefulWidget {
  const GamesWidget({super.key});

  @override
  State<GamesWidget> createState() => _GamesWidgetState();
}

class _GamesWidgetState extends State<GamesWidget> {
  final amountController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder<List<Game>>(
      future: APIGetGames().getGameList(gameCategory),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
            shrinkWrap: true,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              final game = snapshot.data![index];

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox.square(
                            dimension: screenWidth * .2,
                            child: CachedNetworkImage(
                              imageUrl: game.teamLogo1,
                              progressIndicatorBuilder:
                                  (context, url, progress) => Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Text('VS'),
                          SizedBox.square(
                            dimension: screenWidth * .2,
                            child: CachedNetworkImage(
                              imageUrl: game.teamLogo2,
                              progressIndicatorBuilder:
                                  (context, url, progress) => Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * .01,
                      ),
                      Text(game.description),
                      SizedBox(
                        height: screenHeight * .01,
                      ),
                      Text(
                        'Betting Line: ${game.betLine} ',
                        style: const TextStyle(color: Colors.deepPurple),
                      ),
                      SizedBox(
                        height: screenHeight * .01,
                      ),
                      SizedBox(
                        width: screenWidth * 0.8,
                        child: TextFormField(
                          controller: amountController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.attach_money),
                            border: OutlineInputBorder(),
                            labelText: 'Amount',
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * .01,
                      ),
                      SizedBox(
                        width: screenWidth * .8,
                        height: screenHeight * .05,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff00B498),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () => {
                            // APIAddBets().addBet(
                            //   game.description,
                            //   game.betLine,
                            //   game.teamLogo1,
                            //   game.teamLogo2,
                            //   amountController.text,
                            //   game.date,
                            // ),
                            setState(() {}),
                          },
                          child: const Text(
                            'Place Bet',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
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

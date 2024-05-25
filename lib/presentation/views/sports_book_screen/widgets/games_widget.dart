// import 'package:betchya/logic/api/api_addBets.dart';
import 'dart:convert';
import 'dart:ffi';

import 'package:betchya/logic/api/api_get_games.dart';
import 'package:betchya/logic/games/game_category.dart';
import 'package:betchya/logic/teams/teams.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class GamesWidget extends StatefulWidget {
  const GamesWidget({super.key});

  @override
  State<GamesWidget> createState() => _GamesWidgetState();
}

class _GamesWidgetState extends State<GamesWidget> {
  TextEditingController amountController = TextEditingController();

  String formattedDateTime(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    final dateFormat = DateFormat('E h:mm a');
    final formattedDate = dateFormat.format(dateTime);
    return '$formattedDate ET';
  }

  String calculatePayout(String amount, String odds) {
    final parsedAmount = int.parse(amount);
    final parsedOdds = int.parse(odds);

    if (parsedOdds >= 0) {
      return (parsedAmount * (parsedOdds/100) + parsedAmount).round().toString();
    }
    else {
      return (parsedAmount / (parsedOdds.abs()/100) + parsedAmount).round().toString();
    }
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var payout = '';

    return FutureBuilder<List<dynamic>>(
      future: APIGetGames().getGameList(gameCategory),
      builder: (context, snapshot) {
        if (snapshot.hasData ) {
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
            shrinkWrap: true,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              final game = snapshot.data?[index];

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
                                  child: !loading
                                  ? SvgPicture.asset(
                                      'assets/logos/${gameCategory.toLowerCase()}/${game.HomeTeamName.toLowerCase()}.svg',
                                    )
                                  : const CircularProgressIndicator(),
                                ),
                                Center(
                                  child: Text(
                                    getTeamName(gameCategory, game.HomeTeamName as String?)!,
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
                                  child: !loading
                                  ? SvgPicture.asset(
                                      'assets/logos/${gameCategory.toLowerCase()}/${game.AwayTeamName.toLowerCase()}.svg',
                                    )
                                  : const CircularProgressIndicator(),
                                ),
                                Center(
                                  child: Text(
                                    getTeamName(gameCategory, game.AwayTeamName as String?)!,
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
                        style: const TextStyle(fontWeight: FontWeight.bold)
                      ),
                      SizedBox(
                        height: screenHeight * .01,
                      ),
                      const Divider(),
                      const Text(
                        'Spread',
                        style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      SizedBox(
                        height: screenHeight * .01,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5), // Adjust border radius for squared corners
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: screenHeight * .01,
                                  ),
                                  Text(
                                    '${json.decode(game?.PregameOdds?[0] as String)['HomePointSpread']}',
                                    style: const TextStyle(color: Colors.deepPurple),
                                  ),
                                  Text(
                                    '${json.decode(game?.PregameOdds?[0] as String)['HomePointSpreadPayout']}',
                                    style: const TextStyle(color: Colors.deepPurple),
                                  ),
                                  SizedBox(
                                    height: screenHeight * .01,
                                  ),
                                ],
                              ),
                              onPressed: () {
                                // When the button is pressed, show the dialog
                                showDialog<void>(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (context, setState) {
                                        return Dialog(
                                          child: Container(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Home Point Spread: ${json.decode(game?.PregameOdds?[0] as String)['HomePointSpread']}',
                                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                SizedBox(
                                                  height: screenHeight * .01,
                                                ),
                                                Text(
                                                  'Odds: ${json.decode(game?.PregameOdds?[0] as String)['HomePointSpreadPayout']}',
                                                  style: const TextStyle(color: Colors.deepPurple),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * .01,
                                                ),
                                                SizedBox(
                                                  width: screenWidth * 0.8,
                                                  child: TextFormField(
                                                    controller: amountController,
                                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                    decoration: const InputDecoration(
                                                      prefixIcon: Icon(Icons.attach_money),
                                                      border: OutlineInputBorder(),
                                                      labelText: 'Amount',
                                                    ),
                                                    onChanged: (value) {
                                                      setState((){});
                                                      payout = calculatePayout(value, json.decode(game?.PregameOdds?[0] as String)['HomePointSpreadPayout'].toString());
                                                    },
                                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                                  ),
                                                ),
                                                SizedBox( height: screenHeight * .01,),
                                                Text(
                                                  'Payout: $payout',
                                                  style: const TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox( height: screenHeight * .01,),
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
                                                      // TODO: do something with user's account and their money
                                                      setState(() {}),
                                                    },
                                                    child: const Text(
                                                      'Place Bet',
                                                      style: TextStyle(fontSize: 15),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 16.0),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    // Close the dialog
                                                    payout = '';
                                                    amountController.clear();
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Close'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ).then((value){ // unsure what "value" is looking at but it allows it to work when user clicks outside of dialog to clear
                                  payout = '';
                                  amountController.clear();
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 20), // Adjust the spacing between the two Text widgets
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5), // Adjust border radius for squared corners
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: screenHeight * .01,
                                  ),
                                  Text(
                                    '${json.decode(game?.PregameOdds?[0] as String)['AwayPointSpread']}',
                                    style: const TextStyle(color: Colors.deepPurple),
                                  ),
                                  Text(
                                    '${json.decode(game?.PregameOdds?[0] as String)['AwayPointSpreadPayout']}',
                                    style: const TextStyle(color: Colors.deepPurple),
                                  ),
                                  SizedBox(
                                    height: screenHeight * .01,
                                  ),
                                ],
                              ),
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (context, setState) {
                                        return Dialog(
                                          child: Container(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Away Point Spread: ${json.decode(game?.PregameOdds?[0] as String)['AwayPointSpread']}',
                                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                SizedBox(
                                                  height: screenHeight * .01,
                                                ),
                                                Text(
                                                  'Odds: ${json.decode(game?.PregameOdds?[0] as String)['AwayPointSpreadPayout']}',
                                                  style: const TextStyle(color: Colors.deepPurple),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * .01,
                                                ),
                                                SizedBox(
                                                  width: screenWidth * 0.8,
                                                  child: TextFormField(
                                                    controller: amountController,
                                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                    decoration: const InputDecoration(
                                                      prefixIcon: Icon(Icons.attach_money),
                                                      border: OutlineInputBorder(),
                                                      labelText: 'Amount',
                                                    ),
                                                    onChanged: (value) {
                                                      setState((){});
                                                      payout = calculatePayout(value, json.decode(game?.PregameOdds?[0] as String)['AwayPointSpreadPayout'].toString());
                                                    },
                                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                                  ),
                                                ),
                                                SizedBox( height: screenHeight * .01,),
                                                Text(
                                                  'Payout: $payout',
                                                  style: const TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox( height: screenHeight * .01,),
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
                                                      setState(() {}),
                                                    },
                                                    child: const Text(
                                                      'Place Bet',
                                                      style: TextStyle(fontSize: 15),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 16.0),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    // Close the dialog
                                                    payout = '';
                                                    amountController.clear();
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Close'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ).then((value){ // unsure what "value" is looking at but it allows it to work when user clicks outside of dialog to clear
                                  payout = '';
                                  amountController.clear();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * .01,
                      ),
                      const Divider(),
                      const Text(
                        'Money',
                        style: TextStyle(fontWeight: FontWeight.bold)
                        ),
                      SizedBox(
                        height: screenHeight * .01,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5), // Adjust border radius for squared corners
                                ),
                              ),
                              child: Text(
                                    '${json.decode(game?.PregameOdds?[0] as String)['HomeMoneyLine']}',
                                    style: const TextStyle(color: Colors.deepPurple),
                                  ),
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (context, setState) {
                                        return Dialog(
                                          child: Container(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Text(
                                                  'Home Wins',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                SizedBox(
                                                  height: screenHeight * .01,
                                                ),
                                                Text(
                                                  'Odds: ${json.decode(game?.PregameOdds?[0] as String)['HomeMoneyLine']}',
                                                  style: const TextStyle(color: Colors.deepPurple),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * .01,
                                                ),
                                                SizedBox(
                                                  width: screenWidth * 0.8,
                                                  child: TextFormField(
                                                    controller: amountController,
                                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                    decoration: const InputDecoration(
                                                      prefixIcon: Icon(Icons.attach_money),
                                                      border: OutlineInputBorder(),
                                                      labelText: 'Amount',
                                                    ),
                                                    onChanged: (value) {
                                                      setState((){});
                                                      payout = calculatePayout(value, json.decode(game?.PregameOdds?[0] as String)['HomeMoneyLine'].toString());
                                                    },
                                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                                  ),
                                                ),
                                                SizedBox( height: screenHeight * .01,),
                                                Text(
                                                  'Payout: $payout',
                                                  style: const TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox( height: screenHeight * .01,),
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
                                                      setState(() {}),
                                                    },
                                                    child: const Text(
                                                      'Place Bet',
                                                      style: TextStyle(fontSize: 15),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 16.0),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    // Close the dialog
                                                    payout = '';
                                                    amountController.clear();
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Close'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ).then((value){ // unsure what "value" is looking at but it allows it to work when user clicks outside of dialog to clear
                                  payout = '';
                                  amountController.clear();
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 20), // Adjust the spacing between the two Text widgets
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5), // Adjust border radius for squared corners
                                ),
                              ),
                              child: Text(
                                    '${json.decode(game?.PregameOdds?[0] as String)['AwayMoneyLine']}',
                                    style: const TextStyle(color: Colors.deepPurple),
                                  ),
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (context, setState) {
                                        return Dialog(
                                          child: Container(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Text(
                                                  'Away Wins',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                SizedBox(
                                                  height: screenHeight * .01,
                                                ),
                                                Text(
                                                  'Odds: ${json.decode(game?.PregameOdds?[0] as String)['AwayMoneyLine']}',
                                                  style: const TextStyle(color: Colors.deepPurple),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * .01,
                                                ),
                                                SizedBox(
                                                  width: screenWidth * 0.8,
                                                  child: TextFormField(
                                                    controller: amountController,
                                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                    decoration: const InputDecoration(
                                                      prefixIcon: Icon(Icons.attach_money),
                                                      border: OutlineInputBorder(),
                                                      labelText: 'Amount',
                                                    ),
                                                    onChanged: (value) {
                                                      setState((){});
                                                      payout = calculatePayout(value, json.decode(game?.PregameOdds?[0] as String)['AwayMoneyLine'].toString());
                                                    },
                                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                                  ),
                                                ),
                                                SizedBox( height: screenHeight * .01,),
                                                Text(
                                                  'Payout: $payout',
                                                  style: const TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox( height: screenHeight * .01,),
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
                                                      setState(() {}),
                                                    },
                                                    child: const Text(
                                                      'Place Bet',
                                                      style: TextStyle(fontSize: 15),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 16.0),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    // Close the dialog
                                                    payout = '';
                                                    amountController.clear();
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Close'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ).then((value){ // unsure what "value" is looking at but it allows it to work when user clicks outside of dialog to clear
                                  payout = '';
                                  amountController.clear();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * .01,
                      ),
                      const Divider(),
                      const Text(
                        'Total',
                        style: TextStyle(fontWeight: FontWeight.bold)
                        ),
                      SizedBox(
                        height: screenHeight * .01,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5), // Adjust border radius for squared corners
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: screenHeight * .01,
                                  ),
                                  Text(
                                    'O ${json.decode(game?.PregameOdds?[0] as String)['OverUnder']}',
                                    style: const TextStyle(color: Colors.deepPurple),
                                  ),
                                  Text(
                                    '${json.decode(game?.PregameOdds?[0] as String)['OverPayout']}',
                                    style: const TextStyle(color: Colors.deepPurple),
                                  ),
                                  SizedBox(
                                    height: screenHeight * .01,
                                  ),
                                ],
                              ),
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (context, setState) {
                                        return Dialog(
                                          child: Container(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Over ${json.decode(game?.PregameOdds?[0] as String)['OverUnder']} Total Points',
                                                  style: const TextStyle(fontWeight: FontWeight.bold)
                                                ),
                                                SizedBox(
                                                  height: screenHeight * .01,
                                                ),
                                                Text(
                                                  '${json.decode(game?.PregameOdds?[0] as String)['OverPayout']}',
                                                  style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * .01,
                                                ),
                                                SizedBox(
                                                  width: screenWidth * 0.8,
                                                  child: TextFormField(
                                                    controller: amountController,
                                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                    decoration: const InputDecoration(
                                                      prefixIcon: Icon(Icons.attach_money),
                                                      border: OutlineInputBorder(),
                                                      labelText: 'Amount',
                                                    ),
                                                    onChanged: (value) {
                                                      setState((){});
                                                      payout = calculatePayout(value, json.decode(game?.PregameOdds?[0] as String)['OverPayout'].toString());
                                                    },
                                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                                  ),
                                                ),
                                                SizedBox( height: screenHeight * .01,),
                                                Text(
                                                  'Payout: $payout',
                                                  style: const TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox( height: screenHeight * .01,),
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
                                                      setState(() {}),
                                                    },
                                                    child: const Text(
                                                      'Place Bet',
                                                      style: TextStyle(fontSize: 15),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 16.0),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    // Close the dialog
                                                    payout = '';
                                                    amountController.clear();
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Close'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ).then((value){ // unsure what "value" is looking at but it allows it to work when user clicks outside of dialog to clear
                                  payout = '';
                                  amountController.clear();
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 20), // Adjust the spacing between the two Text widgets
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5), // Adjust border radius for squared corners
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: screenHeight * .01,
                                  ),
                                  Text(
                                    'U ${json.decode(game?.PregameOdds?[0] as String)['OverUnder']}',
                                    style: const TextStyle(color: Colors.deepPurple),
                                  ),
                                  Text(
                                    '${json.decode(game?.PregameOdds?[0] as String)['UnderPayout']}',
                                    style: const TextStyle(color: Colors.deepPurple),
                                  ),
                                  SizedBox(
                                    height: screenHeight * .01,
                                  ),
                                ],
                              ),
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (context, setState) {
                                        return Dialog(
                                          child: Container(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Under ${json.decode(game?.PregameOdds?[0] as String)['OverUnder']} Total Points',
                                                  style: const TextStyle(fontWeight: FontWeight.bold)
                                                ),
                                                SizedBox(
                                                  height: screenHeight * .01,
                                                ),
                                                Text(
                                                  '${json.decode(game?.PregameOdds?[0] as String)['UnderPayout']}',
                                                  style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * .01,
                                                ),
                                                SizedBox(
                                                  width: screenWidth * 0.8,
                                                  child: TextFormField(
                                                    controller: amountController,
                                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                    decoration: const InputDecoration(
                                                      prefixIcon: Icon(Icons.attach_money),
                                                      border: OutlineInputBorder(),
                                                      labelText: 'Amount',
                                                    ),
                                                    onChanged: (value) {
                                                      setState((){});
                                                      payout = calculatePayout(value, json.decode(game?.PregameOdds?[0] as String)['UnderPayout'].toString());
                                                    },
                                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                                  ),
                                                ),
                                                SizedBox( height: screenHeight * .01,),
                                                Text(
                                                  'Payout: $payout',
                                                  style: const TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox( height: screenHeight * .01,),
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
                                                      setState(() {}),
                                                    },
                                                    child: const Text(
                                                      'Place Bet',
                                                      style: TextStyle(fontSize: 15),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 16.0),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    // Close the dialog
                                                    payout = '';
                                                    amountController.clear();
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Close'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ).then((value){ // unsure what "value" is looking at but it allows it to work when user clicks outside of dialog to clear
                                  payout = '';
                                  amountController.clear();
                                });
                              },
                            ),
                          ),
                        ],
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
        }
        else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
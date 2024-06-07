import 'dart:convert';

import 'package:betchya/models/bets.dart';

// TODO(jsrockett): temporary way to keep track of betted games until RDS database is done with financial information

// Keeps track of games betted on
List<dynamic>? gameList = [];

void addBet(dynamic game, String amount, String payout, String betType, String gameCategory) {
  final newGame = Game(
    AwayTeamName: game.AwayTeamName as String?,
    DateTime: game.DateTime as String?,
    HomeTeamName: game.HomeTeamName as String?,
    AwayMoneyLine: json.decode(game?.PregameOdds?[0] as String)['AwayMoneyLine'].toString() as String?,
    HomeMoneyLine: json.decode(game?.PregameOdds?[0] as String)['HomeMoneyLine'].toString() as String?,
    AwayPointSpread: json.decode(game?.PregameOdds?[0] as String)['AwayPointSpread'].toString() as String?,
    HomePointSpread: json.decode(game?.PregameOdds?[0] as String)['HomePointSpread'].toString() as String?,
    AwayPointSpreadPayout: json.decode(game?.PregameOdds?[0] as String)['AwayPointSpreadPayout'].toString() as String?,
    HomePointSpreadPayout: json.decode(game?.PregameOdds?[0] as String)['HomePointSpreadPayout'].toString() as String?,
    OverUnder: json.decode(game?.PregameOdds?[0] as String)['OverUnder'].toString() as String?,
    OverPayout: json.decode(game?.PregameOdds?[0] as String)['OverPayout'].toString() as String?,
    UnderPayout: json.decode(game?.PregameOdds?[0] as String)['UnderPayout'].toString() as String?,
    BetType: betType as String?,
    Amount: amount as String?,
    Payout: payout as String?,
    GameCategory: gameCategory as String?
  );

  gameList?.add(newGame);
} 

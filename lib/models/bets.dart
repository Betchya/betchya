// TODO(jsrockett): temp structure for bets that will need to be fixed when RDS and financial functionality is implemented

class Game {

  String?   AwayTeamName;
  String?   DateTime;
  String?   HomeTeamName;
  String?   AwayMoneyLine;
  String?   HomeMoneyLine;
  String?   AwayPointSpread;
  String?   HomePointSpread;
  String?   AwayPointSpreadPayout;
  String?   HomePointSpreadPayout;
  String?   OverUnder;
  String?   OverPayout;
  String?   UnderPayout;
  String?   BetType;
  String?   Amount;
  String?   Payout;
  String?   GameCategory;

  Game({
    this.AwayTeamName,
    this.DateTime,
    this.HomeTeamName,
    this.AwayMoneyLine,
    this.HomeMoneyLine,
    this.AwayPointSpread,
    this.HomePointSpread,
    this.AwayPointSpreadPayout,
    this.HomePointSpreadPayout,
    this.OverUnder,
    this.OverPayout,
    this.UnderPayout,
    this.BetType,
    this.Amount,
    this.Payout,
    this.GameCategory,
  });
}

/*
import 'dart:convert';


List<Bet> betFromJson(String str) => List<Bet>.from(
      json.decode(str) as Iterable<dynamic>,
    ); //.map(Bet.fromJson));

String betToJson(List<Bet> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class Bet {
  Bet({
    required this.description,
    required this.user,
    required this.betLine,
    required this.teamLogo1,
    required this.teamLogo2,
    required this.amount,
    required this.date,
  });

  factory Bet.fromJson(Map<String, dynamic> json) => Bet(
        description: json['description'].toString(),
        user: json['user'],
        betLine: json['betLine'],
        teamLogo1: json['teamLogo1'].toString(),
        teamLogo2: json['teamLogo2'].toString(),
        amount: json['amount'],
        // date: json["date"],
        date: DateTime.parse(json['date'].toString()),
      );
  String description;
  dynamic user;
  dynamic betLine;
  String teamLogo1;
  String teamLogo2;
  dynamic amount;
  DateTime date;

  Map<String, dynamic> toJson() => {
        'description': description,
        'user': user,
        'betLine': betLine,
        'teamLogo1': teamLogo1,
        'teamLogo2': teamLogo2,
        'amount': amount,
        'date': date.toIso8601String(),
      };
}
*/

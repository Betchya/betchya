import 'dart:convert';
import 'dart:ffi';

// TODO: uncomment/fix toJson functions

List<Game> gameFromJson(String str) => List<Game>.from(
      json.decode(str) as Iterable<dynamic>,
    ); // .map((x) => Game.fromJson(x)));

/*
String gameToJson(List<Game> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
*/

class Game {
  // dynamic amount;

  Game({
    required this.gameId,
    required this.awayTeamId,
    required this.awayTeamName,
    required this.awayTeamScore,
    required this.date,
    required this.homeTeamId,
    required this.homeTeamName,
    required this.homeTeamScore,
    required this.awayMoneyLine,
    required this.homeMoneyLine,
    required this.awayPointSpread,
    required this.homePointSpread,
    required this.awayPointSpreadPayout,
    required this.homePointSpreadPayout,
    required this.overUnder,
    required this.overPayout,
    required this.underPayout,
    required this.oddType,
  });

  factory Game.fromJson(Map<String, dynamic> json) => Game(
    gameId: json['GameId'] as int?,
    awayTeamId: json['AwayTeamId'] as int?,
    awayTeamName: json['AwayTeamName'] as String?,
    awayTeamScore: json['AwayTeamScore'] as int?,
    date: json['DateTime'] != null ? DateTime.parse(json['DateTime'] as String) : null,
    homeTeamId: json['HomeTeamId'] as int?,
    homeTeamName: json['HomeTeamName'] as String?,
    homeTeamScore: json['HomeTeamScore'] as int?,
    awayMoneyLine: json['PregameOdds'][0]['AwayMoneyLine'] as int?,
    homeMoneyLine: json['PregameOdds'][0]['HomeMoneyLine'] as int?,
    awayPointSpread: json['PregameOdds'][0]['AwayPointSpread'] as double?,
    homePointSpread: json['PregameOdds'][0]['HomePointSpread'] as double?,
    awayPointSpreadPayout: json['PregameOdds'][0]['AwayPointSpreadPayout'] as int?,
    homePointSpreadPayout: json['PregameOdds'][0]['HomePointSpreadPayout'] as int?,
    overUnder: json['PregameOdds'][0]['OverUnder'] as double?,
    overPayout: json['PregameOdds'][0]['OverPayout'] as int?,
    underPayout: json['PregameOdds'][0]['UnderPayout'] as int?,
    oddType: json['PregameOdds'][0]['OddType'] as String?,
  );

  int?      gameId;
  int?      awayTeamId;
  String?   awayTeamName;
  int?      awayTeamScore;
  DateTime? date;
  int?      homeTeamId;
  String?   homeTeamName;
  int?      homeTeamScore;
  int?      awayMoneyLine;
  int?      homeMoneyLine;
  double?   awayPointSpread;
  double?   homePointSpread;
  int?      awayPointSpreadPayout;
  int?      homePointSpreadPayout;
  double?   overUnder;
  int?      overPayout;
  int?      underPayout;
  String?   oddType;

  /*
  Map<String, dynamic> toJson() => {
        'description': description,
        'betCategory': betCategory,
        'betLine': betLine,
        'teamLogo1': teamLogo1,
        'teamLogo2': teamLogo2,
        'date': date.toIso8601String(),
      };
  */
}

import 'dart:convert';

List<Game> gameFromJson(String str) => List<Game>.from(
      json.decode(str) as Iterable<dynamic>,
    ); // .map((x) => Game.fromJson(x)));

String gameToJson(List<Game> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Game {
  // dynamic amount;

  Game({
    required this.description,
    required this.betCategory,
    required this.betLine,
    required this.teamLogo1,
    required this.teamLogo2,
    required this.date,
    // required this.amount,
  });

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        description: json['description'] as String,
        betCategory: json['betCategory'] as String,
        betLine: json['betLine'],
        teamLogo1: json['teamLogo1'] as String,
        teamLogo2: json['teamLogo2'] as String,
        date: DateTime.parse(json['date'] as String),
        // amount: json["amount"],
      );

  String description;
  String betCategory;
  dynamic betLine;
  String teamLogo1;
  String teamLogo2;
  DateTime date;

  Map<String, dynamic> toJson() => {
        'description': description,
        'betCategory': betCategory,
        'betLine': betLine,
        'teamLogo1': teamLogo1,
        'teamLogo2': teamLogo2,
        'date': date.toIso8601String(),
        // "amount": amount,
      };
}

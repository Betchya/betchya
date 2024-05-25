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

import 'dart:convert';

List<Reward> rewardFromJson(String str) => List<Reward>.from(
      json.decode(str) as Iterable<dynamic>,
    ); // .map((x) => Reward.fromJson(x)));

String rewardToJson(List<Reward> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reward {
  Reward({
    required this.name,
    required this.information,
    required this.points,
    required this.id,
    required this.subtitle,
    required this.imageUrl,
  });

  factory Reward.fromJson(Map<String, dynamic> json) => Reward(
        name: json['name'] as String,
        information: json['information'] as String,
        points: json['points'] as int,
        id: json['id'] as String,
        subtitle: json['subtitle'] as String,
        imageUrl: json['imageURL'] as String,
      );

  String name;
  String information;
  int points;
  String id;
  String subtitle;
  String imageUrl;

  Map<String, dynamic> toJson() => {
        'name': name,
        'information': information,
        'points': points,
        'id': id,
        'subtitle': subtitle,
        'imageURL': imageUrl,
      };
}

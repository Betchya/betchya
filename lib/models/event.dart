import 'dart:convert';

List<Event> eventFromJson(String str) => List<Event>.from(
      json.decode(str) as Iterable<dynamic>,
    ); // .map((x) => Event.fromJson(x)));

String eventToJson(List<Event> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
  Event({
    required this.description,
    required this.name,
    required this.minAge,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.date,
    required this.id,
    required this.location,
    required this.featured,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        description: json['description'] as String,
        name: json['name'] as String,
        minAge: json['minAge'] as int,
        category: json['category'] as String,
        imageUrl: json['imageURL'] as String?,
        price: json['price'] as int,
        date: DateTime.parse(json['date'] as String),
        id: json['id'] as String,
        location: json['location'] as String,
        featured: json['featured'] as bool,
      );
  String description;
  String name;
  int minAge;
  String category;
  String? imageUrl;
  int price;
  DateTime date;
  String id;
  String location;
  bool featured;

  Map<String, dynamic> toJson() => {
        'description': description,
        'name': name,
        'minAge': minAge,
        'category': category,
        'imageURL': imageUrl,
        'price': price,
        'date': date.toIso8601String(),
        'id': id,
        'location': location,
        'featured': featured,
      };
}

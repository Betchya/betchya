import 'dart:convert';

import 'package:betchya/other_models/games.dart';
import 'package:http/http.dart' as http;

class APIGetGames {
  Future<List<Game>> getGameList(String gameCategory) async {
    final response = await http.get(
      Uri.parse('https://betcha-api-tirbceqy5q-uw.a.run.app/generic_bets'),
    );

    final responseJason = jsonDecode(response.body) as Map<String, dynamic>;

    final gameList = <Game>[];
    if (responseJason.isNotEmpty) {
      for (var i = 0; i < responseJason.length; i++) {
        if (responseJason[i] != null) {
          final map = responseJason[i] as Map<String, dynamic>;
          if (map['betCategory'] == gameCategory || gameCategory == '') {
            gameList.add(Game.fromJson(map));
          }
        }
      }
    }

    return gameList;
  }
}

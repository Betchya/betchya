import 'dart:convert';
import 'dart:developer';

import 'package:betchya/other_models/games.dart';
import 'package:http/http.dart' as http;

// TODO: change SportsData.io API call to AppSync call

class APIGetGames {
  //Future<List<Game>> getGameList(String gameCategory) async {
  Future<List<Game>> getGameList() async {
    final response = await http.get(
      //Uri.parse('https://betcha-api-tirbceqy5q-uw.a.run.app/generic_bets'),
      Uri.parse('https://api.sportsdata.io/v3/nba/odds/json/GameOddsByDate/2024-04-26?key=469421ea871a488eb5f670116668a83d'),
    );

    final responseJason = jsonDecode(response.body) as List<dynamic>;
    
    final gameList = <Game>[];
    if (responseJason.isNotEmpty) {
      for (var i = 0; i < responseJason.length; i++) {
        if (responseJason[i] != null) {
          final map = responseJason[i] as Map<String, dynamic>;
          //if (map['betCategory'] == gameCategory || gameCategory == '') {
          if (true) {
            gameList.add(Game.fromJson(map));
          }
        }
      }
    }

    return gameList;
  }
}

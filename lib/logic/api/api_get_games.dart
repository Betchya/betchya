import 'dart:convert';
import 'dart:developer';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:betchya/models/ModelProvider.dart';
import 'package:betchya/models/NBAPregameOdds.dart';
import 'package:betchya/logic/games/game_category.dart';

class APIGetGames {
  Future<List<dynamic>>? getGameList(String gameCategory) async {
    loading = true;
    final GraphQLRequest<dynamic> request;
    if(gameCategory == 'NBA'){
      request = ModelQueries.list(NBAPregameOdds.classType);
    }
    else if(gameCategory == 'MLB'){
      request = ModelQueries.list(MLBPregameOdds.classType);
    }
    else{
      request = ModelQueries.list(NBAPregameOdds.classType);
    }

    final res = await Amplify.API.query(request: request).response;

    final games = res.data?.items as List<Model?>;

    loading = false;
    return games;
  }
}

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:betchya/logic/games/game_category.dart';
import 'package:betchya/models/ModelProvider.dart';

// TODO(jsrockett): Connect to other sport conferences/types when there are more SportsData.io subscriptions

class APIGetGames {
  Future<List<dynamic>?> getGameList(String gameCategory) async {
    loading = true; // Allows loading of team names/logos to sync with fetching of games

    final GraphQLRequest<dynamic> request;
    if(gameCategory == 'NBA'){
      request = ModelQueries.list(NBAPregameOdds.classType);
    }
    else if(gameCategory == 'MLB'){
      request = ModelQueries.list(MLBPregameOdds.classType);
    }
    else{
      return null;
    }

    final res = await Amplify.API.query(request: request).response;
    final games = res.data?.items as List<Model?>;

    loading = false; // Allows loading of team names/logos to sync with fetching of games
    return games;
  }
}

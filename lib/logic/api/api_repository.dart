import 'dart:convert';

import 'package:betchya/logic/api/api_provider.dart';
import 'package:betchya/other_models/event.dart';
import 'package:betchya/other_models/reward.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<Event>> fetchEventList() async {
    final response = await _provider.fetchEventList();
    return eventFromJson(response.body);
  }

  Future<List<Reward>> fetchRewardList() async {
    final response = await _provider.fetchRewardList();
    return rewardFromJson(response.body);
  }

  Future<int?> fetchRewardPoints() async {
    final response = await _provider.fetchRewardPoints();
    final jsonResponse = jsonDecode(response.body) as Map<String, int>;
    return jsonResponse['points'];
  }
}

class NetworkError extends Error {}

import 'dart:convert';
import 'dart:io';

import 'package:betchya/logic/API_calls.dart';
import 'package:betchya/other_models/bets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class APIGetBets {
  final user = FirebaseAuth.instance.currentUser!;

  Future<List<Bet>> getBetList(String filter) async {
    final token = await user.getIdToken();
    final users = await http.get(
      Uri.parse('https://betcha-api-tirbceqy5q-uw.a.run.app/users'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    final currentUser = UserResponse.fromJson(
      jsonDecode(users.body) as Map<String, dynamic>,
    );
    final response = await http.get(
      Uri.parse(
          'https://betcha-api-tirbceqy5q-uw.a.run.app/users/${currentUser.id}/bets'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    var betList = <Bet>[];
    if (filter == 'All') {
      betList = betFromJson(response.body);
    } else if (filter == 'Current') {
      final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
      if (responseJson.isNotEmpty) {
        for (var i = 0; i < responseJson.length; i++) {
          if (responseJson[i] != null) {
            final map = responseJson[i] as Map<String, dynamic>;
            final date =
                DateTime.parse(map['date'].toString()).millisecondsSinceEpoch;
            final now = DateTime.now().millisecondsSinceEpoch;

            if (date > now) {
              betList.add(Bet.fromJson(map));
            }
          }
        }
      }
    } else if (filter == 'Past') {
      final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
      if (responseJson.isNotEmpty) {
        for (var i = 0; i < responseJson.length; i++) {
          if (responseJson[i] != null) {
            final map = responseJson[i] as Map<String, dynamic>;
            final date =
                DateTime.parse(map['date'].toString()).millisecondsSinceEpoch;
            final now = DateTime.now().millisecondsSinceEpoch;
            if (date < now) {
              betList.add(Bet.fromJson(map));
            }
          }
        }
      }
    }
    return betList;
  }
}

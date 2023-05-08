import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class APIAddBets {
  final user = FirebaseAuth.instance.currentUser!;

  Future<http.Response?>? addBet(
    String description,
    dynamic betLine,
    String teamLogo1,
    String teamLogo2,
    dynamic amount,
    DateTime date,
  ) async {
    final token = await user.getIdToken();
    final response = await http.get(
      Uri.parse('https://betcha-api-tirbceqy5q-uw.a.run.app/users'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    if (response.statusCode != 200) {
      return null;
    }
    final userResponse = jsonDecode(response.body);
    final userID = userResponse['id'];
    final betResponse = await http.post(
        Uri.parse(
            'https://betcha-api-tirbceqy5q-uw.a.run.app/users/$userID/bets'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
        body: jsonEncode(
          <String, dynamic>{
            'description': description,
            'betLine': betLine,
            'teamLogo1': teamLogo1,
            'teamLogo2': teamLogo2,
            'amount': double.parse(amount.toString()),
            'date': "${DateFormat("yyyy-MM-ddTHH:mm:ss").format(date)}Z",
          },
        ));
    // final test = jsonDecode(betResponse.body);
    return betResponse;
  }
}

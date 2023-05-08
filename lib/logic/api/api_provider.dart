import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

import '../API_calls.dart';

class ApiProvider {
  final String _baseUrl = 'https://betcha-api-tirbceqy5q-uw.a.run.app';
  final User? _firebaseUser = FirebaseAuth.instance.currentUser;

  Future<http.Response> fetchEventList() async {
    final response = await http.get(Uri.parse('$_baseUrl/events'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to load events");
    }
  }

  Future<http.Response> fetchRewardList() async {
    final response = await http.get(Uri.parse('$_baseUrl/rewards_options'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to load events");
    }
  }

  Future<http.Response> fetchRewardPoints() async {
    final token = await _firebaseUser?.getIdToken();
    final user = await APIWrangler().getMe();
    final response = await http.get(
      Uri.parse('$_baseUrl/users/${user?.id}/rewards'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to load reward points");
    }
  }
}

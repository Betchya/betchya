import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class APIWrangler {
  final user = FirebaseAuth.instance.currentUser!;

// Get current user's information from the database in a JSON
  Future<UserResponse?> getMe() async {
    // get token and construct request
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

    return UserResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }

  // Add new user to the database from app.  Return newly-created user's information in a JSON
  Future<UserResponse?> addMe(
      String firstName, String lastName, String birthdate) async {
    // Convert string date to format needed by server (ISO8601), add Z to end to handle fractional seconds
    const datePattern = 'mm/dd/yyyy';
    final parsedBirthdate = DateFormat(datePattern).parse(birthdate);
    final birthdate8601 =
        '${DateFormat("yyyy-MM-ddTHH:mm:ss").format(parsedBirthdate.toUtc())}Z';

    // get token and construct request
    final token = await user.getIdToken();
    final response = await http.post(
        Uri.parse('https://betcha-api-tirbceqy5q-uw.a.run.app/users'),
        // Send authorization headers to the backend.
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
        },
        body: jsonEncode(<String, dynamic>{
          'firstName': firstName,
          'lastName': lastName,
          'email': user.email,
          'firebaseID': user.uid,
          'birthdate': birthdate8601
        }));

    if (response.statusCode != 200) {
      return null;
    }
    return UserResponse.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  // Update user information on database.  Get first/last name from user, get remaining
  // information from existing entry
  Future<UserResponse?> updateName(String firstName, String lastName) async {
    // get token and construct request
    final token = await user.getIdToken();
    final currentInfo = await getMe();

    final response = await http.put(
        Uri.parse(
            'https://betcha-api-tirbceqy5q-uw.a.run.app/users/${currentInfo?.id}'),
        // Send authorization headers to the backend.
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
        },
        body: jsonEncode(<String, dynamic>{
          'firstName': firstName,
          'lastName': lastName,
          'email': currentInfo?.email,
          'firebaseID': currentInfo?.firebaseID,
          'birthdate': currentInfo?.birthdate
        }));

    if (response.statusCode != 200) {
      return null;
    }
    return UserResponse.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

// Update user information on database.  Get email from user, get remaining
  // information from existing entry
  Future<UserResponse?> updateEmail(String email) async {
    final user = FirebaseAuth.instance.currentUser!;

    // get token and construct request
    final token = await user.getIdToken();
    final currentInfo = await getMe();

    final response = await http.put(
        Uri.parse(
            'https://betcha-api-tirbceqy5q-uw.a.run.app/users/${currentInfo?.id}'),
        // Send authorization headers to the backend.
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
        },
        body: jsonEncode(<String, dynamic>{
          'firstName': currentInfo?.firstName,
          'lastName': currentInfo?.lastName,
          'email': email,
          'firebaseID': currentInfo?.firebaseID,
          'birthdate': currentInfo?.birthdate
        }));
    if (response.statusCode != 200) {
      return null;
    }
    await user.updateEmail(email);
    return UserResponse.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  // Get current user's Rewards object data as a JSON
  Future<UserRewards?> getRewards() async {
    final user = FirebaseAuth.instance.currentUser!;

    final token = await user.getIdToken();
    final userResponse = await getMe();

    final response = await http.get(
      Uri.parse(
          'https://betcha-api-tirbceqy5q-uw.a.run.app/users/${userResponse?.id}/rewards'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      return null;
    }

    return UserRewards.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }
}

// Struct for user data retrieved from server
class UserResponse {
  const UserResponse({
    required this.id,
    required this.firebaseID,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.birthdate,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'].toString(),
      firebaseID: json['firebaseID'].toString(),
      email: json['email'].toString(),
      firstName: json['firstName'].toString(),
      lastName: json['lastName'].toString(),
      birthdate: json['birthdate'].toString(),
    );
  }

  final String id;
  final String firebaseID;
  final String email;
  final String firstName;
  final String lastName;
  final String birthdate;
}

// Struct for user rewards data retrieved from server
class UserRewards {
  const UserRewards({required this.id, required this.points});

  factory UserRewards.fromJson(Map<String, dynamic> json) {
    return UserRewards(
      id: json['id'] as String,
      points: json['points'] as int,
    );
  }
  final String id;
  final int points;
}

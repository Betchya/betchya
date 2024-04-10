import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:betchya/amplify_configuration.dart';

abstract class AuthRepository
{
  //vars wait for assignment from server
  Future<void> signIn(String username, String password);
  Future<void> signOut();
  Future<bool> isAuthenticated();
  Future<String> getToken();
}

class AmplifyCognitoAuthRepository implements AuthRepository {
  @override
  Future<void> signIn(String username, String password) async {
    try {//wait for signin verification
      SignInResult result = await Amplify.Auth.signIn(username: username, password: password);
    } on AuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

    @override
    Future<void> signOut() async {
      try {
        await Amplify.Auth.signOut();
      } on AuthException catch (e) {
        print(e.message);
        throw e; // Handle sign out error
      }
    }

  @override
  Future<bool> isAuthenticated() async {
    try {
      var session = await Amplify.Auth.fetchAuthSession();
      return session.isSignedIn;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  Future<String> getToken() async
  {
    try {
      AuthSession session = await Amplify.Auth.fetchAuthSession();
      if (session is CognitoAuthSession && session.isSignedIn) {
        return session.userPoolTokens?.idToken ?? '';
      }
      throw Exception('User is not signed in');
    } catch (e) {
      print(e);
      throw e;
    }
  }
}

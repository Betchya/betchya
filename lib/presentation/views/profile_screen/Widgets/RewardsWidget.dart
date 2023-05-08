import 'package:betchya/logic/authentication/authentication_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:betchya/logic/API_calls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Waits for user to be authenticated, then diplays first name of current user with any prefix/suffix specified.
class RewardsWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return FutureBuilder<UserRewards?>(
        future: APIWrangler().getRewards(),
        builder: (context, AsyncSnapshot<UserRewards?> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return Text("${snapshot.data?.points} points available");
            } else {
              return const Text("NO REWARDS YA SHMUCK");
            }
          } else {
            return Column(children: const [CircularProgressIndicator()]);
          }
        });
  }
}
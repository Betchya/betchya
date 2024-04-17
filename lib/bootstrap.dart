import 'dart:async';
import 'dart:developer';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:betchya/amplify_configuration.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:betchya/amplify_configuration.dart';
// import 'package:betchya/models/ModelProvider.dart';
import 'package:betchya/cognito_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> _configureAmplify() async {
  try {
    print('attempting to connect to Amplify...');
    await Amplify.addPlugins([AmplifyAuthCognito(),AmplifyAPI()]);
    await Amplify.configure(amplifyconfig);
    print('Amplify configured successfully');
    // Attempt to fetch the current auth session
    try {
      final result = await Amplify.Auth.fetchAuthSession();
      safePrint('User is signed in: ${result.isSignedIn}');
    } on AuthException catch (e) {
      safePrint('Error retrieving auth session: ${e.message}');
    }

  } catch (e) {
    print('An error occurred configuring Amplify: $e');
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  print('configuring Amplify...');
  await _configureAmplify();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

  await runZonedGuarded(
    () async => runApp(await builder()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

import 'dart:async';
import 'dart:developer';
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

// TODO(Josh-Sanford): migrate to amplify gen 2
// Future<void> _configureAmplify() async {
// try {
// final amplifyApi = AmplifyAPI(modelProvider: ModelProvider.instance);
// await Amplify.addPlugin(amplifyApi);

// await Amplify.addPlugins([AmplifyAuthCognito()]);

// await Amplify.configure(amplifyconfig);
// } on Exception catch (e) {
//   safePrint('An error occurred configuring Amplify: $e');
// }
// }

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  // await _configureAmplify();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

  await runZonedGuarded(
    () async => runApp(await builder()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

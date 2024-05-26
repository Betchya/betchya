import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:betchya/amplifyconfiguration.dart';
import 'package:betchya/bootstrap.dart';
import 'package:betchya/logic/events/events_bloc.dart';
import 'package:betchya/logic/navigation/navigation_cubit.dart';
import 'package:betchya/logic/points/points_cubit.dart';
import 'package:betchya/logic/rewards/rewards_bloc.dart';
import 'package:betchya/models/ModelProvider.dart';
import 'package:betchya/presentation/views/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() {
  bootstrap(MyApp.new);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  // Configure for using Amplify for GraphQL/AppSync API
  // Unsure how it works exactly, find information at Amplify documentation for Flutter Gen 1
  Future<void> _configureAmplify() async {
    final api = AmplifyAPI(modelProvider: ModelProvider.instance);
    await Amplify.addPlugin(api);

    try {
      await Amplify.configure(amplifyconfig);
    } on Exception catch (e) {
      safePrint('An error occurred configuring Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const RootScreen()),
      ],
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider<EventsBloc>(
          create: (context) => EventsBloc()..add(GetEventsList()),
        ),
        BlocProvider<RewardsBloc>(
          create: (context) => RewardsBloc()..add(GetRewardsList()),
        ),
        BlocProvider<PointsCubit>(
          create: (context) => PointsCubit()..update(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: goRouter,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color(0xff2C1D57),
              statusBarIconBrightness: Brightness.light,
            ),
          ),
        ),
      ),
    );
  }
}

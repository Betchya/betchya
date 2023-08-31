import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:betchya/bootstrap.dart';
import 'package:betchya/logic/events/events_bloc.dart';
import 'package:betchya/logic/navigation/navigation_cubit.dart';
import 'package:betchya/logic/points/points_cubit.dart';
import 'package:betchya/logic/rewards/rewards_bloc.dart';
import 'package:betchya/presentation/views/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() {
  bootstrap(MyApp.new);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const RootScreen())
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
      child: Authenticator(
        child: MaterialApp.router(
          builder: Authenticator.builder(),
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
      ),
    );
  }
}

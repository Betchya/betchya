import 'package:betchya/bootstrap.dart';
import 'package:betchya/logic/authentication/auth_repository/auth_repository.dart';
import 'package:betchya/logic/authentication/authentication_bloc/auth_bloc.dart';
import 'package:betchya/logic/events/events_bloc.dart';
import 'package:betchya/logic/navigation/navigation_cubit.dart';
import 'package:betchya/logic/points/points_cubit.dart';
import 'package:betchya/logic/rewards/rewards_bloc.dart';
import 'package:betchya/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  bootstrap(() => const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.appRouter});

  final AppRouter? appRouter;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NavigationCubit>(
            create: (context) => NavigationCubit(),
          ),
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context),
            ),
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
        child: MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Color(0xff2C1D57),
                statusBarIconBrightness: Brightness.light,
              ),
            ),
          ),
          onGenerateRoute: appRouter?.onGenerateRoute,
        ),
      ),
    );
  }
}

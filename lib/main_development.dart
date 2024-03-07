import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:betchya/logic/authentication/auth_repository/auth_repository.dart';
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
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:betchya/amplify_configuration.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await configureAmplify();
  bootstrap(() => const MyApp());
}

Future<void> configureAmplify() async
{
  final authPlugin = AmplifyAuthCognito();
  final apiPlugin = AmplifyAPI();

  try
  {
    Amplify.addPlugins([authPlugin, apiPlugin]);
    await Amplify.configure(amplifyconfig);
  } catch (e)
  {
    print("--ERROR: Amplify could not be configured at \($e)");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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


/*import 'package:betchya/bootstrap.dart';
//import 'package:betchya/logic/authentication/auth_repository/auth_repository.dart';
//import 'package:betchya/logic/authentication/authentication_bloc/auth_bloc.dart';
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
  //runApp(MyApp());
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
*/
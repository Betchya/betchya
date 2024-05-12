import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart' as AmplifyCognito;
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:betchya/presentation/views/root_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'amplify_configuration.dart';
import 'amplifyconfiguration.dart';
import 'cognito_manager.dart';
import 'logic/events/events_bloc.dart';
import 'logic/navigation/navigation_cubit.dart';
import 'logic/points/points_cubit.dart';
import 'logic/rewards/rewards_bloc.dart';
/*
  TODO:
    1. Flesh out Custom Authenticator to include sign-up page
    2. Add functionality to redirect user to home page after signing in

  COMPLETE
    1. migrate main_auth functionalities to main_development
    2. connect sign in to presentation/views/login

  LUCAS:
    1. Migrated the code from main_auth into a new class (CustomAuthenticator) within main_development
    (should make Custom Authenticator a view later on)
    2. Removed AWS default authenticator screen and made a new one that's for more customizable
    3. Made router redirect to sign-in page if the user is signed out
    4. I think presentation/views/login is too deprecated (in terms of current codebase) to functionally
       use anymore- we should just build a new one from Custom Authenticator
 */
bool isUserSignedIn = false;

// Future<void> fetchCognitoAuthSession() async {
//
//   try {
//     // final cognitoPlugin = Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
//     // final result = await cognitoPlugin.fetchAuthSession();
//     // final identityId = result.identityIdResult.value;
//     // safePrint("Current user's identity ID: $identityId");
//   } on AuthException catch (e) {
//     safePrint('Error retrieving auth session: ${e.message}');
//   }
// }

Future<void> checkUserStatus() async {
  try {
    final session = await Amplify.Auth.fetchAuthSession();
    isUserSignedIn = session.isSignedIn;
    print("isUserSignedIN: $isUserSignedIn");
  } catch (e) {
    print("Error checking sign in status: $e");
  }
}

Future<void> _configureAmplify() async {
  try {
    await Amplify.addPlugin(AmplifyCognito.AmplifyAuthCognito());
    await Amplify.configure(amplifyconfig);
    safePrint('Successfully configured');
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await _configureAmplify();
  // await checkUserStatus();
  // await bootstrap(() => const MyApp());
  // runApp(const MyApp());
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await _configureAmplify();
    runApp(const MyApp());
  } on AmplifyException catch (e) {
    runApp(Text("Error configuring Amplify: ${e.message}"));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          redirect: (context, state) => isUserSignedIn ? null : '/signup',
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) => CustomAuthenticator(),
        ),
        GoRoute(
          path: '/root',
          builder: (context, state) => const RootScreen(),
        ),
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

class CustomAuthenticator extends StatefulWidget {
  @override
  _CustomAuthenticatorState createState() => _CustomAuthenticatorState();
}

class _CustomAuthenticatorState extends State<CustomAuthenticator> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late final CognitoManager _cognitoManager;

  @override
  void initState() {
    super.initState();
    _cognitoManager = CognitoManager();
    _initCognitoManager();
  }

  Future<void> _initCognitoManager() async {
    await _cognitoManager.init();
  }


  void _signIn() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      await _cognitoManager.signIn(email, password);

      AmplifyCognito.CognitoAuthSession session = await Amplify.Auth.fetchAuthSession() as AmplifyCognito.CognitoAuthSession;
      final result = await Amplify.Auth.fetchAuthSession();
      safePrint('Is User Signed in: ${result.isSignedIn}');

      if (session.isSignedIn) {
        print("User is signed in!");

        //LUCAS: Accessing and printing the ID and Access Tokens
        print("ID Token: ${session.userPoolTokens?.idToken}");
        print("Access Token: ${session.userPoolTokens?.accessToken}");
      }

      //DefaultTabController.of(context).animateTo(1);
    } on CognitoServiceException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    } catch (e) {
      print('An error occurred fetching auth session: $e');
    }
  }


  void _signUp() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      await _cognitoManager.signUp(email, password);
      //LUCAS: add stuff for the router here
    } on CognitoServiceException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _signIn,
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

//
//  OLD CODE FOR AWS DEFAULT AUTHENTICATOR (left for reference / just in case)
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   //await configureAmplify();
//   print('Setting up Amplify Bootstrap...');
//   bootstrap(() => const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final goRouter = GoRouter(
//       routes: [
//         GoRoute(path: '/', builder: (context, state) => const RootScreen()),
//       ],
//     );
//
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<NavigationCubit>(
//           create: (context) => NavigationCubit(),
//         ),
//         BlocProvider<EventsBloc>(
//           create: (context) => EventsBloc()..add(GetEventsList()),
//         ),
//         BlocProvider<RewardsBloc>(
//           create: (context) => RewardsBloc()..add(GetRewardsList()),
//         ),
//         BlocProvider<PointsCubit>(
//           create: (context) => PointsCubit()..update(),
//         ),
//       ],
//       child: Authenticator(
//         child: MaterialApp.router(
//           builder: Authenticator.builder(),
//           routerConfig: goRouter,
//           theme: ThemeData(
//             appBarTheme: const AppBarTheme(
//               systemOverlayStyle: SystemUiOverlayStyle(
//                 statusBarColor: Color(0xff2C1D57),
//                 statusBarIconBrightness: Brightness.light,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
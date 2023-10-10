import 'package:betchya/presentation/views/events_screen/events_screen.dart';
import 'package:betchya/presentation/views/home_screen/home_screen.dart';
// import 'package:betchya/presentation/views/login/login_screen.dart';
import 'package:betchya/presentation/views/profile_screen/profile_screen.dart';
import 'package:betchya/presentation/views/promotions_screen/promotions_screen.dart';
import 'package:betchya/presentation/views/root_screen.dart';
import 'package:betchya/presentation/views/sports_book_screen/sports_book_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case '/':
      //   return MaterialPageRoute(
      //     builder: (_) => const LoginScreen(),
      //   );
      case '/root':
        return MaterialPageRoute(
          builder: (_) => const RootScreen(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/promotions':
        return MaterialPageRoute(
          builder: (_) => const PromotionsScreen(),
        );
      case '/sportsbook':
        return MaterialPageRoute(
          builder: (_) => const SportsbookScreen(),
        );
      case '/events':
        return MaterialPageRoute(
          builder: (_) => const EventsScreen(),
        );
      case '/profile':
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const RootScreen(),
        );
    }
  }
}

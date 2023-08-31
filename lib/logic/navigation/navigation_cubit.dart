import 'package:betchya/logic/navigation/constants/nav_bar_items.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(const NavigationState(NavbarItem.home, 0));
        break;
      case NavbarItem.promotions:
        emit(const NavigationState(NavbarItem.promotions, 1));
        break;
      case NavbarItem.sportsbook:
        emit(const NavigationState(NavbarItem.sportsbook, 2));
        break;
      case NavbarItem.events:
        emit(const NavigationState(NavbarItem.events, 3));
        break;
      case NavbarItem.profile:
        emit(const NavigationState(NavbarItem.profile, 4));
        break;
    }
  }
}

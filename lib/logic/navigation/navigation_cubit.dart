import 'package:betchya/logic/navigation/constants/nav_bar_items.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(NavigationState(NavbarItem.home, 0));
        break;
      case NavbarItem.promotions:
        emit(NavigationState(NavbarItem.promotions, 1));
        break;
      case NavbarItem.sportsbook:
        emit(NavigationState(NavbarItem.sportsbook, 2));
        break;
      case NavbarItem.events:
        emit(NavigationState(NavbarItem.events, 3));
        break;
      case NavbarItem.profile:
        emit(NavigationState(NavbarItem.profile, 4));
        break;
    }
  }
}

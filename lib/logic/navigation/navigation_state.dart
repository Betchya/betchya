part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  const NavigationState(this.navbarItem, this.index);
  final NavbarItem navbarItem;
  final int index;

  @override
  List<Object> get props => [navbarItem, index];
}

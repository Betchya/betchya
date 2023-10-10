import 'package:betchya/logic/navigation/constants/nav_bar_items.dart';
import 'package:betchya/logic/navigation/navigation_cubit.dart';
import 'package:betchya/presentation/custom_icons.dart';
import 'package:betchya/presentation/views/events_screen/events_screen.dart';
import 'package:betchya/presentation/views/home_screen/home_screen.dart';
import 'package:betchya/presentation/views/profile_screen/profile_screen.dart';
import 'package:betchya/presentation/views/promotions_screen/promotions_screen.dart';
import 'package:betchya/presentation/views/sports_book_screen/sports_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: state.index,
            selectedItemColor: const Color(0xFF1D0D4B),
            unselectedItemColor: const Color(0xFF8E8E93),
            showUnselectedLabels: true,
            selectedFontSize: 12,
            iconSize: 23,
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(CustomIcons.home),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(CustomIcons.coupons),
                ),
                label: 'Coupons',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(CustomIcons.sportsbook),
                ),
                label: 'Sports Book',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(CustomIcons.events),
                ),
                label: 'Events',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(CustomIcons.profile),
                ),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              if (index == 0) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.home);
              } else if (index == 1) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.promotions);
              } else if (index == 2) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.sportsbook);
              } else if (index == 3) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.events);
              } else if (index == 4) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.profile);
              }
            },
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.home) {
            return const HomeScreen();
          } else if (state.navbarItem == NavbarItem.promotions) {
            return const PromotionsScreen();
          } else if (state.navbarItem == NavbarItem.sportsbook) {
            return const SportsbookScreen();
          } else if (state.navbarItem == NavbarItem.events) {
            return const EventsScreen();
          } else if (state.navbarItem == NavbarItem.profile) {
            return const ProfileScreen();
          }
          return Container();
        },
      ),
    );
  }
}

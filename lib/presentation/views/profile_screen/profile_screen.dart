import 'package:betchya/logic/points/points_cubit.dart';
import 'package:betchya/presentation/views/home_screen/widgets/name_widget.dart';
import 'package:betchya/presentation/views/profile_screen/profile_detail_screen.dart';
import 'package:betchya/presentation/views/profile_screen/widgets/my_bets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C1D57),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const WholeNameWidget(),
              const SizedBox(
                height: 50,
              ),
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.account_box,
                    size: 40,
                    color: Color(0xff00B498),
                  ),
                  title: const Text(
                    'Profile Settings',
                  ),
                  subtitle: const Text(
                    'Password, Email, Name',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<ProfileDetail>(
                        builder: (context) {
                          return const ProfileDetail();
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.star,
                    size: 40,
                    color: Color(0xff00B498),
                  ),
                  title: const Text(
                    'Redeem Your Rewards',
                  ),
                  subtitle: BlocBuilder<PointsCubit, int>(
                    builder: (context, state) {
                      return Text('$state Points Available');
                    },
                  ),
                  onTap: () {},
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.calendar_month,
                    size: 40,
                    color: Color(0xff00B498),
                  ),
                  title: const Text(
                    'My Events',
                  ),
                  onTap: () {},
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.card_membership,
                    size: 40,
                    color: Color(0xff00B498),
                  ),
                  title: const Text(
                    'Current Bets',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<MyBets>(
                        builder: (context) => const MyBets(filter: 'Current'),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.money,
                    color: Color(0xff00B498),
                    size: 40,
                  ),
                  title: const Text(
                    'Past Bets',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<MyBets>(
                        builder: (context) => const MyBets(filter: 'Past'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

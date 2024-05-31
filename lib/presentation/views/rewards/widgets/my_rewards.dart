import 'package:betchya/logic/points/points_cubit.dart';
// import 'package:betchya/logic/rewards/rewards_bloc.dart';
// import 'package:betchya/presentation/views/rewards/widgets/reward_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyRewards extends StatelessWidget {
  const MyRewards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Points available',
            style: TextStyle(
              fontSize: 10,
              color: Color(0xFF595959),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Row(
              children: [
                BlocBuilder<PointsCubit, int>(
                  builder: (context, state) {
                    return Text(
                      '$state ',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  },
                ),
                const Icon(
                  Icons.star,
                  color: Color(0xffFCCB00),
                  size: 25,
                ),
              ],
            ),
          ),
          const Text(
            'See additional details by selecting a reward from below. '
            'Some rewards may need to be redeemed in person.',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF808084),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              'Rewards',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Expanded(
            child: Placeholder() // _buildRewardList(),
          ),
        ],
      ),
    );
  }

  // Widget _buildRewardList() {
  //   return BlocConsumer<RewardsBloc, RewardsState>(
  //     listener: (context, state) {
  //       if (state is RewardsError) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text(state.message!),
  //           ),
  //         );
  //       }
  //     },
  //     builder: (context, state) {
  //       if (state is RewardsLoading) {
  //         return const Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       } else if (state is RewardsError) {
  //         return const Text('Error');
  //       } else if (state is RewardsLoaded) {
  //         return ListView.builder(
  //           // padding: const EdgeInsets.only(top: 15),
  //           clipBehavior: Clip.antiAlias,
  //           itemCount: state.rewards.length,
  //           itemBuilder: (context, index) {
  //             return RewardCard(reward: state.rewards[index]);
  //           },
  //         );
  //       } else {
  //         return Text(state.toString());
  //       }
  //     },
  //   );
  // }
}

// import 'package:betchya/other_models/reward.dart';
import 'package:betchya/presentation/views/rewards/widgets/reward_details.dart';
import 'package:flutter/material.dart';

class RewardCard extends StatelessWidget {
  const RewardCard({super.key}); //, required this.reward});

  // final Reward reward;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .12,
      child: GestureDetector(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute<RewardDetails>(
              builder: (context) => const RewardDetails(
                // reward: reward,
              ),
            ),
          ),
        },
        child: Card(
          elevation: 3,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          child: const Row(
            children: [
              Expanded(
                flex: 2,
                child: ColoredBox(
                  color: Color(0xff00B498),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'placeholder', // reward.points.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffFCCB00),
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      'reward.name',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

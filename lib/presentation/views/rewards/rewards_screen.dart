import 'package:betchya/presentation/views/rewards/widgets/my_rewards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xff2C1D57),
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: const Icon(
                Icons.close,
                color: Color(0xFFA0A0A0),
              ),
            )
          ],
          bottom: const TabBar(
            labelPadding: EdgeInsets.all(10),
            indicatorColor: Color(0xff00B498),
            labelColor: Color(0xff00B498),
            unselectedLabelColor: Color(0xFFA0A0A0),
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            tabs: [
              Text('My Rewards'),
              Text('History'),
              Text('Earning Points'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MyRewards(),
            Placeholder(),
            Placeholder(),
          ],
        ),
      ),
    );
  }
}

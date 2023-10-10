import 'package:betchya/presentation/views/home_screen/widgets/name_widget.dart';
import 'package:betchya/presentation/views/profile_screen/update_email.dart';
import 'package:betchya/presentation/views/profile_screen/update_name.dart';
import 'package:betchya/presentation/views/profile_screen/widgets/current_profile_widget.dart';
import 'package:flutter/material.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff2C1D57),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight * .15),
          ),
          const WholeNameWidget(),
          const FormattedEmailWidget(),
          const SizedBox(
            height: 50,
          ),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.account_box,
              ),
              title: const Text('Change name'),
              subtitle: const ProfileNameWidget(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<UpdateName>(
                    builder: (context) {
                      return const UpdateName();
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Change email'),
              subtitle: const EmailWidget(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<UpdateEmail>(
                    builder: (context) {
                      return const UpdateEmail();
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.password,
              ),
              title: const Text('Change Password'),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

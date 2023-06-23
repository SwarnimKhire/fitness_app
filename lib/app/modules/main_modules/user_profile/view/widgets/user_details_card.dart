import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';
import 'package:nurasoft_app/app/modules/main_modules/user_profile/view_model/user_profile_view_model.dart';

class UserDetailCard extends StatelessWidget {
  const UserDetailCard({super.key, required this.viewModel});
  final UserProfileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[100],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextBLB("Email"),
                TextBLB(viewModel.user?.email ?? "admin@gmail.com",
                    color: greyColor),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextBLB("Phone"),
                TextBLB(
                  viewModel.user?.mobile ?? "+919876543210",
                  color: greyColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

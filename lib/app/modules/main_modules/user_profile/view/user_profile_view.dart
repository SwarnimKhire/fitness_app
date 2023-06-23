import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';
import 'package:nurasoft_app/app/modules/main_modules/user_profile/view/widgets/single_details_card.dart';
import 'package:nurasoft_app/app/modules/main_modules/user_profile/view/widgets/user_details_card.dart';
import 'package:nurasoft_app/app/modules/main_modules/user_profile/view_model/user_profile_view_model.dart';
import 'package:nurasoft_app/app/routes/route_functions.dart';
import 'package:nurasoft_app/app/routes/route_names.dart';
import 'package:nurasoft_app/main.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppbar(
        title: "User Profile",
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Consumer<UserProfileViewModel>(
            builder: (context, viewModel, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  "https://xsgames.co/randomusers/avatar.php?g=male",
                  height: 100,
                ),
              ),
              const SizedBox(height: 20),
              HeadingH5(viewModel.user?.name ?? "User Name"),
              const SizedBox(height: 24),
              UserDetailCard(viewModel: viewModel),
              const SizedBox(height: 20),
               SingleDetailCard(
                iconData: Icons.logout,
                title: "Log Out",
                onTap: () {
                  sharedPreferences.remove("user");
                context.pushNamed(AppRoutes.login);
                },
              ),
              const Spacer(),
              const SingleDetailCard(
                iconData: Icons.keyboard_alt,
                title: "Developed By:",
                subTitle: "Swarnim Khire",
              ),
            ],
          );
        }),
      ),
    );
  }
}

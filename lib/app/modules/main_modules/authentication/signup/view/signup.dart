import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/signup/view/signup_strings.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/signup/view_model/signup_view_model.dart';
import 'package:nurasoft_app/app/routes/routes.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppbar(),
      body: Consumer<SignupViewModel>(builder: (context, viewModel, child) {
        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const HeadingH4(signUpHeading),
            const SizedBox(height: 32),
            MainTextfield(
              hintText: enterFullname,
              controller: viewModel.nameController,
            ),
            const SizedBox(height: 16),
            MainTextfield(
              hintText: enterEmail,
              controller: viewModel.emailController,
            ),
            const SizedBox(height: 16),
            MainTextfield(
              hintText: enterPhone,
              controller: viewModel.phoneController,
            ),
            const SizedBox(height: 16),
            MainTextfield(
              hintText: enterpassword,
              obscureText: true,
              controller: viewModel.passwordController,
            ),
            const SizedBox(height: 24),
            MainTextButton(
              text: signUp,
              onTap: () {
                viewModel.validateInput((value) {
                  if (value) {
                    context.pushNamed(AppRoutes.home);
                  }
                });
              },
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextBLR(alreadyAccount, color: greyColor),
                TextBLB(signIn, color: secondaryColor)
              ],
            ),
          ],
        );
      }),
    );
  }
}

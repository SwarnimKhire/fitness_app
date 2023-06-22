import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nurasoft_app/app/core/core.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/login/view/login_strings.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/login/view_model/login_view_model.dart';
import 'package:nurasoft_app/app/routes/routes.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: const MainAppbar(),
      body: Consumer<LoginViewModel>(builder: (context, viewModel, child) {
        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const SizedBox(height: kToolbarHeight),
            const HeadingH4(heading),
            const SizedBox(height: 8),
            const TextBLR(body, color: greyColor),
            const SizedBox(height: 32),
            MainTextfield(
              hintText: hintText,
              controller: viewModel.phoneController,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            MainTextfield(
              hintText: passwordText,
              obscureText: true,
              controller: viewModel.passwordController,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: const TextBLB(forgotPassword, color: blackColor),
                  onTap: () => context.pushNamed(AppRoutes.recoverPassword),
                ),
              ],
            ),
            const SizedBox(height: 24),
            MainTextButton(
                text: signIn,
                onTap: () {
                  viewModel.validateLogin((value) {
                    if (value) {
                      context.pushNamed(AppRoutes.home);
                    } else {
                      Fluttertoast.showToast(msg: "Invalid User Credentials");
                    }
                  });
                }),
            const SizedBox(height: 15),
            const Row(
              children: [
                MainDivider(),
                SizedBox(width: 10),
                TextBMR("OR"),
                SizedBox(width: 10),
                MainDivider(ltd: false)
              ],
            ),
            const SizedBox(height: 15),
            MainTextButton(
              text: signInOtp,
              isHolo: true,
              onTap: () => context.pushNamed(AppRoutes.verifyotp,
                  arguments: {"phoneNumber": ""}),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextBLR(noAccount, color: greyColor),
                GestureDetector(
                  child: const TextBLB(signUp, color: secondaryColor),
                  onTap: () => context.pushNamed(AppRoutes.signup),
                )
              ],
            ),
          ],
        );
      }),
    ).keyOut(context);
  }
}

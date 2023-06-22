import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/password_reset/viiew/password_reset_string.dart';

class PasswordReset extends StatelessWidget {
  const PasswordReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HeadingH4(createPassword),
            SizedBox(height: 12),
            TextBLR(passwordResetBody),
            SizedBox(height: 32),
            MainTextfield(
              hintText: newPassword,
              obscureText: true,
            ),
            SizedBox(height: 16),
            MainTextfield(
              hintText: confirmPassword,
              obscureText: true,
            ),
            Spacer(),
            MainTextButton(text: createPasswordBtn)
          ],
        ),
      ),
    );
  }
}

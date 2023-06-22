import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/password_recovery/view/password_recovery_string.dart';

import '../../../../../core/core.dart';

class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24)
            .add(const EdgeInsets.only(top: 35, bottom: 24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(AssetSvg.lock),
            const SizedBox(height: 27),
            const HeadingH4(heading),
            const SizedBox(height: 12),
            const TextBLR(body),
            const SizedBox(height: 32),
            const MainTextfield(hintText: email),
            const Spacer(),
            const MainTextButton(text: sendEmail),
          ],
        ),
      ),
    );
  }
}

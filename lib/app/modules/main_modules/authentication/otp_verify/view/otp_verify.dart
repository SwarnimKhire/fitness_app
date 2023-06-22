import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/routes/routes.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:nurasoft_app/app/core/core.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/otp_verify/view/otp_verify_strings.dart';

class OtpVerify extends StatelessWidget {
  const OtpVerify({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadingH4(verifyItsYou),
            const SizedBox(height: 12),
            TextBLR(bodyMessage(phoneNumber)),
            const SizedBox(height: 32),
            OtpPinField(
              otpPinFieldDecoration: OtpPinFieldDecoration.custom,
              otpPinFieldStyle: const OtpPinFieldStyle(
                defaultFieldBackgroundColor: lightGreyColor,
                activeFieldBackgroundColor: lightGreyColor,
                activeFieldBorderColor: primaryColor,
                defaultFieldBorderColor: Colors.transparent,
                fieldBorderRadius: 12,
              ),
              onSubmit: (text) {},
              onChange: (text) {},
              showCursor: false,
              maxLength: 5,
            ),
            const SizedBox(height: 32),
            const Center(
                child: TextBLB(
              resendCode,
              color: secondaryColor,
            )),
            const Spacer(),
            MainTextButton(
              text: confirm,
              onTap:() => context.pushNamed(AppRoutes.home),
              
            )
          ],
        ),
      ),
    );
  }
}

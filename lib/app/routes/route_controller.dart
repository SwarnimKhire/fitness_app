import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/login/view/login.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/login/view_model/login_view_model.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/otp_verify/view/otp_verify.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/password_recovery/view/password_recovery.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/password_reset/viiew/password_reset.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/signup/view/signup.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/signup/view_model/signup_view_model.dart';
import 'package:nurasoft_app/app/modules/main_modules/home/view/home.dart';
import 'package:nurasoft_app/app/routes/route_names.dart';
import 'package:provider/provider.dart';

Route<dynamic> controller(RouteSettings routeSettings) {
  print(routeSettings.name);
  switch (routeSettings.name) {
    case AppRoutes.login:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
                child: const LoginScreen(),
                create: (context) => LoginViewModel(),
              ));
    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case AppRoutes.signup:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
                child: const SignUpScreen(),
                create: (context) => SignupViewModel(),
              ));
    case AppRoutes.recoverPassword:
      return MaterialPageRoute(builder: (context) => const PasswordRecovery());
    case AppRoutes.resetPassword:
      return MaterialPageRoute(builder: (context) => const PasswordReset());
    case AppRoutes.verifyotp:
      return MaterialPageRoute(
          builder: (context) => OtpVerify(
              phoneNumber: (routeSettings.arguments as Map)["phoneNumber"]));
    default:
      throw ("This route name does not exist");
  }
}

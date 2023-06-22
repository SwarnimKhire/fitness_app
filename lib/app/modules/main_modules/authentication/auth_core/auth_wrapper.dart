import 'package:nurasoft_app/app/routes/routes.dart';
import 'package:nurasoft_app/main.dart';

String isUserLoggedIn() {
  String? userstring = sharedPreferences.getString("user");
  if (userstring != null) {
    return AppRoutes.home;
  } else {
    return AppRoutes.login;
  }
}

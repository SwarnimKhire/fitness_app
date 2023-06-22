import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/auth_core/auth_wrapper.dart';
import 'package:nurasoft_app/app/routes/route_controller.dart' as route;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  initialRoute = isUserLoggedIn();
  runApp(const MyApp());
}

late String initialRoute;
late SharedPreferences sharedPreferences;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: whiteColor),
      initialRoute: initialRoute,
      onGenerateRoute: route.controller,
    );
  }
}

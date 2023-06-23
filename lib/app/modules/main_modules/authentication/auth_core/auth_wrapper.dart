import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/auth_core/models/user_model.dart';
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

String addFood() {
  String? foodstring = sharedPreferences.getString("food");
  if (foodstring != null) {
    return AppRoutes.foodTracker;
  } else {
    print('add void');
    return AppRoutes.foodpage;
    
  }
}

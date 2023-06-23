import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/auth_core/models/user_model.dart';
import 'package:nurasoft_app/main.dart';

class UserProfileViewModel extends ChangeNotifier {
  String? userString = sharedPreferences.getString("user");
  User? user;
  initUserData() {
    if ((userString ?? "").isNotEmpty) {
      user = User.fromMap(jsonDecode(userString ?? ""));
    }
  }
}

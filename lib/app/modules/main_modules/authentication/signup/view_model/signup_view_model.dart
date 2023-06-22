// import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/auth_core/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../auth_core/web_services/user_services.dart';

class SignupViewModel extends ChangeNotifier {
  final UserService _userService = UserService();

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  signUp() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final User? user = await _userService.insertUser(User(
        name: nameController.text,
        password: passwordController.text,
        email: emailController.text,
        mobile: phoneController.text));
    if (user != null) {
      pref.setString("user", jsonEncode(user.toMap()));
      return true;
    }
    return false;
  }

  validateInput(void Function(bool)? signupCallback) async {
    if (nameController.text.isEmpty ||
        nameController.text.length < 3 ||
        !nameController.text.contains(" ")) {
      Fluttertoast.showToast(msg: "Enter full name");
    } else if (phoneController.text.length != 10) {
      Fluttertoast.showToast(msg: "Enter 10 digits");
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text)) {
      Fluttertoast.showToast(msg: "Enter valid email");
    } else if (passwordController.text.length < 8) {
      Fluttertoast.showToast(msg: "Length should be 8");
    } else {
      signupCallback?.call(await signUp());
      
    }
  }
}

// import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/auth_core/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../auth_core/web_services/user_services.dart';

class LoginViewModel extends ChangeNotifier {
  final UserService _userService = UserService();

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginWithPassword() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final User? user =
        await _userService.getUserByPhoneNumber(phoneController.text);
    if (user != null && user.password == passwordController.text) {
      pref.setString("user", jsonEncode(user.toMap()));
      return true;
    }
    return false;
  }

  loginWithOtp() {}

  validateLogin(void Function(bool)? logincallBack)async{
    if(phoneController.text.length != 10) {
      Fluttertoast.showToast(msg: "Enter 10 digits");}
      else if(passwordController.text.length < 8) {
      Fluttertoast.showToast(msg: "Length should be 8");}
      else{
        logincallBack?.call(await loginWithPassword());
      }
  }
  }


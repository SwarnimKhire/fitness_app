import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/modules/main_modules/trackers/food_tracker/models/food_model.dart';
import 'package:nurasoft_app/app/modules/main_modules/trackers/food_tracker/view/food_card.dart';
import 'package:nurasoft_app/app/modules/main_modules/trackers/food_tracker/view/food_page.dart';
import 'package:nurasoft_app/app/modules/main_modules/trackers/food_tracker/webservice/food_tracker_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodViewModel extends ChangeNotifier {
  final FoodTracker _foodTracker = FoodTracker();
  final FoodPage foodPage = FoodPage();
  insertFood() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final Food? food = await _foodTracker.insertFood(Food(foodName: indianFoods.first));
    if (food != null && food.foodName == indianFoods.first) {
      pref.setString("food", jsonEncode(food.toMap()));
      return true;
    }
    return false;
  }
}

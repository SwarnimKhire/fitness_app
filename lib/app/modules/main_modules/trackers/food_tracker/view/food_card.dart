import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/theme/color_theme.dart';
import 'package:nurasoft_app/app/modules/helper_modules/texts/body_medium_bold.dart';
import 'package:nurasoft_app/app/modules/helper_modules/texts/body_small_medium.dart';
import 'package:nurasoft_app/app/routes/routes.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: foodType.length,
          itemBuilder: (context, index) {
            return Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              height: 75,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.yellow[50]),
              child: ListTile(
                title: TextBMB(foodType[index]),
                subtitle: const TextBSM('Count your calories here.'),
                trailing: GestureDetector(
                  onTap: () {
                    context.pushNamed(AppRoutes.foodpage);
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: blackColor),
                    child: const Icon(
                      Icons.add,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

List<String> foodType = ['BreakFast', 'Lunch', 'Snack', 'Dinner'];

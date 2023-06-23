import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';
import 'package:nurasoft_app/app/modules/helper_modules/appbar/main_appbar.dart';
import 'package:nurasoft_app/app/modules/main_modules/trackers/common_widgets/center_progress.dart';
import 'package:nurasoft_app/app/modules/main_modules/trackers/common_widgets/week_calender.dart';
import 'package:nurasoft_app/app/routes/route_functions.dart';
import 'package:nurasoft_app/app/routes/route_names.dart';

class FoodTrackerView extends StatelessWidget {
  const FoodTrackerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const WeekCalender(
            activeBorderColor: Colors.yellow,
          ),
          const SizedBox(height: 130),
          const CenterProgress(
            strokeWidth: 6,
            iconData: Icons.local_dining_rounded,
            title: "Calories intake",
            color: Colors.yellow,
            iconColor: Colors.yellow,
            progressValue: 0.3,
            valueText: "127 / 327 Cal",
            size: 180,
          ),
          const SizedBox(height: 200.0),
          TextButton(
              onPressed: () {
                context.pushNamed(AppRoutes.foodpage);
              },
              child: Icon(
                Icons.add_box_outlined,
                size: 55,
                color: Colors.yellow[300],
              )),
          const Text(
            "Add food items",
            style: TextStyle(
                color: blackColor, fontWeight: FontWeight.w600, fontSize: 18),
          )
        ],
      ),
    );
  }
}

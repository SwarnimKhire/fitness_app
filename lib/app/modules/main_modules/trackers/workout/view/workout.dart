import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/theme/color_theme.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';
import 'package:nurasoft_app/app/modules/main_modules/trackers/common_widgets/week_calender.dart';
import 'package:nurasoft_app/app/routes/routes.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppbar(),
      body: Column(
        children: [
          WeekCalender(
            activeBorderColor: Colors.teal[400],
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.teal[400],
            height: 40,
            width: double.infinity,
            child: const TextBLR(
              "Even standing is an excersice",
              color: whiteColor,
            ),
          ),
          const SizedBox(height: 200.0),
          TextButton(
              onPressed: () {
                context.pushNamed(AppRoutes.videocard);
              },
              child: Icon(
                Icons.add_box_outlined,
                size: 55,
                color: Colors.teal[300],
              ))
          //const Expanded(child: VideoCard()),
        ],
      ),
    );
  }
}

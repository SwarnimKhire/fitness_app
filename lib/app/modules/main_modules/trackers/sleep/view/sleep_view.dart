import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';
import 'package:nurasoft_app/app/modules/main_modules/trackers/common_widgets/center_progress.dart';
import 'package:nurasoft_app/app/modules/main_modules/trackers/common_widgets/week_calender.dart';
import 'package:nurasoft_app/app/modules/main_modules/trackers/common_widgets/weekly_insight.dart';
import 'package:nurasoft_app/app/modules/main_modules/trackers/sleep/view/widgets/sleep_time_tracker.dart';

class SleepTrackerView extends StatelessWidget {
  const SleepTrackerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const WeekCalender(
            activeBorderColor: Colors.purple,
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.purple,
            height: 40,
            width: double.infinity,
            child: const TextBLR(
              "Humans sleep for ~25 years in their lifetime.",
              color: whiteColor,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CenterProgress(
                  strokeWidth: 6,
                  iconData: Icons.nights_stay_outlined,
                  title: "Sleep Tracker",
                  color: Colors.purple,
                  iconColor: Colors.purple,
                  progressValue: 0.3,
                  valueText: "0 / 8 h",
                  size: 180,
                ),
              ],
            ),
          ),
          const SleepTimePicker(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: WeeklyInsights(
              width: 32,
            ),
          )
        ],
      ),
    );
  }
}

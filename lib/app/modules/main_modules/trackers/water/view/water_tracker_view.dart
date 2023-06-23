import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';
import 'package:nurasoft_app/app/modules/main_modules/trackers/common_widgets/center_progress.dart';
import 'package:nurasoft_app/app/modules/main_modules/trackers/common_widgets/week_calender.dart';
import 'package:nurasoft_app/app/modules/main_modules/trackers/common_widgets/weekly_insight.dart';

class WaterTrackerView extends StatelessWidget {
  const WaterTrackerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WeekCalender(
            activeBorderColor: Colors.blue[200],
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.blue[200],
            height: 40,
            width: double.infinity,
            child: const TextBLR(
              "70% of human body is water",
              color: whiteColor,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // If progress is zero dont show this
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: borderGreyColor),
                        child: const Icon(Icons.remove),
                      ),
                    ),
                    CenterProgress(
                      strokeWidth: 6,
                      iconData: Icons.nights_stay_outlined,
                      title: "Water Tracker",
                      color: Colors.blue[200],
                      iconColor: Colors.blue[200],
                      progressValue: 0.3,
                      valueText: "0 / 9 glass",
                      size: 180,
                    ),
                    // If progress is equal to total dont show this
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: borderGreyColor),
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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

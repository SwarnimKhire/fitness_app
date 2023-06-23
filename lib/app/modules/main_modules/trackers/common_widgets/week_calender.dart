import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nurasoft_app/app/core/core.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';
import 'package:provider/provider.dart';

class WeekCalender extends StatelessWidget {
  const WeekCalender({super.key, this.activeBorderColor, this.radius});
  final Color? activeBorderColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeekCalenderViewModel(),
      child:
          Consumer<WeekCalenderViewModel>(builder: (context, viewModel, child) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < viewModel.week.length; i++)
              GestureDetector(
                onTap: () => viewModel.setSelectedIndex(i),
                child: Container(
                  width: 45,
                  height: 60,
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: viewModel.selectedIndex == i
                          ? lightGreyColor
                          : Colors.transparent,
                      border: Border.all(
                          color: viewModel.selectedIndex == i
                              ? (activeBorderColor ?? blackColor)
                              : Colors.transparent),
                      borderRadius: BorderRadius.circular(radius ?? 12)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextBMSB(viewModel.getWeekName(viewModel.week[i])),
                      const SizedBox(height: 10),
                      TextBMSB(viewModel.getDay(viewModel.week[i]),
                          color: greyColor),
                    ],
                  ),
                ),
              )
          ],
        );
      }),
    );
  }
}

class WeekCalenderViewModel extends ChangeNotifier {
  WeekCalenderViewModel() {
    generateDateTimeList();
    selectedIndexInit();
    notifyListeners();
  }

  int selectedIndex = 0;
  DateTime now = DateTime.now();
  List<DateTime> week = [];

  DateTime getStartDate() {
    int currentWeekday = now.weekday;
    int daysToSubtract = currentWeekday - 1;
    DateTime startDate = now.subtract(Duration(days: daysToSubtract));
    return startDate;
  }

  setSelectedIndex(int index) {
    selectedIndex = index;
    print(week[index]);
    notifyListeners();
  }

  selectedIndexInit() {
    for (int i = 0; i < week.length; i++) {
      if (week[i].day == now.day &&
          week[i].month == now.month &&
          week[i].year == now.year) {
        selectedIndex = i;
        break;
      }
    }
  }

  DateTime getEndDate() {
    int currentWeekday = now.weekday;
    int daysToAdd = 7 - currentWeekday;
    DateTime endDate = now.add(Duration(days: daysToAdd));
    return endDate;
  }

  generateDateTimeList() {
    for (DateTime date = getStartDate();
        date.isBefore(getEndDate()) || date.isAtSameMomentAs(getEndDate());
        date = date.add(const Duration(days: 1))) {
      week.add(date);
    }
  }

  getWeekName(DateTime date) {
    return DateFormat.E().format(date).substring(0, 3);
  }

  getDay(DateTime date) {
    return date.day.toString();
  }
}

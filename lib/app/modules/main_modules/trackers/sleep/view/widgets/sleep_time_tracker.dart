import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nurasoft_app/app/core/core.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';
import 'package:provider/provider.dart';

class SleepTimePicker extends StatelessWidget {
  const SleepTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SleepTimePickerViewModel(),
      child: Consumer<SleepTimePickerViewModel>(
          builder: (context, viewModel, child) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: lightGreyColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextBLR("Today"),
              const SizedBox(height: 15),
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      viewModel.sleepTime = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      viewModel.callNotifier();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextBLR("Sleep time"),
                        const SizedBox(height: 10),
                        TextBLB(formatTime(viewModel.sleepTime ??
                            const TimeOfDay(hour: 00, minute: 00)))
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  GestureDetector(
                    onTap: () async {
                      viewModel.wakeTime = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      viewModel.callNotifier();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextBLR("Wake up time"),
                        const SizedBox(height: 10),
                        TextBLB(formatTime(viewModel.wakeTime ??
                            const TimeOfDay(hour: 00, minute: 00)))
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}

String formatTime(TimeOfDay time) {
  final now = DateTime.now();
  final dateTime =
      DateTime(now.year, now.month, now.day, time.hour, time.minute);
  final formatter = DateFormat.jm();
  return formatter.format(dateTime);
}

class SleepTimePickerViewModel extends ChangeNotifier {
  TimeOfDay? sleepTime;
  TimeOfDay? wakeTime;

  callNotifier() {
    notifyListeners();
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nurasoft_app/app/core/core.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';

class WeeklyInsights extends StatelessWidget {
  const WeeklyInsights(
      {super.key,
      this.barColor,
      this.barWidth = 6,
      this.height = 50,
      this.width = 35});
  final Color? barColor;
  final double barWidth;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeeklyInsightViewModel(),
      child: Consumer<WeeklyInsightViewModel>(
          builder: (context, viewModel, child) {
        return Container(
          decoration: BoxDecoration(
              color: lightGreyColor, borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextBLR("Weekly insights"),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < viewModel.weekData.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: width,
                            height: height,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: borderGreyColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: height,
                                  width: barWidth,
                                ),
                                Container(
                                  height: ((viewModel.weekData[i].progress ??
                                              1) /
                                          (viewModel.weekData[i].total ?? 1)) *
                                      height,
                                  width: barWidth,
                                  decoration: BoxDecoration(
                                    color: barColor ?? blackColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextBLR(viewModel.weekName[i] ?? "", color: greyColor)
                        ],
                      ),
                    )
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}

class WeeklyInsightViewModel extends ChangeNotifier {
  List<WeekInsightModel> weekData = List.filled(7, WeekInsightModel());
  List weekName = ["M", "Tu", "W", "Th", "F", "S", "S"];

  setWeekData(List<WeekInsightModel> wData) {
    weekData = wData;
    notifyListeners();
  }
}

class WeekInsightModel {
  String? weekName;
  double? total;
  double? progress;
  WeekInsightModel({
    this.weekName,
    this.total,
    this.progress,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (weekName != null) {
      result.addAll({'weekName': weekName});
    }
    if (total != null) {
      result.addAll({'total': total});
    }
    if (progress != null) {
      result.addAll({'progress': progress});
    }

    return result;
  }

  factory WeekInsightModel.fromMap(Map<String, dynamic> map) {
    return WeekInsightModel(
      weekName: map['weekName'],
      total: map['total']?.toDouble(),
      progress: map['progress']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeekInsightModel.fromJson(String source) =>
      WeekInsightModel.fromMap(json.decode(source));
}

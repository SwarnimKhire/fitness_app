import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';

class CenterProgress extends StatelessWidget {
  const CenterProgress(
      {super.key,
      required this.title,
      required this.valueText,
      required this.progressValue,
      required this.iconData,
      this.color,
      this.iconColor,
      this.size = 200,
      this.strokeWidth = 4.0});
  final String title;
  final String valueText;
  final double progressValue;
  final IconData iconData;
  final Color? color;
  final Color? iconColor;
  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: size,
            width: size,
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth,
              backgroundColor: borderGreyColor,
              color: color ?? blackColor,
              value: progressValue,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, size: 45, color: iconColor ?? blackColor),
              const SizedBox(height: 10),
              TextBLB(title),
              const SizedBox(height: 6),
              TextBLR(valueText, color: greyColor),
            ],
          )
        ],
      ),
    );
  }
}

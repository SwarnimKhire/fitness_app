import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurasoft_app/app/modules/helper_modules/texts/body_medium_semibold.dart';

import '../../core/theme/color_theme.dart';
import '../../core/values/constant.dart';

class GridCard extends StatelessWidget {
  const GridCard({super.key, this.isGreen = false, required this.title});
  final bool isGreen;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 170,
      // width: 156,
      decoration: BoxDecoration(
        color: isGreen ? blackColor : secondaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 118.0, top: 15, right: 16),
            child: SvgPicture.asset(AssetSvg.refresh),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 30.0, right: 16.0, bottom: 16.0, top: 80),
            child: TextBMSB(
              title,
              color: whiteColor,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/modules/helper_modules/texts/body_medium_semibold.dart';

import '../../core/theme/color_theme.dart';

class GridCard extends StatelessWidget {
  const GridCard(
      {super.key,
      this.isGreen = false,
      required this.title,
      required this.img});
  final bool isGreen;
  final String title;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 170,
      width: 156,
      decoration: BoxDecoration(
        color: isGreen ? blackColor : secondaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          Center(
            child: Image.asset('assets/images/$img.png'),
          ),
          //SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 18),
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

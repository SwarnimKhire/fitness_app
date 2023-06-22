import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurasoft_app/app/core/core.dart';
import 'package:nurasoft_app/app/modules/helper_modules/appbar/main_appbar.dart';
import 'package:nurasoft_app/app/modules/helper_modules/card.dart';
import 'package:nurasoft_app/app/modules/helper_modules/texts/body_medium_semibold.dart';
import 'package:nurasoft_app/app/modules/main_modules/home/view/homescreens.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(
        isLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset(AssetSvg.menu),
        ),
        title: homeTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              height: 142,
              //width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: whiteColor),
                        ),
                        SizedBox(height: 6),
                        TextBMSB(
                          'It is health that is real wealth\nand not pieces of gold and\nsilver.',
                          color: whiteColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 142,
                      width: 113,
                      child: Image.asset('assets/images/runner.png'))
                ],
              ),
            ),
            const Wrap(
              spacing: 15,
              runSpacing: 15,
              children: [
                GridCard(isGreen: true),
                GridCard(),
                GridCard(),
                GridCard(isGreen: true)
              ],
            )

          ],
        ),
      ),
    );
  }
}

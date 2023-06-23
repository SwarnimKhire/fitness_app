import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurasoft_app/app/core/core.dart';
import 'package:nurasoft_app/app/modules/helper_modules/card.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';
import 'package:nurasoft_app/app/modules/main_modules/home/view/homescreens.dart';
import 'package:nurasoft_app/app/routes/routes.dart';
import 'package:nurasoft_app/main.dart';

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                context.pushNamed(AppRoutes.profile);
              },
              child: const Icon(
                Icons.account_circle_outlined,
                color: blackColor,
                size: 35,
              ),
            ),
          )
        ],
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
            Wrap(
              spacing: 15,
              runSpacing: 15,
              children: [
                InkWell(
                  child: const GridCard(
                    isGreen: true,
                    title: 'Water Tracker',
                    img: 'waterr',
                  ),
                  onTap: () {
                    context.pushNamed(AppRoutes.waterTracker);
                  },
                ),
                InkWell(
                  child: const GridCard(
                    title: 'Sleep Tracker',
                    img: 'sleep',
                  ),
                  onTap: () {
                    context.pushNamed(AppRoutes.sleepTracker);
                  },
                ),
                InkWell(
                  child: const GridCard(
                    title: 'Workout Tracker',
                    img: 'w80',
                  ),
                  onTap: () {
                    context.pushNamed(AppRoutes.workoutTracker);
                  },
                ),
                InkWell(
                  child: const GridCard(
                    isGreen: true,
                    title: 'Calorie Tracker',
                    img: 'caloo',
                  ),
                  onTap: () {
                    context.pushNamed(AppRoutes.foodTracker);
                  },
                )
              ],
            ),
            const SizedBox(height: 85.0),
            MainTextButton(
              text: "Log Out",
              onTap: () {
                sharedPreferences.remove("user");
                context.pushNamed(AppRoutes.login);
              },
            )
          ],
        ),
      ),
    );
  }
}

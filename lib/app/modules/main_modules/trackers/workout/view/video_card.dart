import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';
import 'package:nurasoft_app/app/modules/main_modules/trackers/workout/view/workout_list.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppbar(),
      body: SizedBox(
        height: 700,
        child: ListView.builder(
            itemCount: workoutNames.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                alignment: Alignment.center,
                height: 90,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.teal[50]),
                child: ListTile(
                  leading: Image.network(
                      'https://source.unsplash.com/random/200x200?${workoutNames[index]}'),
                  title: TextBMB(workoutNames[index]),
                  subtitle: TextBSM(workoutDescriptions[index]),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: blackColor),
                      child: const Icon(
                        Icons.add,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

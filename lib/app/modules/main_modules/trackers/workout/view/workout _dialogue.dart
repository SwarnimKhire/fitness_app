import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';
import 'package:nurasoft_app/app/modules/helper_modules/texts/heading_h4.dart';
import 'package:nurasoft_app/main.dart';
import 'package:path/path.dart';

showWorkoutDialogue() {
  showModalBottomSheet(
    context: navigatorekey.currentContext!,
    builder: (context) {
      time = 
      Container(
        height: 200,
        width: 200,
        child: Column(children: [
          HeadingH4('Time'),
          MainTextfield(
            hintText: 'Enter time',
          ),
          Radio(value: 'hour', groupValue: 'time', onChanged:  (value) {
            
          }, ),
          Radio(value: 'minute', groupValue: 'time', onChanged: (value) {
            
          },  ),
          Radio(value: 'second', groupValue: 'time', onChanged:  (value) {
            
          },),
        ]),
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';

class MainTextButton extends StatelessWidget {
  const MainTextButton(
      {super.key, required this.text, this.onTap, this.isHolo = false});
  final String text;
  final bool isHolo;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isHolo ? Colors.transparent : primaryColor,
            border:isHolo?  Border.all(color: blackColor): Border.all()),
        width: double.infinity,
        height: 56,
        child: TextBLB(text, color: isHolo ? blackColor : whiteColor),
      ),
    );
  }
}

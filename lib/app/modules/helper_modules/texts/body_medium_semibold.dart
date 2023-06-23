import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';

class TextBMSB extends StatelessWidget {
  const TextBMSB(this.text, {super.key, this.color, this.textAlign});
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: text600.copyWith(fontSize: 15, color: color ?? primaryColor),
      textAlign: textAlign,
    );
  }
}

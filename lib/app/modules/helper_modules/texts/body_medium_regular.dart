import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';

class TextBMR extends StatelessWidget {
  const TextBMR(this.text, {super.key, this.color, this.textAlign});
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: text400.copyWith(fontSize: 11, color: color ?? primaryColor),
      textAlign: textAlign,
    );
  }
}

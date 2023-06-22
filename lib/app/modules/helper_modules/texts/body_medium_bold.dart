import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';

class TextBMB extends StatelessWidget {
  const TextBMB(this.text, {super.key, this.color, this.textAlign});
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: text700.copyWith(fontSize: 16, color: color ?? primaryColor),
      textAlign: textAlign,
    );
  }
}

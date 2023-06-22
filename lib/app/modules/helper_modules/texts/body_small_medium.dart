import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';

class TextBSM extends StatelessWidget {
  const TextBSM(this.text, {super.key, this.color, this.textAlign});
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: text500.copyWith(fontSize: 12, color: color ?? primaryColor),
      textAlign: textAlign,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';

class TextBLB extends StatelessWidget {
  const TextBLB(this.text, {super.key, this.color, this.textAlign});
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

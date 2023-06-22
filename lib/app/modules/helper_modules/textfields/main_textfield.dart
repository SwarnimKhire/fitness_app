import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';

class MainTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool? enabled;
  final bool obscureText;
  final String? hintText;
  const MainTextfield(
      {Key? key,
      this.controller,
      this.obscureText = false,
      this.onChanged,
      this.onSubmitted,
      this.onTap,
      this.inputDecoration = const InputDecoration(),
      this.keyboardType,
      this.maxLength,
      this.enabled,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        onTap: onTap,
        obscureText: obscureText,
        decoration: inputDecoration?.copyWith(
          hintText: hintText,
          hintStyle: text400,
          filled: true,
          fillColor: lightGreyColor,
          contentPadding: const EdgeInsets.all(16),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: primaryColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
        style: text600.copyWith(color: primaryColor),
        keyboardType: keyboardType,
        maxLength: maxLength,
        enabled: enabled,
      ),
    );
  }
}

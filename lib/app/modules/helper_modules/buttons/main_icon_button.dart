import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';

class MainIconButton extends StatelessWidget {
  const MainIconButton({super.key, this.iconData, this.child, this.onTap});
  final IconData? iconData;
  final Widget? child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 56,
        decoration: BoxDecoration(
            border: Border.all(color: borderGreyColor),
            borderRadius: BorderRadius.circular(16)),
        child: iconData != null ? Icon(iconData) : child,
      ),
    );
  }
}

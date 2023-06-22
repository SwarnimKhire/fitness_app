import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';
import 'package:nurasoft_app/app/routes/routes.dart';

class MainBackButton extends StatelessWidget {
  const MainBackButton({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all((kToolbarHeight - 40) / 2),
      child: GestureDetector(
        onTap: onTap ?? () => context.pop(),
        child: Container(
          height: 40,
          width: 40,
          constraints: const BoxConstraints(maxHeight: 40, maxWidth: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderGreyColor),
          ),
          child: const Icon(
            Icons.chevron_left_rounded,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

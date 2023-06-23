import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';

class SingleDetailCard extends StatelessWidget {
  const SingleDetailCard(
      {super.key, this.title, this.subTitle, this.iconData, this.onTap});
  final String? title;
  final String? subTitle;
  final IconData? iconData;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[100],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (iconData != null) Icon(iconData),
                  const SizedBox(width: 10),
                  TextBLB(title ?? ""),
                ],
              ),
              TextBLB(subTitle ?? "", color: greyColor),
            ],
          ),
        ),
      ),
    );
  }
}

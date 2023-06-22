import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';

class MainDivider extends StatelessWidget {
  const MainDivider({super.key, this.ltd = true});
  final bool ltd;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 1,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: ltd
                    ? [borderGreyColor.withOpacity(0), borderGreyColor]
                    : [borderGreyColor, borderGreyColor.withOpacity(0)])),
      ),
    );
  }
}

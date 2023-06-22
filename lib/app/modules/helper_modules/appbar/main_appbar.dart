import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/core.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbar(
      {super.key,
      this.title,
      this.centerTitle = true,
      this.onBackTap,
      this.actions,
      this.isLeading = true,
      this.leading,
       })
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  final String? title;
  final bool? centerTitle;
  final void Function()? onBackTap;
  final List<Widget>? actions;
  final bool isLeading;
  final Widget? leading;
  

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: whiteColor,
      leading: leading ?? (isLeading ? MainBackButton(onTap: onBackTap) : null),
      elevation: 0,
      title: HeadingH5(title??""),
      centerTitle: centerTitle,
      actions: actions,
      automaticallyImplyLeading: false,
    );
  }

  @override
  // TODO: implement preferredSize
  final Size preferredSize;
}

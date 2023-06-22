import 'package:flutter/material.dart';

extension RoutesExt on BuildContext {
  pushNamed(String routeName, {Object? arguments}) {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  pop() {
    return Navigator.pop(this);
  }
}

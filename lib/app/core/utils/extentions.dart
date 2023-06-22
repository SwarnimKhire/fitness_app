import 'package:flutter/material.dart';

extension GetFocus on Widget {
  keyOut(BuildContext context) {
    return GestureDetector(
      child: this,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
    );
  
  }
}

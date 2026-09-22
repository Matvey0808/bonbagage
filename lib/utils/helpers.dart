import 'package:flutter/material.dart';

class HelpersTextField {
  static BorderRadius border = BorderRadius.all(Radius.circular(12));
  static BorderSide borderSide = BorderSide(width: 3, color: Colors.black26);

  static final styleTextField = OutlineInputBorder(
      borderRadius: border,
      borderSide: borderSide,
  );
}

class HelpersElevatedButton {
  static final elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.black12,
    shape: RoundedRectangleBorder(borderRadius: HelpersTextField.border),
    padding: EdgeInsets.only(left: 10, right: 10)
  );
}
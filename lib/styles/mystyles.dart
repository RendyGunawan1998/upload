import 'package:baru_nih/styles/mycolors.dart';
import 'package:flutter/material.dart';

class MyStyles {
  static TextStyle primaryTextStyle({double size = 14.0}) => TextStyle(
    color: MyColors.appPrimaryText,
    fontSize: size,
  );
  static TextStyle otpTextStyle({double size = 20.0}) => TextStyle(
      color: MyColors.appPrimaryText,
      fontSize: size,
      fontWeight: FontWeight.bold);

  static BoxDecoration bottomAppBarDecoration() => BoxDecoration(
    gradient: LinearGradient(
        colors: [MyColors.loginGradientEnd, MyColors.loginGradientStart],
        begin: const FractionalOffset(0.2, 0.2),
        end: const FractionalOffset(1.2, 1.2),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
  );

  static BoxDecoration bottomAppBarDecorationInspectorFilter() => BoxDecoration(
    gradient: LinearGradient(
        colors: [Colors.grey.shade100, Colors.grey.shade200],
        begin: FractionalOffset(0.2, 0.2),
        end: FractionalOffset(1.2, 1.2),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
  );
}

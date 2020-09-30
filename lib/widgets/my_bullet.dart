import 'package:baru_nih/styles/mycolors.dart';
import 'package:flutter/material.dart';

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 6.0,
      width: 6.0,
      decoration: new BoxDecoration(
        color: MyColors.appPrimaryText2,
        shape: BoxShape.circle,
      ),
    );
  }
}

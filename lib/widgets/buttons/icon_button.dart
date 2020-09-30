import 'package:baru_nih/styles/mycolors.dart';
import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color fillColor;
  final VoidCallback onPressed;

  IconButtonWidget(
      {Key key, this.onPressed, this.iconColor, this.fillColor, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(),
      onPressed: onPressed,
      child: Icon(
        icon,
        color: iconColor ?? MyColors.white,
        size: 24.0,
      ),
      shape: CircleBorder(),
      fillColor: fillColor ?? MyColors.appPrimaryColor,
      padding: EdgeInsets.all(8.0),
    );
  }
}

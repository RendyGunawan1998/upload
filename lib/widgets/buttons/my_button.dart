import 'package:flutter/material.dart';

class MyButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color color;
  final double fontSize;
  final Color fontColor;
  final IconData iconData;

  const MyButtonWidget(
      {Key key,
      this.onPressed,
      this.title,
      this.color,
      this.fontSize,
      this.fontColor,
      this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: color,
        textColor: fontColor,
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(iconData, color: fontColor),
            Text(" "),
            Text(
              title,
              style: TextStyle(
                color: fontColor,
                fontSize: fontSize,
              ),
            ),
          ],
        ),
        onPressed: () {
          onPressed();
        });
  }
}

import 'package:flutter/material.dart';

class RaiseButtonIconWidget extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  final String title;
  final Color color;
  final Color fontColor;

  const RaiseButtonIconWidget(
      {Key key,
      this.iconData,
      this.onPressed,
      this.title,
      this.color,
      this.fontColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialButton(
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(5.0),
      ),
      color: Colors.teal,
      onPressed: () => onPressed(),
      child: new Container(
        padding: const EdgeInsets.symmetric(
          vertical: 14.0,
          horizontal: 14.0,
        ),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(iconData, color: fontColor),
            Text(" "),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: fontColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

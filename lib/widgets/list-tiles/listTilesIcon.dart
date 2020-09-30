import 'package:flutter/material.dart';

class ListTilesIconWidget extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String title;
  final String subTitle;
  final bool border;

  const ListTilesIconWidget(
      {Key key,
      this.iconData,
      this.iconColor,
      this.title,
      this.subTitle,
      this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      // contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: border
            ? new BoxDecoration(
                border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.grey),
                ),
              )
            : null,
        child: Icon(iconData, color: iconColor),
      ),
      title: Text(
        title,
        // style: TextStyle(color: titleColor, fontSize: 14.0),
      ),
      subtitle: Text(
        subTitle,
      ),
    );
  }
}

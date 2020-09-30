import 'package:flutter/material.dart';

class ListTilesMenuWidget extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String title;
  final String subTitle;
  final bool border;

  const ListTilesMenuWidget({
    Key key,
    this.iconData,
    this.iconColor,
    this.title,
    this.subTitle,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    // var textTheme = theme.textTheme;

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
        // style: TextStyle(
        //   fontSize: 16.0,
        //   fontWeight: FontWeight.bold,
        // ),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(
          fontSize: 12.0,
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: iconColor),
    );
  }
}

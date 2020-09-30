import 'package:flutter/material.dart';
import 'package:baru_nih/styles/mycolors.dart';

class LoadDataError extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color bgColor;

  const LoadDataError({Key key, this.title, this.subtitle, this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Center(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 0),
              child: CircleAvatar(
                radius: 28,
                child: Text(
                  ':(',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                foregroundColor: Colors.white,
                backgroundColor: bgColor ?? MyColors.appPrimaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Text(
                title,
                textAlign: TextAlign.center,
                // style: textTheme.title,
                style: textTheme.display1.copyWith(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: textTheme.display1.copyWith(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:baru_nih/styles/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:baru_nih/utils/all_translate.dart';

class PlaceHolderContent extends StatelessWidget {
  PlaceHolderContent({this.title, this.message, this.tryAgainButton});
  final String title;
  final String message;
  final ValueChanged<bool> tryAgainButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 24.0,
                color: MyColors.appPrimaryText,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              message,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 16.0,
                color: MyColors.appPrimaryText,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: RaisedButton(
                  padding: EdgeInsets.only(
                      left: 25.0, right: 25.0, top: 12.0, bottom: 12.0),
                  child: Text(
                    allTranslations.text("try_again"),
                    textDirection: TextDirection.ltr,
                  ),
                  onPressed: () => tryAgainButton(true)),
            ),
          ]),
    );
  }
}

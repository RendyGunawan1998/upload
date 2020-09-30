import 'package:baru_nih/models/popmenu.dart';
import 'package:baru_nih/styles/mycolors.dart';
import 'package:flutter/material.dart';

class PopUPMenuWidget extends StatelessWidget {
  final PopupMenuModel choice;

  const PopUPMenuWidget(this.choice, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(choice.title),
        Icon(
          choice.icon,
          color: MyColors.appPrimaryText,
          size: 18,
        ),
      ],
    );
  }
}
